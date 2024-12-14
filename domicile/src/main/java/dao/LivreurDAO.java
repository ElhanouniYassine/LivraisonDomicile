package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Livreur;
import util.DatabaseConnection;

public class LivreurDAO {
	private Connection connection;

    public LivreurDAO() {
        connection = DatabaseConnection.getConnection();
    }

    public void addLivreur(Livreur livreur) {
        String query = "INSERT INTO livreurs (name, phone, disponibilite) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, livreur.getName());
            stmt.setString(2, livreur.getPhone());
            stmt.setString(3, livreur.getDisponibilite()); 
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Livreur ajouté avec succès !");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Livreur> getAllLivreurs() {
        List<Livreur> livreurs = new ArrayList<>();
        String query = "SELECT * FROM livreurs";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                livreurs.add(new Livreur(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("phone"),
                    rs.getString("disponibilite") 
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livreurs;
    }

}
