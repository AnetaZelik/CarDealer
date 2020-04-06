<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:useBean id="autko" class="carDealer.CarBean" scope="session"/>
<%--<jsp:setProperty name="car" property="make"/>--%>
<%--<jsp:setProperty name="car" property="type"/>--%>
<%--<jsp:setProperty name="car" property="year"/>--%>
<%--<jsp:setProperty name="car" property="distance"/>--%>
<%--<jsp:setProperty name="car" property="capacity"/>--%>

<jsp:setProperty name="car" property="*"/>

<table>
    <tr>
        <td>Make</td>
        <td><c:out value="${car.make}"/></td>
    </tr>
    <tr>
        <td>Type</td>
        <td>
            <jsp:getProperty name="car" property="type"/>
        </td>
    </tr>
    <tr>
        <td>Production year</td>
        <td><c:out value="${car.year}"/></td>
    </tr>
    <tr>
        <td>Distance</td>
        <td><c:out value="${car.distance}"/></td>
    </tr>
    <tr>
        <td>Capacity</td>
        <td><c:out value="${car.capacity}"/></td>
    </tr>
</table>
<form action="carInfoForm.jsp">
    <input type="submit" value="Edit">
</form>
<form action="add_car_info">
    <input type="submit" value="Save car">
</form>

<%@include file="footer.html" %>
</body>
</html>
