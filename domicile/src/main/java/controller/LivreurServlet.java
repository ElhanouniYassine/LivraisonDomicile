package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Livreur;

import java.io.IOException;
import java.util.List;

import dao.LivreurDAO;

/**
 * Servlet implementation class LivreurServlet
 */
@WebServlet("/LivreurServlet")
public class LivreurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */private LivreurDAO livreurDAO;

     @Override
     public void init() {
         livreurDAO = new LivreurDAO();
     }

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String action = request.getParameter("action");

         if ("list".equals(action)) {
             List<Livreur> livreurs = livreurDAO.getAllLivreurs();
             request.setAttribute("livreurs", livreurs);
             RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/livreurs.jsp");
             dispatcher.forward(request, response);
         }
     }

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");

         Livreur livreur = new Livreur(name, phone);
         livreurDAO.addLivreur(livreur);

         response.sendRedirect("LivreurServlet?action=list");
     }

}
