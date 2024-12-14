package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            String role = userDAO.authenticate(email, password);

            if (role != null) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
                session.setAttribute("role", role);

                if ("livreur".equals(role)) {
                    response.sendRedirect("livreurDashboard.jsp");
                } else if ("client".equals(role)) {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
