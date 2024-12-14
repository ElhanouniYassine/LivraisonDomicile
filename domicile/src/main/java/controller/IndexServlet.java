package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<Map<String, String>> features = new ArrayList<>();
        features.add(Map.of("icon", "fas fa-shopping-cart", "title", "Commandes Faciles", "description", "Passez et suivez vos commandes en temps réel."));
        features.add(Map.of("icon", "fas fa-motorcycle", "title", "Gestion des Livreurs", "description", "Les livreurs peuvent accepter ou refuser des missions."));
        features.add(Map.of("icon", "fas fa-boxes", "title", "Produits Disponibles", "description", "Parcourez une gamme de produits locaux."));

        
        request.setAttribute("features", features);

        
        request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
    }
}
