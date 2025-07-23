package com.loginapp.crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class EditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String table = req.getParameter("table");
        String id = req.getParameter("id");
        req.setAttribute("table", table);
        req.setAttribute("id", id);
        RequestDispatcher rd = req.getRequestDispatcher("Edit.jsp");
        rd.forward(req, res);
    }
}
