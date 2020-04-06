<%@ page import="carDealer.Client" %>
<%@ page import="java.util.List" %><%--
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<% Object oClients = request.getAttribute("clients"); %>
<% List clients = (List) oClients; %>

<form action="delete_client">
    <select name="client">
        <% for (Object o : clients) { %>
        <% Client c = (Client) o; %>
        <option><%= c.getFirstName() %> <%= c.getLastName() %>
        </option>
        <% } %>
    </select>
    <input type="submit" value="Delete"/>
</form>

</body>
</html>
