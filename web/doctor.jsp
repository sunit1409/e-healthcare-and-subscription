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
//storing the session values 
                                                    HttpSession sess = request.getSession(); 
                                                    sess.setAttribute("username", user);
                                                    sess.setAttribute("password", pass);
//out.println("</br>"+user);
String sql = "SELECT * FROM doctor where username ='"+user+"' " ;
//out.println("all well until here");
resultSet = statement.executeQuery(sql);

//out.println("all well until here");
  int patient_count = 0 ;
while(resultSet.next())
{
    String pass_db=resultSet.getString("password");
    if(pass_db.equals(pass))
    {
        out.println("</br>hello "+user+"</br>");
        out.println("</br>Your Patients are "+"</br>");
        String pat1 = resultSet.getString("patient_1");
        String pat2 = resultSet.getString("patient_2");
        String pat3 = resultSet.getString("patient_3");
        String pat4 = resultSet.getString("patient_4");
        String pat5 = resultSet.getString("patient_5");
        String pat6 = resultSet.getString("patient_6");
        String pat7 = resultSet.getString("patient_7");
        String pat8 = resultSet.getString("patient_8");
        String pat9 = resultSet.getString("patient_9");
        String pat10 = resultSet.getString("patient_10");
        
        if(pat1 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat1);
            //doctor chat now
            %>
                <form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_1" value="patient_1">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
            <%
        }
        if(pat2 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat2);
            %>
                <form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_2" value="patient_2">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
            <%
        }
        if(pat3 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat3);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_3" value="patient_3">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat4 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat4);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_4" value="patient_4">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat5 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat5);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_5" value="patient_5">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat6 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat6);
%>
                <form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_6" value="patient_6">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat7 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat7);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_7" value="patient_7">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat8 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat8);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_8" value="patient_8">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat9 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat9);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_9" value="patient_9">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        if(pat10 != null) // if patient 1 exists
        {
            out.println("</br> Patient ID : "+pat10);
%>
<form action="doc_chat.jsp" method="get">
                     <input type="radio" checked name="patient_10" value="patient_10">Accept Request
  
                    <input type="submit" value = "chat">
                </form>
<%
        }
        
        
        
        
        
    }
    else
    {%>
    wrong password
    <a href='doctor_login.html'>try again</a>
    <%

    }
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>