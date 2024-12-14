package model;

public class Commande {
	private int id;
    private String client;
    private String produit;
    private String status;

    // Constructors
    public Commande(int id, String client, String produit, String status) {
        this.id = id;
        this.client = client;
        this.produit = produit;
        this.status = status;
    }

    public Commande(String client, String produit) {
        this.client = client;
        this.produit = produit;
        this.status = "En attente"; // Default status
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getProduit() {
        return produit;
    }

    public void setProduit(String produit) {
        this.produit = produit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
