package dao;

import util.DatabaseConnection;
import util.EmailUtil;
import model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection connection;

    public OrderDAO() {
        connection = DatabaseConnection.getConnection();
    }
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("id"),
                    rs.getInt("product_id"),
                    rs.getString("client_name"),
                    rs.getString("status"),
                    rs.getInt("livreur_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


    // Create a new order
    public void createOrder(int productId, String clientName, String status, Integer livreurId) {
        String query = "INSERT INTO orders (product_id, client_name, status, livreur_id, created_at, updated_at) " +
                       "VALUES (?, ?, ?, ?, NOW(), NOW())";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, productId);
            stmt.setString(2, clientName);
            stmt.setString(3, status);
            if (livreurId != null) {
                stmt.setInt(4, livreurId);
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve all pending orders
    public List<Order> getPendingOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE status != 'Delivered'";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("id"),
                    rs.getInt("product_id"),
                    rs.getString("client_name"),
                    rs.getString("status"),
                    rs.getInt("livreur_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


    public List<Order> getLivreurOrders(int livreurId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE livreur_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, livreurId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    orders.add(mapResultSetToOrder(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Update the status of an order
    

    // Add a new order
    public void addOrder(Order order) {
        String query = "INSERT INTO orders (product_id, client_name, status, livreur_id, created_at, updated_at) " +
                       "VALUES (?, ?, ?, ?, NOW(), NOW())";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, order.getProductId());
            stmt.setString(2, order.getClientName());
            stmt.setString(3, order.getStatus());
            if (order.getLivreurId() != null) {
                stmt.setInt(4, order.getLivreurId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Utility method to map ResultSet to Order object
    private Order mapResultSetToOrder(ResultSet rs) throws SQLException {
        return new Order(
                rs.getInt("id"),
                rs.getInt("product_id"),
                rs.getString("client_name"),
                rs.getString("status"),
                rs.getInt("livreur_id")
        );
    }
    public List<Order> getNonDeliveredOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE status != 'Delivered'";
        try (PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                orders.add(new Order(
                    rs.getInt("id"),
                    rs.getInt("product_id"),
                    rs.getString("client_name"),
                    rs.getString("status"),
                    rs.getInt("livreur_id")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void updateOrderStatus(int orderId, String status) {
        String query = "UPDATE orders SET status = ?, updated_at = NOW() WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status); // Set the status value
            stmt.setInt(2, orderId);  // Set the order ID
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Order> getClientOrders(String clientEmail) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE client_name = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, clientEmail);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    orders.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("product_id"),
                        rs.getString("client_name"),
                        rs.getString("status"),
                        rs.getInt("livreur_id")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    public void updateOrderStatus(int orderId, String status, String clientEmail) {
        String query = "UPDATE orders SET status = ?, updated_at = NOW() WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, orderId);
            stmt.executeUpdate();

            String subject = "Order Status Update";
            String message = "Your order #" + orderId + " status has been updated to: " + status;
            EmailUtil.sendEmail(clientEmail, subject, message);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
