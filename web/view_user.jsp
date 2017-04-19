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
String sql = "SELECT * FROM patient";

resultSet = statement.executeQuery(sql);
   %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH>username</TH>
                <TH>password</TH>
                <TH>department</TH>
                <TH>problem</TH>
            </TR>
            <% while(resultSet.next()){ %>
            <TR>
                <TD> <%= resultSet.getString(1) %></td>
                <TD> <%= resultSet.getString(2) %></TD>
                <TD> <%= resultSet.getString(3) %></TD>
                <TD> <%= resultSet.getString(4) %></TD>
                <TD> <%= resultSet.getString(5) %></TD>
            </TR>
            <% } %>
        </TABLE>
<%}
catch (Exception e){
e.printStackTrace();
}
%>
</table>