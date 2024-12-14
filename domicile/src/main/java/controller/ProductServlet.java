package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
//
//@WebServlet("/products")
public class ProductServlet extends HttpServlet {
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
        String categoryParam = request.getParameter("category");
        List<Product> products;

        if (categoryParam != null) {
            int categoryId = Integer.parseInt(categoryParam);
            products = productDAO.getProductsByCategory(categoryId);
        } else {
            products = productDAO.getAllProducts();
        }

        request.setAttribute("products", products);
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/products.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Product product = new Product(stock, name, description, price, stock, description, stock);
        productDAO.addProduct(product);

        response.sendRedirect("products?action=list");
    }
}
