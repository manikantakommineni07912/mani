package com.eventwizard.platform.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DatabaseUtility - Handles JDBC connectivity to the MySQL event system database.
 * Fully rewritten version with new variable and method names.
 */
public class DatabaseBridge {

    // Database connection parameters
    private static final String DATABASE_URL = "jdbc:mysql://localhost:3333/event_db";
    private static final String DATABASE_USER = "admin";
    private static final String DATABASE_PASSWORD = "admin";

    // Load JDBC driver when the class is initialized
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException driverLoadError) {
            driverLoadError.printStackTrace();
        }
    }

    /**
     * Establish and return a live connection to the MySQL database.
     *
     * @return Connection object if successful
     * @throws SQLException if a database access error occurs
     */
    public static Connection openConnection() throws SQLException {
        return DriverManager.getConnection(DATABASE_URL, DATABASE_USER, DATABASE_PASSWORD);
    }
}
