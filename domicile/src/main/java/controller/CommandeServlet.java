package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Commande;

import java.io.IOException;
import java.util.List;

import dao.CommandeDAO;

/**
 * Servlet implementation class CommandeServlet
 */

@WebServlet("/commandes")
public class CommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */private CommandeDAO commandeDAO;

     @Override
     public void init() {
         commandeDAO = new CommandeDAO(); // Initialize DAO
     }

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         List<Commande> commandes = commandeDAO.getAllCommandes(); // Fetch commandes from DAO
         request.setAttribute("commandes", commandes); // Attach commandes to request
         request.getRequestDispatcher("/jsp/commandes.jsp").forward(request, response); // Forward to JSP
     }

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
         String client = request.getParameter("client");
         String produit = request.getParameter("produit");
         Commande commande = new Commande(client, produit);
         commandeDAO.addCommande(commande);
         response.sendRedirect("commandes?action=list");

     }

}
