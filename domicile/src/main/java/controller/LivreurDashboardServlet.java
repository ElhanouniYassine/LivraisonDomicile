package controller;

import java.io.IOException;
import java.util.List;

import model.Order;
import dao.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/livreurDashboard")
public class LivreurDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all orders, including Delivered and Rejected
        List<Order> allOrders = orderDAO.getAllOrders();
        request.setAttribute("allOrders", allOrders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/livreurDashboard.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                throw new IllegalArgumentException("Order ID is missing.");
            }

            int orderId = Integer.parseInt(idParam);
            String action = request.getParameter("action");

            if ("accept".equals(action)) {
                orderDAO.updateOrderStatus(orderId, "In Progress");
            } else if ("deliver".equals(action)) {
                orderDAO.updateOrderStatus(orderId, "Delivered");
            } else if ("reject".equals(action)) {
                orderDAO.updateOrderStatus(orderId, "Rejected");
            }
            response.sendRedirect(request.getContextPath() + "/livreurDashboard");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }



}
