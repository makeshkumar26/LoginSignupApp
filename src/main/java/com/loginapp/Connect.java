package com.loginapp;

import java.sql.*;

public class Connect {
    private static final String DB_URL = "jdbc:mariadb://127.0.0.1:3310/mysql";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
