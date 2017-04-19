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
HttpSession sess = request.getSession(false); //use false to use the existing session
String sql = "SELECT * FROM patient where username = '"+sess.getAttribute("username")+"'" ;
resultSet = statement.executeQuery(sql);
   int count_pat = 0 ; // this is figure the number of chats exchanged between the doctor and the patient 
    int count_doc = 0 ;
String id = null;
while(resultSet.next())
{
     id = resultSet.getString("id");
  //   out.println("</br>"+id);
    String chat = resultSet.getString("chat");
    String doc_chat = resultSet.getString("doc_chat");
    String chat1 = resultSet.getString("chat1");
    String doc_chat1 = resultSet.getString("doc_chat1");
    
    String chat2 = resultSet.getString("chat2");
    String doc_chat2 = resultSet.getString("doc_chat2");
    
    String chat3 = resultSet.getString("chat3");
    String doc_chat3 = resultSet.getString("doc_chat3");
    
    String chat4 = resultSet.getString("chat4");
    String doc_chat4 = resultSet.getString("doc_chat4");
    
    String chat5 = resultSet.getString("chat5");
    String doc_chat5 = resultSet.getString("doc_chat5");
  
 
    if(chat != null)
    {
        count_pat++;
    }
    if(chat1 != null)
    {
        count_pat++;
    }
    if(chat2 != null)
    {
        count_pat++;
    }
    if(chat3 != null)
    {
        count_pat++;
    }
    if(chat4 != null)
    {
        count_pat++;
    }
    if(chat5 != null)
    {
        count_pat++;
    }
    if(doc_chat != null)
    {
        count_doc++;
    }
    if(doc_chat1 != null)
    {
        count_doc++;
    }
    if(doc_chat2 != null)
    {
        count_doc++;
    }
    if(doc_chat3 != null)
    {
        count_doc++;
    }
    if(doc_chat4 != null)
    {
        count_doc++;
    }
    if(doc_chat5 != null)
    {
        count_doc++;
    }
    int i = 0 ;
    for(i = 0 ; i < count_pat;i++)
    {
        
        if(i==1)
        out.println("</br>Patient : " + chat1);
        if(i==2)
        out.println("</br>Patient : " + chat2);
        if(i==3)
        out.println("</br>Patient : " + chat3);
        if(i==4)
        out.println("</br>Patient : " + chat4);
        if(i==5)
        out.println("</br>Patient : " + chat5);
        
    }     
        for(i = 0 ; i < count_doc;i++)
        {
           
            if(i==1)
            out.println("</br>Doc : " + doc_chat1);
            if(i==2)
            out.println("</br>Doc : " + doc_chat2);
            if(i==3)
            out.println("</br>Doc : " + doc_chat3);
            if(i==4)
            out.println("</br>Doc : " + doc_chat4);
            if(i==5)
            out.println("</br>Doc : " + doc_chat5);

        }

out.println("</br> printing pat count %d " + count_pat);
%>
    
<%
}
String chat_message = request.getParameter("pat_message");


if(count_pat == 1)
{
%>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
    String sql_insert = "update patient set chat1 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);

}
if(count_pat == 2)
{
%>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
    String sql_insert = "update patient set chat2 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}

if(count_pat == 3)
{
%>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
   String sql_insert = "update patient set chat3 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_pat == 4)
{
%>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
    String sql_insert = "update patient set chat4 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_pat == 5)
{
%>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
    String sql_insert = "update patient set chat5 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_pat == 6)
{
    out.println("Enough free service has been given");
%>
<a href="patient_login.html">go back</a>
<%


}







//out.println("all well until here");

resultSet = statement.executeQuery(sql);

}
catch (Exception e){
e.printStackTrace();
}
%>
</table>