package com.ta.webapp.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // forward to JSP which contains the single-page content
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
