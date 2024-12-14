package model;

import java.sql.Timestamp;

public class Order {
	private int id;
    private int productId;
    private String clientName;
    private String status;
    private Integer livreurId; // Use Integer for nullability
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Default Constructor
    public Order() {
    }

    // Existing parameterized constructor remains unchanged
    public Order(int id, int productId, String clientName, String status, Integer livreurId) {
        this.id = id;
        this.productId = productId;
        this.clientName = clientName;
        this.status = status;
        this.livreurId = livreurId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getLivreurId() {
        return livreurId;
    }

    public void setLivreurId(int livreurId) {
        this.livreurId = livreurId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}
