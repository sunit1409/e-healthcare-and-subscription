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

String f_name  = request.getParameter("firstName");
String l_name =  request.getParameter("lastName");
String sex  = request.getParameter("sex");
String department  = request.getParameter("department");
String symptom  = request.getParameter("symptoms");
HttpSession sess = request.getSession(false); //use false to use the existing session
//out.println("hey session  "+sess.getAttribute("username"));
//sess.getAttribute("password");//this will return password Any time in the session

//out.println("well untill here");
String sql = "update patient set department='"+department+"',problem='"+symptom+"',sex='"+sex+"',first_name='"+f_name+"',last_name = '"+l_name+"' where username = '"+sess.getAttribute("username")+"'"; 
//out.println("</br>well untill here"+sql);
statement.executeUpdate(sql);
out.println("good until here");
String sql_doctor_info = "Select * from doctor where department = '"+department+"'    " ;
resultSet = statement.executeQuery(sql_doctor_info);
int i = 0 ;
while(resultSet.next())
{
    String doctor_name = resultSet.getString("username");
    String doctor_id = resultSet.getString("id");
     i++;
     if(i==1)
     {
          out.println("</br> Doctor ID : "+doctor_name+"</br>");
                      %>
                <form action="chat.jsp" method="get">
                     <input type="radio" checked name="doc_1" value="doc_1">Talk
  
                    <input type="submit" value = "Choose me">
                </form>
                      <%
                          sess.setAttribute("doc_1_id", doctor_id);
     }
     if(i==2)
     {
                  out.println("</br> Doctor ID : "+doctor_name+"</br>");
                      %>
                <form action="chat.jsp" method="get">
                     <input type="radio" checked name="doc_2" value="doc_2">Talk
  
                    <input type="submit" value = "Choose me">
                </form>
                      <%
                          sess.setAttribute("doc_2_id", doctor_id);
     }
     
     if(i==3)
     {
                  out.println("</br> Doctor ID : "+doctor_name+"</br>");
                      %>
                <form action="chat.jsp" method="get">
                     <input type="radio" checked name="doc_3" value="doc_3">Talk
  
                    <input type="submit" value = "Choose me">
                </form>
                      <%
                          sess.setAttribute("doc_3_id", doctor_id);
     }
     if(i==4)
     {
                  out.println("</br> Doctor ID : "+doctor_name+"</br>");
                      %>
                <form action="chat.jsp" method="get">
                     <input type="radio" checked name="doc_4" value="doc_4">Talk
  
                    <input type="submit" value = "Choose me">
                </form>
                      <%
                          sess.setAttribute("doc_4_id", doctor_id);
     }
     
     if(i==5)
     {
                  out.println("</br> Doctor ID : "+doctor_name+"</br>");
                      %>
                <form action="chat.jsp" method="get">
                     <input type="radio" checked name="doc_6" value="doc_6">Talk
  
                    <input type="submit" value = "Choose me">
                </form>
                      <%
                          sess.setAttribute("doc_5_id", doctor_id);
     }
     
     
}

%>

<%
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>