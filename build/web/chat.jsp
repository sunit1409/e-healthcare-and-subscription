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


String doc_1 = request.getParameter("doc_1");
String doc_2 = request.getParameter("doc_2");
String doc_3 = request.getParameter("doc_3");
String doc_4 = request.getParameter("doc_4");
String doc_5 = request.getParameter("doc_5");
String doctor_id_chosen = null;
if(doc_1 != null)
    doctor_id_chosen = (String)sess.getAttribute("doc_1_id") ;
if(doc_2 != null)
    doctor_id_chosen = (String)sess.getAttribute("doc_2_id") ;
if(doc_3 != null)
    doctor_id_chosen = (String)sess.getAttribute("doc_3_id") ;
if(doc_4 != null)
    doctor_id_chosen = (String)sess.getAttribute("doc_4_id") ;
if(doc_5 != null)
    doctor_id_chosen = (String)sess.getAttribute("doc_5_id") ;
    
String sql_doc_id_patient = "update patient set doctor_key ='"+doctor_id_chosen +"'  where username = '"+sess.getAttribute("username")+"'"; 

//out.println("</br>well untill here"+sql);
statement.executeUpdate(sql_doc_id_patient);
//out.println("all well until here");
    String sql_fun = "SELECT * FROM patient where username = '"+sess.getAttribute("username")+"'" ;
    resultSet = statement.executeQuery(sql_fun);
    String patient_id = null;
    while(resultSet.next())
    {
        patient_id = resultSet.getString("id");
    }
String sql_doctor = "Select * from doctor where id = '"+doctor_id_chosen+"'   ";
resultSet = statement.executeQuery(sql_doctor);
 int place = 0;
while(resultSet.next())
{

    
    String patient_1 = resultSet.getString("patient_1"); 
    String patient_2 = resultSet.getString("patient_2");
    String patient_3 = resultSet.getString("patient_3");
    String patient_4 = resultSet.getString("patient_4");
    String patient_5 = resultSet.getString("patient_5");
    String patient_6 = resultSet.getString("patient_6");
    String patient_7 = resultSet.getString("patient_7");
    String patient_8 = resultSet.getString("patient_8");
    String patient_9 = resultSet.getString("patient_9");
    String patient_10 = resultSet.getString("patient_10");
   // out.println(""+patient_1);
  
    if(patient_1 == null)
    {
        place = 1 ;
        
    }
    else
    {
        if(patient_2 == null)
        {
            place = 2 ;
        }
        else
        {
            if(patient_3 == null)
            {
                place = 3 ;
            }
            else
            {
                if(patient_4 == null)
                {
                    place = 4 ;
                }
                else
                {
                    if(patient_5 == null)
                    {
                       place = 5 ;
                    }
                    else
                    {
                        if(patient_6 == null)
                        {
                           place = 6 ;
                        }
                        else
                        {
                                if(patient_7 == null)
                                {
                                    place = 7 ;
                                }
                                else
                                {
                                        if(patient_8 == null)
                                        {
                                            place = 8 ;
                                        }
                                        else
                                        {
                                             if(patient_9 == null)
                                            {
                                               place = 9;
                                            }
                                             else
                                             {
                                                    if(patient_10 == null)
                                                    {
                                                       place = 10 ;
                                                    }
                                             
                                             }
                                        }
                                }
                        }
                    }
                
                }
            
            }
        }
    }

 //   out.println("value"+place);
}

if(place == 1)
{
    String sql_patient_info = "update doctor set patient_1 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 2)
{
    String sql_patient_info = "update doctor set patient_2 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 3)
{
    String sql_patient_info = "update doctor set patient_3 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 4)
{
    String sql_patient_info = "update doctor set patient_4 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 5)
{
    String sql_patient_info = "update doctor set patient_5 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 6)
{
    String sql_patient_info = "update doctor set patient_6 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 7)
{
    String sql_patient_info = "update doctor set patient_7 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 8)
{
    String sql_patient_info = "update doctor set patient_8 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 9)
{
    String sql_patient_info = "update doctor set patient_9 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}
if(place == 10)
{
    String sql_patient_info = "update doctor set patient_10 = '"+patient_id+"' where id = '"+doctor_id_chosen+"' " ;
    statement.executeUpdate(sql_patient_info);
}

//out.println("well until here");
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

if(count_pat == 0)
{
%>
    <form action="chat_page.jsp" method="get">
         Message: <input type="text" name="pat_message">
        <input type="submit" value = "Start chat">
    </form>
<a href="patient_login.html">go back</a>
<%
    String nothing = "";
    String sql_insert = "update patient set chat ='"+nothing+"' where id ='"+id+"' " ;
    statement.executeUpdate(sql_insert);
}
if(count_pat != 0)
{
    %>
    <form action="chat_page.jsp" method="get">
        Message: <input type="text" name="pat_message">
        <input type="submit" value = "send message">
    </form>
<a href="patient_login.html">go back</a>
<%
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</table>