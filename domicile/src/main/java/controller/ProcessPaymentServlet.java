package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;

import java.io.IOException;
import java.util.Map;


import dao.OrderDAO;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String cardNumber = request.getParameter("cardNumber");
	    String expiry = request.getParameter("expiry");
	    String cvv = request.getParameter("cvv");

	    if (cardNumber != null && expiry != null && cvv != null) {
	        @SuppressWarnings("unchecked")
			Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getSession().getAttribute("cart");

	        if (cart != null && !cart.isEmpty()) {
	            try {
	                OrderDAO orderDAO = new OrderDAO();

	                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
	                    int productId = entry.getKey();
	                    int quantity = entry.getValue();
	                    Order order = new Order();
	                    order.setProductId(productId);
	                    order.setClientName("Default Client"); 
	                    order.setStatus("Pending");
	                    order.setLivreurId(1); 
	                    orderDAO.addOrder(order);
	                }

	                request.getSession().removeAttribute("cart");
	                request.getRequestDispatcher("/jsp/confirmation.jsp").forward(request, response);
	            } catch (Exception e) {
	                e.printStackTrace();
	                request.setAttribute("error", "Une erreur est survenue lors de la commande.");
	                request.getRequestDispatcher("/viewCart").forward(request, response);
	            }
	        } else {
	            request.setAttribute("error", "Votre panier est vide.");
	            request.getRequestDispatcher("/viewCart").forward(request, response);
	        }
	    } else {
	        request.setAttribute("error", "Veuillez remplir tous les champs correctement !");
	        request.getRequestDispatcher("/viewCart").forward(request, response);
	    }
	}

	
}
