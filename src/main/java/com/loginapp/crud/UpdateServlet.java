package com.loginapp.crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String table = req.getParameter("table");
        String id = req.getParameter("id");

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " WHERE id=" + id + " LIMIT 1");
            ResultSetMetaData meta = rs.getMetaData();

            StringBuilder set = new StringBuilder();
            for (int i = 2; i <= meta.getColumnCount(); i++) {
                String col = meta.getColumnName(i);
                String val = req.getParameter(col);
                set.append(col).append("='").append(val).append("',");
            }

            String sql = "UPDATE " + table + " SET " + set.substring(0, set.length()-1) + " WHERE id=" + id;
            stmt.executeUpdate(sql);
            res.sendRedirect("Home.jsp?selectedTable=" + table);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
