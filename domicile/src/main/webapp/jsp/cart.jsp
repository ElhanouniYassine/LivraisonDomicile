<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Panier</title>
    <link rel="stylesheet" type="text/css" href="css/cartStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Left Section: Image -->
        <div class="left-section">
            <img src="https://img.freepik.com/vecteurs-libre/illustration-concept-informations-paiement_114360-2886.jpg?t=st=1733587386~exp=1733590986~hmac=b6da3f2343192050564a152b5b3e302e44ae4da05fe4a87399bf1655a2cc0d38&w=740" alt="Technology Illustration">
        </div>

        <!-- Right Section: Cart Contents -->
        <div class="right-section">
            <header>
                <h1>Votre Panier</h1>
            </header>
            <main>
                <table>
                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Prix</th>
                            <th>Quantité</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Product> cartProducts = (List<Product>) request.getAttribute("cartProducts");
                            double grandTotal = 0;
                            if (cartProducts != null && !cartProducts.isEmpty()) {
                                for (Product product : cartProducts) {
                                    double total = product.getPrice() * product.getStock();
                                    grandTotal += total;
                        %>
                        <tr id="product-<%= product.getId() %>">
                            <td><%= product.getName() %></td>
                            <td>$<%= product.getPrice() %></td>
                            <td><%= product.getStock() %></td>
                            <td>$<%= String.format("%.2f", total) %></td>
                            <td>
                                <!-- Delete Button -->
                                <form action="${pageContext.request.contextPath}/deleteItem" method="post" class="delete-form">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <button type="submit" class="delete-btn" title="Supprimer">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="empty-cart">Votre panier est vide.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3"><strong>Total Général:</strong></td>
                            <td colspan="2">$<%= String.format("%.2f", grandTotal) %></td>
                        </tr>
                    </tfoot>
                </table>
                <div class="buttons">
                    <button id="confirmOrderBtn" class="btn confirm-btn"><i class="fas fa-check-circle"></i> Confirmer la Commande</button>
                    <a href="products" class="btn back-btn"><i class="fas fa-arrow-left"></i> Retour aux Produits</a>
                </div>
            </main>
        </div>
    </div>

    <!-- Payment Modal -->
    <div id="paymentModal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Effectuer le Paiement</h2>
            <form id="paymentForm" action="processPayment" method="post">
                <label for="cardNumber">Numéro de Carte:</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>

                <label for="expiry">Date d'Expiration:</label>
                <input type="text" id="expiry" name="expiry" placeholder="MM/AA" required>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" placeholder="123" required>

                <button type="submit" class="btn pay-btn"><i class="fas fa-credit-card"></i> Payer</button>
            </form>
        </div>
    </div>

    <!-- JavaScript for Modal -->
    <script>
        const confirmOrderBtn = document.getElementById("confirmOrderBtn");
        const paymentModal = document.getElementById("paymentModal");
        const closeButton = document.querySelector(".close-button");

        confirmOrderBtn.addEventListener("click", () => {
            paymentModal.style.display = "block";
        });

        closeButton.addEventListener("click", () => {
            paymentModal.style.display = "none";
        });

        window.addEventListener("click", (event) => {
            if (event.target === paymentModal) {
                paymentModal.style.display = "none";
            }
        });
    </script>
</body>
</html>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Panier</title>
    <link rel="stylesheet" type="text/css" href="css/cartStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter&family=Pacifico&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="left-section">
            <img src="https://img.freepik.com/vecteurs-libre/illustration-concept-informations-paiement_114360-2886.jpg?t=st=1733587386~exp=1733590986~hmac=b6da3f2343192050564a152b5b3e302e44ae4da05fe4a87399bf1655a2cc0d38&w=740" alt="Payment Illustration">
        </div>
        <div class="right-section">
            <header>
                <h1>Votre Panier</h1>
            </header>
            <main>
                <table>
                    <thead>
                        <tr>
                            <th>Nom</th>
                            <th>Prix</th>
                            <th>Quantité</th>
                            <th>Total</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Product> cartProducts = (List<Product>) request.getAttribute("cartProducts");
                            double grandTotal = 0;
                            if (cartProducts != null && !cartProducts.isEmpty()) {
                                for (Product product : cartProducts) {
                                    double total = product.getPrice() * product.getStock();
                                    grandTotal += total;
                        %>
                        <tr id="product-<%= product.getId() %>">
                            <td><%= product.getName() %></td>
                            <td>$<%= product.getPrice() %></td>
                            <td><%= product.getStock() %></td>
                            <td>$<%= String.format("%.2f", total) %></td>
                            <td>
                                <form action="${pageContext.request.contextPath}/deleteItem" method="post" class="delete-form">
                                    <input type="hidden" name="productId" value="<%= product.getId() %>">
                                    <button type="submit" class="delete-btn" title="Supprimer">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5" class="empty-cart">Votre panier est vide.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3"><strong>Total Général:</strong></td>
                            <td colspan="2">$<%= String.format("%.2f", grandTotal) %></td>
                        </tr>
                    </tfoot>
                </table>
                <div class="buttons">
                    <button id="confirmOrderBtn" class="btn confirm-btn"><i class="fas fa-check-circle"></i> Confirmer la Commande</button>
                    <a href="products" class="btn back-btn"><i class="fas fa-arrow-left"></i> Retour aux Produits</a>
                </div>
            </main>
        </div>
    </div>

    <div id="paymentModal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Effectuer le Paiement</h2>
            <form id="paymentForm" action="processPayment" method="post">
                <label for="cardNumber">Numéro de Carte:</label>
                <input type="text" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>
                
                

                <label for="expiry">Date d'Expiration:</label>
                <input type="text" id="expiry" name="expiry" placeholder="MM/AA" required>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" placeholder="123" required>

                
                <form action="processPayment" method="post">
    				<button type="submit" class="btn pay-btn"><i class="fas fa-credit-card"></i> Payer</button>
				</form>
            </form>
        </div>
    </div>

    
    <script>
        const confirmOrderBtn = document.getElementById("confirmOrderBtn");
        const paymentModal = document.getElementById("paymentModal");
        const closeButton = document.querySelector(".close-button");

        confirmOrderBtn.addEventListener("click", () => {
            paymentModal.style.display = "block";
        });

        closeButton.addEventListener("click", () => {
            paymentModal.style.display = "none";
        });

        window.addEventListener("click", (event) => {
            if (event.target === paymentModal) {
                paymentModal.style.display = "none";
            }
        });
    </script>
</body>
</html>
 