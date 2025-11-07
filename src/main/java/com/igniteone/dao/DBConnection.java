package com.igniteone.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mariadb://localhost:3306/igniteone_db";
    private static final String USER = "root";  
    private static final String PASSWORD = "root"; 

    // Method to establish connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MariaDB JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully!");

        } catch (ClassNotFoundException e) {
            System.out.println("MariaDB JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Failed to connect to database.");
            e.printStackTrace();
        }
        return conn;
    }

    // Test method (run this as Java Application)
    public static void main(String[] args) {
        getConnection();
    }
}
