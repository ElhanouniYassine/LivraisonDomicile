package dao;

import model.Product;
import util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection connection;

    public ProductDAO() {
        connection = DatabaseConnection.getConnection();
    }

    public void addProduct(Product product) {
        String query = "INSERT INTO product (name, description, price, stock) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStock());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM product"; // Ensure table name matches your schema
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("link"), // Fetch the link field
                        rs.getInt("category_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE category_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    products.add(new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price"),
                            rs.getInt("stock"),
                            rs.getString("link"), // Fetch the link field
                            rs.getInt("category_id")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    public Product getProductById(int id) {
        String query = "SELECT * FROM product WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getInt("stock"),
                        rs.getString("link"),
                        rs.getInt("category_id")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
