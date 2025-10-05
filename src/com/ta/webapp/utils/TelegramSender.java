package com.ta.webapp.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * Utility class to send messages to the Telegram Bot API.
 * Token and chat_id are passed in (not hardcoded in this class).
 */
public class TelegramSender {

    /**
     * Gửi tin nhắn tới Telegram.
     * @param token bot token (xx:AAA...)
     * @param chatId chat id (số hoặc @channel)
     * @param text nội dung tin nhắn (plain text, có thể chứa các ký tự Unicode)
     * @return true nếu Telegram trả về HTTP 2xx, false nếu không
    * @throws IOException when a connection or read/write error occurs
     */
    public static boolean sendMessage(String token, String chatId, String text) throws IOException {
        if (token == null || token.isEmpty()) throw new IllegalArgumentException("token is required");
        if (chatId == null || chatId.isEmpty()) throw new IllegalArgumentException("chatId is required");

    // Build URL (do NOT encode the token in the path)
    String endpoint = "https://api.telegram.org/bot" + token + "/sendMessage";
    // Use URI to build URL to avoid deprecated URL(String) warning
    URL url = URI.create(endpoint).toURL();

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(10000);
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

        // Prepare payload
        String payload = "chat_id=" + URLEncoder.encode(chatId, StandardCharsets.UTF_8.name())
                + "&text=" + URLEncoder.encode(text, StandardCharsets.UTF_8.name())
                + "&parse_mode=HTML"; // use HTML safe if needed

        // Send
        try (OutputStream os = conn.getOutputStream()) {
            os.write(payload.getBytes(StandardCharsets.UTF_8));
            os.flush();
        }

        int code = conn.getResponseCode();
        InputStream is = code >= 200 && code < 300 ? conn.getInputStream() : conn.getErrorStream();

        StringBuilder resp = new StringBuilder();
        if (is != null) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
                String line;
                while ((line = br.readLine()) != null) {
                    resp.append(line).append('\n');
                }
            }
        }

        if (code >= 200 && code < 300) {
            return true;
        } else {
            // Log minimal error to stderr (server logs)
            System.err.println("Telegram sendMessage failed. HTTP=" + code + " response=" + resp.toString());
            return false;
        }
    }
}
