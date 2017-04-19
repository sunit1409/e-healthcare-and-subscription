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
    int pat_id = Integer.parseInt(patient_id);
    pat_id = pat_id + 1 ;
    String sql_into_id = "insert into id_table(id_patient,id_doctor)values('"+pat_id+"','"+doc_id+"')"; 

//out.println("uid's done ");
statement.executeUpdate(sql_into_id);

String user  = request.getParameter("username");
String pass =  request.getParameter("password");

//out.println("well untill here");
String sql = "insert into patient(id,username,password)values('"+pat_id+"','"+user+"','"+pass+"')"; 
//out.println("</br>well untill here"+sql);
statement.executeUpdate(sql);

%>
account created successfully 
<a href="patient_login.html">go to login page</a>
<%
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>