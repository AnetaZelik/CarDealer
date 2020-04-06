<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Add user</title>
</head>
<body>
<form action="add_user" method="post">
    First name: <input type="text" name="firstName"> <br>
    Last name: <input type="text" name="lastName"> <br>
    Age: <select name="age">
    <% for (int i = 1; i <= 100; i++) {%>
    <option><%= i %>
    </option>
    <% } %>
</select> <br>
    Region: <select name="region">
    <option>Poland</option>
    <option>Germany</option>
</select><br>
    <input type="radio" name="sex" value="MALE"> Male <br>
    <input type="radio" name="sex" value="FEMALE"> Femal <br>
    <input type="submit" value="Utwórz użytkownika">
</form>
</body>
</html>