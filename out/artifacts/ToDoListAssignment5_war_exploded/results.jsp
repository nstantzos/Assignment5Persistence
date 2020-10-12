<%--
  Created by IntelliJ IDEA.
  User: STANN027
  Date: 10/9/2020
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Information</title>
    <link rel="stylesheet" href="mystyle.css">
</head>
<%
    String firstName = request.getParameter("first");
    String lastName = request.getParameter("last");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");

%>

<body>
<h1>User Information</h1>
<table>
    <tbody>
    <tr>
        <td>First Name</td>
        <td><%= firstName%></td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td><%= lastName%></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><%= email%></td>
    </tr>
    <tr>
        <td>Gender</td>
        <td><%= gender%></td>
    </tr>
    <tr>
        <td>Lower Case Name</td>
        <td>dummy text. a method used to live here</td>
    </tr>
    </tbody>
</table>
</body>
</html>
