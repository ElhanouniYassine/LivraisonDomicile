<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Commande" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body><header>
        <h1>Liste des Commandes</h1>
        <a class="back-link" href="/domicile/index.jsp">Retour à l'accueil</a>
    </header>
    <table>
        <tr>
            <th>ID</th>
            <th>Client</th>
            <th>Produit</th>
            <th>Statut</th>
        </tr>
        <%
            List<Commande> commandes = (List<Commande>) request.getAttribute("commandes");
            if (commandes != null) {
                for (Commande commande : commandes) {
        %>
        <tr>
            <td><%= commande.getId() %></td>
            <td><%= commande.getClient() %></td>
            <td><%= commande.getProduit() %></td>
            <td><%= commande.getStatus() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">Aucune commande disponible.</td>
        </tr>
        <%
            }
        %>
    </table>
    <form action="commandes" method="post">
        <h3>Créer une nouvelle commande</h3>
        <input type="text" name="client" placeholder="Nom du client" required>
        <input type="text" name="produit" placeholder="Produit" required>
        <button type="submit">Ajouter</button>
    </form>
</body>
</html>