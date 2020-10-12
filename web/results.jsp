<%--
  Created by IntelliJ IDEA.
  User: STANN027
  Date: 10/9/2020
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*"%>
<html>
<head>
    <title>User Information</title>
    <link rel="stylesheet" href="mystyle.css">
</head>
<%
    /*
    String firstName = request.getParameter("first");
    String lastName = request.getParameter("last");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    */

    //mypackage.jsp.PersistenceTest.WebMain();
%>

<body>
<form name="resultsForm" action="index.jsp" method="post">
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

    String sql = "select * from todolist";
    String addItem = request.getParameter("firstItem");
    String idRemove = request.getParameter("removeItem");
    //String sqlAdd = "insert into todolist(first_name,last_name,city_name,email)values('"+first_name+"','"+last_name+"','"+city_name+"','"+email+"')"
    Connection con = DriverManager.getConnection(url,username,password);
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(sql);
    //rs.next();

%>
<h1>User Information</h1>
    <table class="center">
        <tbody align="center">
        <tr>
            <td>Item Order</td>
            <td>To Do Item</td>
        </tr>
        <%
            int i = 1;
            int itemCount = 0;
            int maxID = 0;
            while (rs.next())
            {
        %>
        <tr>
            <td><%=i %></td>
            <td><%=rs.getString("ToDoItem") %></td>
        </tr>
        <%
                        if (Integer.parseInt(rs.getString("id")) > maxID)
                        {
                            maxID = Integer.parseInt(rs.getString("id"));
                        }
                    itemCount = i;
                i++;
            }
        %>
        </tbody>
    </table>
    <br>
    <br>
    <h2>
        Items to be added/removed:
    </h2>
    <table class="center">
    <tbody align="center">
    <tr>
        <td>Item to be added</td>
        <td><%= addItem%></td>
    </tr>
    <tr>
        <td>Item to be removed</td>
        <td><%= idRemove%></td>
    </tr>
    </tbody>
</table>
    <%
        if (addItem.isEmpty())
        {

        }
        else
        {
            String itemIDToAdd = Integer.toString(maxID + 1);
            String sqlAdd = "insert into todolist values(" + itemIDToAdd + "," + itemIDToAdd +",'" + addItem +"')";
            //String sqlAddTest = "insert into todolist values(5,5,'water the ficus')";
            Statement newStatement = con.createStatement();

            int value = newStatement.executeUpdate(sqlAdd);
        }
        if (idRemove.isEmpty())
        {

        }
        else
        {
            String sqlDelete = "delete from todolist where ToDoItem='" + idRemove + "'";
            st.executeUpdate(sqlDelete);
        }


    %>

    <div>
        <input type="submit" value="Submit Changes and Return to the Add/Remove screen" name="submit"/>
    </div>

</form>
</body>
</html>
