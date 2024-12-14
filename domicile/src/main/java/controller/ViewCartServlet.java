package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Product;
import dao.ProductDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getSession().getAttribute("cart");
        List<Product> cartProducts = new ArrayList<>();

        if (cart != null) {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();

                Product product = productDAO.getProductById(productId);
                if (product != null) {
                    product.setStock(quantity); 
                    cartProducts.add(product);
                }
            }
        }
        request.setAttribute("cartProducts", cartProducts);
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
    }
}
