package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet("/deleteItem")
public class DeleteItemServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        @SuppressWarnings("unchecked")
		Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getSession().getAttribute("cart");

        if (cart != null) {
            String productIdParam = request.getParameter("productId");
            if (productIdParam != null) {
                int productId = Integer.parseInt(productIdParam);
                cart.remove(productId);
                request.getSession().setAttribute("cart", cart);
            }
        }
        response.sendRedirect(request.getContextPath() + "/viewCart");
    }
}
