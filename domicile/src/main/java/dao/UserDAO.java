package dao;

import util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private Connection connection;

    public UserDAO() {
        connection = DatabaseConnection.getConnection();
    }

    // Authenticate user
    public String authenticate(String email, String password) throws SQLException {
        String query = "SELECT role FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role");
                }
            }
        }
        return null;
    }

    // Register client
    public void registerClient(String name, String email, String phone, String password) throws SQLException {
        String userQuery = "INSERT INTO users (email, password, role) VALUES (?, ?, 'client')";
        String clientQuery = "INSERT INTO clients (name, phone, user_id) VALUES (?, ?, ?)";

        try (PreparedStatement userStmt = connection.prepareStatement(userQuery, PreparedStatement.RETURN_GENERATED_KEYS);
             PreparedStatement clientStmt = connection.prepareStatement(clientQuery)) {

            // Insert user
            userStmt.setString(1, email);
            userStmt.setString(2, password);
            userStmt.executeUpdate();

            try (ResultSet rs = userStmt.getGeneratedKeys()) {
                if (rs.next()) {
                    int userId = rs.getInt(1);

                    // Insert client details
                    clientStmt.setString(1, name);
                    clientStmt.setString(2, phone);
                    clientStmt.setInt(3, userId);
                    clientStmt.executeUpdate();
                }
            }
        }
    }
}
