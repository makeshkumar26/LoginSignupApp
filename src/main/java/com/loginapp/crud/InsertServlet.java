package com.loginapp.crud;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class InsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String table = req.getParameter("table");

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " LIMIT 1");
            ResultSetMetaData meta = rs.getMetaData();

            StringBuilder columns = new StringBuilder();
            StringBuilder values = new StringBuilder();
            for (int i = 2; i <= meta.getColumnCount(); i++) {
                String col = meta.getColumnName(i);
                String val = req.getParameter(col);
                columns.append(col).append(",");
                values.append("'").append(val).append("',");
            }

            String sql = "INSERT INTO " + table + "(" + columns.substring(0, columns.length()-1) + ") VALUES (" + values.substring(0, values.length()-1) + ")";
            stmt.executeUpdate(sql);
            res.sendRedirect("Home.jsp?selectedTable=" + table);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
