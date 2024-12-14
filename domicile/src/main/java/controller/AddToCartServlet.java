package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getSession().getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        cart.put(productId, cart.getOrDefault(productId, 0) + 1);

        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("products");
    }
}
