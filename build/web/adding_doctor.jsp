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
    String sql_id = "SELECT * FROM id_table";

    resultSet = statement.executeQuery(sql_id);
    
    
    String patient_id = null;
    String doc_id =null;
    while(resultSet.next())
    {
        patient_id =  resultSet.getString("id_patient");
        doc_id =  resultSet.getString("id_doctor");
    }
    String sql_delete = "delete from id_table where id_doctor  = '"+doc_id+"'"; 
    statement.executeUpdate(sql_delete);//removing everything from the table
    int doctor_id = Integer.parseInt(doc_id);
    doctor_id = doctor_id + 1 ;
    String sql_into_id = "insert into id_table(id_patient,id_doctor)values('"+patient_id+"','"+doctor_id+"')"; 

//out.println("uid's done ");
statement.executeUpdate(sql_into_id);

String user  = request.getParameter("username");
String pass =  request.getParameter("password");
String depart = request.getParameter("department");
out.println("well untill here");
String sql = "insert into doctor(id,username,password,department)values('"+doctor_id+"','"+user+"','"+pass+"','"+depart+"')"; 
out.println("well untill here");
statement.executeUpdate(sql);

%>
Successfully inserted 
<a href="admin_login.html">go back</a>
<%
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>