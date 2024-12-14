package model;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private int stock;
    private String link; // Add this field
    private int categoryId;

    // Constructor with all fields
    public Product(int id, String name, String description, double price, int stock, String link, int categoryId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.link = link;
        this.categoryId = categoryId;
    }

    // Constructor without ID
    public Product(String name, String description, double price, int stock, String link, int categoryId) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.link = link;
        this.categoryId = categoryId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getLink() { // Add this getter
        return link;
    }

    public void setLink(String link) { // Add this setter
        this.link = link;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
