<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product, model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Products - Livraison</title>
<link rel="stylesheet" type="text/css" href="css/productStyle.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar">
        <div class="navbar-logo">
            <a href="/domicile/index.jsp">Livraison</a>
        </div>
        <ul class="navbar-links">
            <li><a href="commandes?action=list">Commandes</a></li>
            <li><a href="livreurs?action=list">Livreurs</a></li>
            <li><a href="products">Produits</a></li>
            <li>
                <a href="viewCart" class="cart-link">
                    Panier (<span id="cartCount">
                        <%
                            Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
                            int cartSize = (cart != null) ? cart.size() : 0;
                            out.print(cartSize);
                        %>
                    </span>)
                </a>
            </li>
        </ul>
    </nav>
</header>

<main>
    
    <section class="categories">
        <h3>Categories</h3>
        <ul class="category-list">
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                String selectedCategory = request.getParameter("category");
                if (categories != null) {
            %>
            <li class="category-item">
                <a href="products" class="<%= (selectedCategory == null || selectedCategory.equalsIgnoreCase("All")) ? "active" : "" %>">All</a>
            </li>
            <%
                    for (Category category : categories) {
                        boolean isActive = category.getName().equalsIgnoreCase(selectedCategory);
            %>
            <li class="category-item">
                <a href="products?category=<%= category.getId() %>" class="<%= isActive ? "active" : "" %>"><%= category.getName() %></a>
            </li>
            <%
                    }
                }
            %>
        </ul>
    </section>

    <section class="products">
        <h1>Liste des Produits</h1>
        <div class="product-grid">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    for (Product product : products) {
            %>
            <div class="product-card">
                <div class="product-image-container">
                    <img src="<%= product.getLink() %>" alt="<%= product.getName() %>" class="product-image">
                </div>
                <div class="product-details">
                    <h2 class="product-name"><%= product.getName() %></h2>
                    <p class="product-description"><%= product.getDescription() %></p>
                    <p class="product-price">Prix: <strong>$<%= String.format("%.2f", product.getPrice()) %></strong></p>    
                </div>
                <div class="product-actions">
                    <a href="addToCart?id=<%= product.getId() %>" class="btn btn-secondary">Ajouter au Panier</a>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="no-products">
                <p>Aucun produit disponible pour cette catégorie.</p>
            </div>
            <%
                }
            %>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2024 Livraison. Tous droits réservés.</p>
</footer>

<script src="js/productScript.js"></script>
</body>
</html>
