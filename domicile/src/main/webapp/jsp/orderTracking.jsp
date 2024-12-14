<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Tracking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Order Tracking</h1>
        <%
            List<Order> clientOrders = (List<Order>) request.getAttribute("clientOrders");
            if (clientOrders != null && !clientOrders.isEmpty()) {
        %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Product ID</th>
                    <th>Status</th>
                    <th>Estimated Delivery Time</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Order order : clientOrders) {
                        String estimatedTime = "N/A";
                        if ("Pending".equalsIgnoreCase(order.getStatus())) {
                            estimatedTime = "3 hours";
                        } else if ("In Progress".equalsIgnoreCase(order.getStatus())) {
                            estimatedTime = "2 hours";
                        } else if ("Delivered".equalsIgnoreCase(order.getStatus())) {
                            estimatedTime = "Delivered";
                        }
                %>
                <tr>
                    <td><%= order.getId() %></td>
                    <td><%= order.getProductId() %></td>
                    <td><%= order.getStatus() %></td>
                    <td><%= estimatedTime %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <p>No orders found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
