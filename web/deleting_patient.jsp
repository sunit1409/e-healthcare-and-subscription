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

String id = request.getParameter("id");


String sql = "delete from patient where id = '"+id+"'"; 

statement.executeUpdate(sql);

%>
Successfully deleted patient
<a href="admin_login.html">go back</a>
<%
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>