package com.ta.webapp.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletContext;

/**
 * Simple .env loader for local/dev usage.
 *
 * It attempts to locate a .env file in the application working directory or the webapp root
 * and load KEY=VALUE lines into System properties if the corresponding env var is not set.
 *
 * Note: For production, prefer actual environment variables or a secret manager.
 */
public final class DotenvLoader {

    private DotenvLoader() {}

    /**
     * Try load .env from given path. If found, parse lines KEY=VALUE and set System properties
     * (only if System.getenv(KEY) == null and System.getProperty(KEY) == null).
     */
    public static void loadFromFile(File f) {
        if (f == null || !f.exists() || !f.isFile()) return;
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f), StandardCharsets.UTF_8))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                int idx = line.indexOf('=');
                if (idx <= 0) continue;
                String key = line.substring(0, idx).trim();
                String val = line.substring(idx + 1).trim();
                // Strip optional surrounding quotes
                if ((val.startsWith("\"") && val.endsWith("\"")) || (val.startsWith("'") && val.endsWith("'"))) {
                    val = val.substring(1, val.length()-1);
                }
                // Only set if not already present in env or system properties
                if (System.getenv(key) == null && System.getProperty(key) == null) {
                    System.setProperty(key, val);
                }
            }
        } catch (IOException e) {
            System.err.println("Failed to read .env file: " + e.getMessage());
        }
    }

    /**
     * Convenience: try common locations for .env (app root, current dir)
     */
    public static void autoLoad() {
        // Current working directory
        loadFromFile(new File(".env"));
        // If WEB-INF/.env exists, it'll be found by webapp root when run from container - try web-inf relative
        loadFromFile(new File("WEB-INF/.env"));
        // Also try relative path one level up
        loadFromFile(new File("../.env"));
    }

    /**
     * Load .env from the webapp real path (ServletContext.getRealPath("/"))
     * This is useful when the container's working directory is different from the webapp root.
     */
    public static void loadFromServletContext(ServletContext ctx) {
        if (ctx == null) return;
        try {
            String real = ctx.getRealPath("/");
            if (real != null) {
                File root = new File(real);
                File env = new File(root, ".env");
                loadFromFile(env);
                // also try WEB-INF/.env
                File webinfEnv = new File(root, "WEB-INF/.env");
                loadFromFile(webinfEnv);
            }
        } catch (Exception e) {
            System.err.println("Failed to load .env from servlet context: " + e.getMessage());
        }
    }
}
