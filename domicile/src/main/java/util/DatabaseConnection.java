package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/livraison"; // Update with your DB name
    private static final String USER = "root"; // Update with your DB username
    private static final String PASSWORD = "1234"; // Update with your DB password

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
