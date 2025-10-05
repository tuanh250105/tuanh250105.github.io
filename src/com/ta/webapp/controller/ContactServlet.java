package com.ta.webapp.controller;

import com.ta.webapp.utils.TelegramSender;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

/**
 * Servlet xử lý POST từ contact form.
 * URL mapping: /contact
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    private String botToken;
    private String chatId;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Load config.properties từ WEB-INF/config.properties
        try (InputStream is = config.getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
            if (is != null) {
                Properties p = new Properties();
                p.load(is);
                botToken = p.getProperty("telegram.bot.token");
                chatId = p.getProperty("telegram.chat.id");
            } else {
                log("/WEB-INF/config.properties not found. Telegram not configured.");
            }
        } catch (IOException e) {
            log("Failed to load config.properties", e);
        }

    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        try (PrintWriter out = resp.getWriter()) {
            // Validate
            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty()
                    || message == null || message.trim().length() < 5) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print('{'+"\"status\":\"error\",\"message\":\"Please fill all required fields.\""+'}');
                return;
            }

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

    // Minimal HTML escaping to avoid accidental markup in Telegram HTML mode
    private String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    }
}
