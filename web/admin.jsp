<%-- 
    Document   : admin
    Created on : 11 Apr, 2017, 1:05:55 PM
    Author     : IIITG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "online_consultation";
String userId = "root";
String password = "123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
out.print("not found");
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
connection = DriverManager.getConnection(
connectionUrl + dbName, userId, password);
statement = connection.createStatement();
String sql = "SELECT * FROM admin";

resultSet = statement.executeQuery(sql);
while (resultSet.next()) {
    String user  = request.getParameter("username");
    String pass =  request.getParameter("password");
    String db_user = resultSet.getString("username");
    String db_pass = resultSet.getString("password");
    if(user.equals(db_user) && pass.equals(db_pass))
    {%>
    heya admin
        <form action="add_doctor.jsp" method="get">
    <input type="submit" value="add doc">
    </form>
        <form action="remove_doctor.jsp" method="get">
        <input type="submit" value="remove doc">
        </form>
    <form action="view_user.jsp" method="get">
    <input type="submit" value="view user">
    </form>
        <form action="delete_user.jsp" method="get">
        <input type="submit" value="delete user">
        </form>
    

    <%}
    else
    {%>
username and passwords don't match.
<a href="admin_login.html">go back</a>
    <%}%>
   

<%}
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>