<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Livreur" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Livreurs</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<header>
    <h1>Liste des Livreurs</h1>
    <a class="back-link" href="/domicile/index.jsp">Retour à l'accueil</a>
</header>

<table>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Téléphone</th>
        <th>Disponibilité</th>
        <th>Actions</th>
    </tr>
    <%
        List<Livreur> livreurs = (List<Livreur>) request.getAttribute("livreurs");
        if (livreurs != null) {
            for (Livreur livreur : livreurs) {
    %>
    <tr>
        <td><%= livreur.getId() %></td>
        <td><%= livreur.getName() %></td>
        <td><%= livreur.getPhone() %></td>
        <td><%= livreur.getDisponibilite() %></td>
        <td>
            <!-- Lien ou bouton pour changer la disponibilité -->
            <form action="livreurs" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= livreur.getId() %>">
                <input type="hidden" name="action" value="updateDisponibilite">
                
            </form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="5">Aucun livreur disponible.</td>
    </tr>
    <%
        }
    %>
</table>

<h3>Ajouter un nouveau livreur</h3>
<form action="livreurs" method="post">
    <input type="text" name="name" placeholder="Nom du livreur" required>
    <input type="text" name="phone" placeholder="Téléphone" required>
    <select name="disponibilite">
        <option value="Disponible">Disponible</option>
        <option value="Occupé">Occupé</option>
        <option value="En congé">En congé</option>
    </select>
    <button type="submit" name="action" value="addLivreur">Ajouter</button>
</form>
</body>
</html>
