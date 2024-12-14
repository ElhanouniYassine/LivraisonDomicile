<%@ page import="model.Order" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Livreurs</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            overflow-x: hidden;
        }

        #sidebar {
            min-width: 250px;
            max-width: 250px;
            background: #343a40;
            color: #fff;
            transition: all 0.3s;
        }

        #sidebar.collapsed {
            margin-left: -250px;
        }

        #sidebar .sidebar-header {
            padding: 20px;
            background: #212529;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            border-bottom: 1px solid #495057;
        }

        #sidebar ul.components {
            padding: 20px 0;
            border-bottom: 1px solid #495057;
        }

        #sidebar ul p {
            color: #adb5bd;
            padding: 10px;
        }

        #sidebar ul li a {
            padding: 10px 20px;
            font-size: 1rem;
            display: block;
            color: #adb5bd;
            transition: all 0.3s;
        }

        #sidebar ul li a:hover {
            background: #495057;
            color: #fff;
            text-decoration: none;
        }

        #sidebar ul li.active > a, a[aria-expanded="true"] {
            background: #16c7ff;
            color: #fff;
        }

        #content {
            width: 100%;
            padding: 20px;
            min-height: 100vh;
            transition: all 0.3s;
        }

        #sidebarCollapse {
            background: #16c7ff;
            border: none;
            color: #fff;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            transition: background 0.3s;
        }

        #sidebarCollapse:hover {
            background: #0fb1e0;
        }

        .table thead {
            background-color: #16c7ff;
            color: #fff;
        }

        .table tbody tr:hover {
            background-color: #e3f2fd;
            transition: background-color 0.3s;
        }

        .btn {
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            font-size: 0.9rem;
            transition: background 0.3s, transform 0.2s;
        }

        .btn.accept {
            background-color: #28a745;
            color: #fff;
        }

        .btn.accept:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn.deliver {
            background-color: #007bff;
            color: #fff;
        }

        .btn.deliver:hover {
            background-color: #0069d9;
            transform: scale(1.05);
        }

        .btn.reject {
            background-color: #dc3545;
            color: #fff;
        }

        .btn.reject:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }
        @media (max-width: 768px) {
            #sidebar {
                margin-left: -250px;
            }
            #sidebar.collapsed {
                margin-left: 0;
            }
            #content {
                padding: 15px;
            }
            #sidebarCollapse {
                position: fixed;
                top: 15px;
                left: 15px;
                z-index: 1000;
            }
        }
    </style>
</head>
<body>
    <div class="d-flex" id="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <i class="fas fa-truck me-2"></i> Livreurs
            </div>
            <ul class="list-unstyled components">
                <li class="active">
                    <a href="livreurDashboard"><i class="fas fa-home me-2"></i> Accueil</a>
                </li>
                <li>
                    <a href="livreurProfile"><i class="fas fa-user me-2"></i> Profil</a>
                </li>
                <li>
                    <a href="livreurSettings"><i class="fas fa-cog me-2"></i> Paramètres</a>
                </li>
                <li>
                    <a href="logout"><i class="fas fa-sign-out-alt me-2"></i> Déconnexion</a>
                </li>
            </ul>
        </nav>

        <!-- Page Content -->
        <div id="content">
            <button type="button" id="sidebarCollapse" class="mb-4">
                <i class="fas fa-bars"></i>
            </button>

            <h1 class="mb-4 text-center">Tableau de Bord des Livreurs</h1>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th scope="col">ID Commande</th>
                            <th scope="col">Nom Produit</th>
                            <th scope="col">Client</th>
                            <th scope="col">Statut</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Order> allOrders = (List<Order>) request.getAttribute("allOrders");
                            if (allOrders != null && !allOrders.isEmpty()) {
                                for (Order order : allOrders) {
                        %>
                        <tr>
                            <td><%= order.getId() %></td>
                            <td><%= order.getProductId() %></td>
                            <td><%= order.getClientName() %></td>
                            <td>
                                <span class="badge 
                                    <%= "Pending".equalsIgnoreCase(order.getStatus()) ? "bg-warning text-dark" : 
                                       "In Progress".equalsIgnoreCase(order.getStatus()) ? "bg-primary" :
                                       "Delivered".equalsIgnoreCase(order.getStatus()) ? "bg-success" :
                                       "Rejected".equalsIgnoreCase(order.getStatus()) ? "bg-danger" :
                                       "bg-secondary" %>">
                                    <%= order.getStatus() %>
                                </span>
                            </td>
                            <td>
                                <form action="livreurDashboard" method="post" class="d-flex justify-content-center align-items-center gap-2">
                                    <input type="hidden" name="id" value="<%= order.getId() %>">
                                    <%
                                        if ("Pending".equalsIgnoreCase(order.getStatus())) {
                                    %>
                                        <button type="submit" name="action" value="accept" class="btn accept">
                                            <i class="fas fa-check"></i> Accepter
                                        </button>
                                        <button type="submit" name="action" value="reject" class="btn reject">
                                            <i class="fas fa-times"></i> Rejeter
                                        </button>
                                    <%
                                        } else if ("In Progress".equalsIgnoreCase(order.getStatus())) {
                                    %>
                                        <button type="submit" name="action" value="deliver" class="btn deliver">
                                            <i class="fas fa-truck"></i> Livrer
                                        </button>
                                    <%
                                        } else if ("Delivered".equalsIgnoreCase(order.getStatus()) || "Rejected".equalsIgnoreCase(order.getStatus())) {
                                    %>
                                        <span class="text-muted">Aucune action</span>
                                    <%
                                        }
                                    %>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="text-center">Aucune commande disponible.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('collapsed');
            });
        });
    </script>
</body>
</html>