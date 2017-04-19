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
String user  = request.getParameter("username");
String pass =  request.getParameter("password");
HttpSession sess = request.getSession(); 
sess.setAttribute("username", user);
sess.setAttribute("password", pass);
//out.println("</br>"+user);
String sql = "SELECT * FROM patient where username ='"+user+"' " ;
//out.println("all well until here");
resultSet = statement.executeQuery(sql);

//out.println("all well until here");
while(resultSet.next())
{
    String pass_db=resultSet.getString("password");
    if(pass_db.equals(pass))
    {
        out.println("</br>hello "+user+"</br>");
        %>
<form action="patient_form_handler.jsp" method="get">

Name: <input type="text" name="firstName">
  <input type="text" name="lastName"><br>
Sex:
  <input type="radio" checked name="sex" value="male">Male
  <input type="radio" name="sex" value="female">Female
<p>
Which Department you think is appropriate in case of doubt choose medicine
<select name="department">
  <option value="anaesthetics">Anaesthetics</option> 
  <option value="cardiology">Cardiology</option> 
  <option value="ent">ENT</option> 
  <option value="gastroenterology">Gastroenterology</option> 
  <option value="surgery">Surgery</option> 
  <option value="gynaecology">Gynaecology</option> 
  <option value="haematology">Haematology</option> 
  <option value="urology">Urology</option> 
  <option value="medicine" Selected >Medicine</option> 
</select>
<br>
Symptoms: <input type="text" name="symptoms">
<br>
<input type="submit" value = "Update information">
</form>

<%
    }
    else
    {%>
    wrong password
    <a href='patient_login.html'>try again</a>
    <%

    }
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>