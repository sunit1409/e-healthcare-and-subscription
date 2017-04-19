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
HttpSession sess = request.getSession(false); 

//use false to use the existing session
//out.println("hey session  "+sess.getAttribute("username"))
//out.println("all well until here");
String pat1 = request.getParameter("patient_1");
String pat2 = request.getParameter("patient_2");
String pat3 = request.getParameter("patient_3");
String pat4 = request.getParameter("patient_4");
String pat5 = request.getParameter("patient_5");
String pat6 = request.getParameter("patient_6");
String pat7 = request.getParameter("patient_7");
String pat8 = request.getParameter("patient_8");
String pat9 = request.getParameter("patient_9");
String pat10 = request.getParameter("patient_10");
String patient_number = null ;
if(pat1 != null)
    patient_number = "1" ;
if(pat2 != null)
    patient_number =  "2" ;
if(pat3 != null)
    patient_number =  "3" ;
if(pat4 != null)
    patient_number =  "4" ;
if(pat5 != null)
    patient_number =  "5" ;
if(pat6 != null)
    patient_number =  "6" ;
if(pat7 != null)
    patient_number =  "7" ;
if(pat8 != null)
    patient_number =  "8" ;
if(pat9 != null)
    patient_number =  "9" ;
if(pat10 != null)
    patient_number =  "10" ;
// patient number has been obtained 

if(patient_number != null)
sess.setAttribute("patient_number", patient_number);
else
    patient_number = (String)sess.getAttribute("patient_number");
String sql = "SELECT * FROM doctor where username = '"+sess.getAttribute("username")+"'"; // this sql is to find the id of the patient 
//out.println("</br>"+pat1+pat2+pat3+pat4+pat5+pat6+pat7+pat8+pat9+pat10); 

resultSet = statement.executeQuery(sql);
String patient_id = null;
    while(resultSet.next())
    {
        if(patient_number == "1")
        {
            patient_id = resultSet.getString("patient_1");
        }
        if(patient_number == "2")
        {
            patient_id = resultSet.getString("patient_2");
        }
        if(patient_number == "3")
        {
            patient_id = resultSet.getString("patient_3");
        }
        if(patient_number == "4")
        {
            patient_id = resultSet.getString("patient_4");
        }
        if(patient_number == "5")
        {
            patient_id = resultSet.getString("patient_5");
        }
        if(patient_number == "6")
        {
            patient_id = resultSet.getString("patient_6");
        }
        if(patient_number == "7")
        {
            patient_id = resultSet.getString("patient_7");
        }
        if(patient_number == "8")
        {
            patient_id = resultSet.getString("patient_8");
        }
        if(patient_number == "9")
        {
            patient_id = resultSet.getString("patient_9");
        }
        if(patient_number == "10")
        {
            patient_id = resultSet.getString("patient_10");
        }

    }
//out.println("</br> patient id is "+patient_id+"</br>");
String sql_pat= "SELECT * FROM patient where id = '"+patient_id+"'";
resultSet = statement.executeQuery(sql_pat);
   int count_pat = 0 ; // this is figure the number of chats exchanged between the doctor and the patient 
    int count_doc = 0 ;
    String id = null;
while(resultSet.next())
{
     id = resultSet.getString("id");
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
out.println("</br> printing doc count %d " + count_doc);
%>
    
<%
}
String chat_message = request.getParameter("doc_message");

if(count_doc == 0)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<%
    String nothing = "";
    String sql_insert = "update patient set doc_chat ='"+nothing+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_doc == 1)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<a href="doctor.jsp">go back</a>
<%
    String sql_insert = "update patient set doc_chat1 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);

}
if(count_doc == 2)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<a href="doctor.jsp">go back</a>
<%
    String sql_insert = "update patient set doc_chat2 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}

if(count_doc == 3)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<a href="doctor.jsp">go back</a>
<%
   String sql_insert = "update patient set doc_chat3 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_doc == 4)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<a href="doctor.jsp">go back</a>
<%
    String sql_insert = "update patient set doc_chat4 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_doc == 5)
{
%>
    <form action="doc_chat.jsp" method="get">
        Message: <input type="text" name="doc_message">
        <input type="submit" value = "send message">
    </form>
<a href="doctor.jsp">go back</a>
<%
    String sql_insert = "update patient set doc_chat5 ='"+chat_message+"'where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_doc == 6)
{
    out.println("don't you interact too much pay more for more services");
%>
<a href="doctor.jsp">go back</a>
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