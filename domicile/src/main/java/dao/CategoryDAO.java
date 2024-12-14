package dao;

import model.Category;
import util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private Connection connection;

    public CategoryDAO() {
        connection = DatabaseConnection.getConnection();
    }

    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
