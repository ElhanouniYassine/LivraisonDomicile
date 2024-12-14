package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Commande;
import util.DatabaseConnection;
public class CommandeDAO {
	private Connection connection;

    public CommandeDAO() {
        connection = DatabaseConnection.getConnection();
    }

    public void addCommande(Commande commande) {
        String query = "INSERT INTO commandes (client, produit, status) VALUES (?, ?, 'En attente')";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, commande.getClient());
            stmt.setString(2, commande.getProduit());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Commande> getAllCommandes() {
        List<Commande> commandes = new ArrayList<>();
        String query = "SELECT * FROM commandes";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                commandes.add(new Commande(
                        rs.getInt("id"),
                        rs.getString("client"),
                        rs.getString("produit"),
                        rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commandes;
    }
}
