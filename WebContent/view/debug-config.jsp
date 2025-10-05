<%@ page import="java.io.InputStream,java.util.Properties" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Debug Config</title>
  <style>body{font-family:Arial,Helvetica,sans-serif;background:#071025;color:#e6eef6;padding:18px} code{background:#051523;padding:2px 6px;border-radius:4px;color:#8ae0ff}</style>
</head>
<body>
  <h2>Runtime config check</h2>
  <p>This page checks where Telegram config values are available at runtime. Values are masked for safety.</p>
  <%
    String envToken = System.getenv("TELEGRAM_BOT_TOKEN");
    String envChat = System.getenv("TELEGRAM_CHAT_ID");
    String propToken = System.getProperty("TELEGRAM_BOT_TOKEN");
    String propChat = System.getProperty("TELEGRAM_CHAT_ID");

    // helper to mask
    java.util.function.Function<String,String> mask = s -> {
      if (s == null) return null;
      if (s.length() <= 8) return "****";
      return s.substring(0,4) + "…" + s.substring(s.length()-4);
    };

    out.println("<h3>Environment variables</h3>");
    out.println("<p>TELEGRAM_BOT_TOKEN: <code>" + (envToken!=null? mask.apply(envToken) : "(not set)") + "</code></p>");
    out.println("<p>TELEGRAM_CHAT_ID: <code>" + (envChat!=null? mask.apply(envChat) : "(not set)") + "</code></p>");

    out.println("<h3>System properties (.env)</h3>");
    out.println("<p>TELEGRAM_BOT_TOKEN: <code>" + (propToken!=null? mask.apply(propToken) : "(not set)") + "</code></p>");
    out.println("<p>TELEGRAM_CHAT_ID: <code>" + (propChat!=null? mask.apply(propChat) : "(not set)") + "</code></p>");

    out.println("<h3>WEB-INF/config.properties</h3>");
    try (InputStream is = application.getResourceAsStream("/WEB-INF/config.properties")){
      if (is == null){ out.println("<p><em>WEB-INF/config.properties not found</em></p>"); }
      else {
        Properties p = new Properties(); p.load(is);
        String ctoken = p.getProperty("telegram.bot.token");
        String cchat = p.getProperty("telegram.chat.id");
        out.println("<p>telegram.bot.token: <code>" + (ctoken!=null? mask.apply(ctoken) : "(not set)") + "</code></p>");
        out.println("<p>telegram.chat.id: <code>" + (cchat!=null? mask.apply(cchat) : "(not set)") + "</code></p>");
      }
    } catch(Exception e){ out.println("<p style='color:#fcc'>Error reading config.properties: " + e.getMessage() + "</p>"); }

    // Decide which source ContactServlet would use (same logic)
    String used = null;
    if (envToken != null && envChat != null) used = "environment variables";
    else if (propToken != null && propChat != null) used = ".env / System properties";
    else {
      try (InputStream is2 = application.getResourceAsStream("/WEB-INF/config.properties")){
        if (is2 != null) {
          Properties p2 = new Properties(); p2.load(is2);
          if (p2.getProperty("telegram.bot.token") != null && p2.getProperty("telegram.chat.id") != null) used = "WEB-INF/config.properties";
        }
      } catch(Exception e) { /* ignore */ }
    }
    out.println("<h3>Resolved source</h3>");
    out.println("<p>ContactServlet would use: <strong>" + (used!=null? used : "NOT CONFIGURED") + "</strong></p>");
  %>

  <p>If the page reports NOT CONFIGURED, place a .env in the webapp root or set environment variables and restart Tomcat.</p>
  <p>To avoid exposing secrets, this page masks values. If you want full values printed for debugging, request that explicitly.</p>
</body>
</html>
