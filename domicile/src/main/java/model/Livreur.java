package model;

public class Livreur {
	private int id;
    private String name;
    private String phone;
    private String disponibilite;

    // Constructors
    public Livreur(int id, String name, String phone, String disponibilite) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.disponibilite = disponibilite;
    }

    public Livreur(String name, String phone) {
        this.name = name;
        this.phone = phone;
        this.disponibilite = "Disponible";
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getDisponibilite() {
        return disponibilite;
    }

    public void setDisponibilite(String disponibilite) {
        this.disponibilite = disponibilite;
    }
}
