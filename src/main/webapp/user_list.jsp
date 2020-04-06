<%@ page import="java.util.List" %>
<%@ page import="carDealer.Client" %><%--
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp" %>
<table>
    <tr>
        <th>Id</th>
        <th>First name</th>
        <th>Last Name</th>
        <th>Age</th>
        <th>Region</th>
        <th>Sex</th>
        <th>Action</th>
    </tr>

    <% Object oClients = request.getAttribute("clients"); %>
    <% List clients = (List) oClients; %>
    <% for (Object o : clients) { %>
    <% Client c = (Client) o; %>
    <tr>
        <td><%= c.getId() %>
        </td>
        <td><%= c.getFirstName() %>
        </td>
        <td><%= c.getLastName() %>
        </td>
        <td><%= c.getAge() %>
        </td>
        <td><%= c.getRegion()%>
        </td>
        <td><%= c.getSex()%>
        </td>
        <td>
            <form action="delete_user_by_id">
                <input type="text" disabled="true" name="id" value="<%= c.getId() %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>