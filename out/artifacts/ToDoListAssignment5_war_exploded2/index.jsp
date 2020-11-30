<%--
  Created by IntelliJ IDEA.
  User: STANN027
  Date: 10/9/2020
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
  <title>My Java Web App</title>
  <link rel="stylesheet" href="mystyle.css">
</head>
<body>
<%
  try
  {
    Class.forName("com.mysql.jdbc.Driver");

  }
  catch (ClassNotFoundException e)
  {
    e.printStackTrace();
  }
  String url = "jdbc:mysql://localhost:3306/todolist";
  String username = "root";
  String password = "n6Stan***SQL";
  //String sqlDropTable = "drop table if exists todolist.todolist";
  //String sqlCreateTable = "create table todolist(id int, itemID int, ToDoItem varchar(255))";
  String sql = "select * from todolist";
  Connection con = DriverManager.getConnection(url,username,password);
  Statement st = con.createStatement();
  //st.executeUpdate(sqlDropTable);
  //st.executeUpdate(sqlCreateTable);
  ResultSet rs = st.executeQuery(sql);
  //rs.next();

%>
<h1>Welcome to my web app</h1>
<form name="myForm" action="results.jsp" method="post">
  <link rel="stylesheet" href="mystyle.css">
  <jsp:include page="my-header.jsp"/>
  <!-- html table-->
  <table class="center">
    <tbody align="center">
    <!-- table row 1-->
    <tr>
      <!-- table column 1-->
      <td> Enter item to be added </td>
      <!-- table column 2-->
      <td><input type="text" name="firstItem" value="" size="50" itemid="1"></td>
    </tr>
    <!-- table row 2-->
    <tr>
      <!-- table column 1-->
      <td> Enter EXACT item text to remove </td>
      <!-- table column 2-->
      <td><input type="text" name="removeItem" value="" size="50"></td>
    </tr>
    <!-- table row 3-->
    <tr>
      <!-- table column 1-->
      <td> Enter a raw SQL statement</td>
      <!-- table column 2-->
      <td><input type = "text" name="rawSQL" value="" size="50"></td>
    </tr>
    </tbody>
  </table>
  <br>
  <h2>
    Current To-Do List
  </h2>
  <table class="center">
    <tbody align="center">
    <tr>
      <td>Item Order</td>
      <td>To Do Item</td>
    </tr>
    <%
      int i = 1;
      while (rs.next())
      {
    %>
    <tr>
      <td><%=i %></td>
      <td><%=rs.getString("ToDoItem") %></td>
    </tr>
    <%
        i++;
      }
    %>
    </tbody>
  </table>
  <br>
<div>
  <input type="reset" value="Clear text boxes" name="clear"/>
  <input type="submit" value="Add/Remove Items" name="submit"/>
</div>
<jsp:include page="my-footer.jsp"/>
</form>
<div>The time on the server is <%= new java.util.Date()%></div>
</body>
</html>
