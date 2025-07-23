package com.loginapp.crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String table = req.getParameter("table");
        String id = req.getParameter("id");

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");

            Statement stmt = conn.createStatement();
            stmt.executeUpdate("DELETE FROM " + table + " WHERE id=" + id);
            res.sendRedirect("Home.jsp?selectedTable=" + table);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    } 
}   