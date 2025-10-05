package com.ta.webapp.servlet;

import com.ta.webapp.utils.TelegramSender;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

/**
 * ContactServlet xử lý POST từ form liên hệ.
 * Mapped via web.xml -> /contact
 */
public class ContactServlet extends HttpServlet {

    private String botToken;
    private String chatId;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Prefer environment variables. Also auto-load .env into System properties for local dev.
        try {
            com.ta.webapp.utils.DotenvLoader.loadFromServletContext(config.getServletContext());
        } catch (Throwable t) {
            // fallback to generic autoLoad
            com.ta.webapp.utils.DotenvLoader.autoLoad();
        }

        String envToken = System.getenv("TELEGRAM_BOT_TOKEN");
        String envChat = System.getenv("TELEGRAM_CHAT_ID");
        if (isNonEmpty(envToken) && isNonEmpty(envChat)) {
            botToken = envToken;
            chatId = envChat;
            log("Loaded Telegram config from environment variables.");
            return;
        }

        // Next, check System properties (populated by .env loader)
        String propToken = System.getProperty("TELEGRAM_BOT_TOKEN");
        String propChat = System.getProperty("TELEGRAM_CHAT_ID");
        if (isNonEmpty(propToken) && isNonEmpty(propChat)) {
            botToken = propToken;
            chatId = propChat;
            log("Loaded Telegram config from System properties (e.g. .env)");
            return;
        }

        // Fallback to WEB-INF/config.properties
        try (InputStream is = config.getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
            if (is != null) {
                Properties p = new Properties();
                p.load(is);
                botToken = p.getProperty("telegram.bot.token");
                chatId = p.getProperty("telegram.chat.id");
                log("Loaded Telegram config from WEB-INF/config.properties");
            } else {
                log("/WEB-INF/config.properties not found. Telegram not configured.");
            }
        } catch (IOException e) {
            log("Failed to load config.properties", e);
        }
    }

    private boolean isNonEmpty(String s) { return s != null && !s.trim().isEmpty(); }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        try (PrintWriter out = resp.getWriter()) {
            // Validate: non-empty and message length
            if (name == null || name.trim().isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print('{'+"\"status\":\"error\",\"message\":\"Name is required.\""+'}');
                return;
            }
            if (email == null || email.trim().isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print('{'+"\"status\":\"error\",\"message\":\"Email is required.\""+'}');
                return;
            }
            if (message == null || message.trim().length() < 5) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print('{'+"\"status\":\"error\",\"message\":\"Message must be at least 5 characters.\""+'}');
                return;
            }

            // Strict email validation (simple RFC-like regex, reasonable for server-side check)
            String emailTrim = email.trim();
            String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
            if (!emailTrim.matches(emailRegex)) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print('{'+"\"status\":\"error\",\"message\":\"Invalid email address.\""+'}');
                return;
            }
            email = emailTrim;

            if (botToken == null || botToken.isEmpty() || chatId == null || chatId.isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print('{'+"\"status\":\"error\",\"message\":\"Server not configured to send messages.\""+'}');
                return;
            }

            // Format message
            StringBuilder txt = new StringBuilder();
            txt.append("📩 New contact message:\n");
            txt.append("👤 Name: ").append(escapeHtml(name)).append("\n");
            txt.append("📧 Email: ").append(escapeHtml(email)).append("\n");
            txt.append("💬 Message: ").append(escapeHtml(message));

            boolean sent;
            try {
                sent = TelegramSender.sendMessage(botToken, chatId, txt.toString());
            } catch (Exception e) {
                log("Error sending telegram message", e);
                sent = false;
            }

            if (sent) {
                out.print('{'+"\"status\":\"ok\",\"message\":\"Message sent successfully!\""+'}');
            } else {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print('{'+"\"status\":\"error\",\"message\":\"Failed to send message.\""+'}');
            }
        }
    }

    private String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }
}
