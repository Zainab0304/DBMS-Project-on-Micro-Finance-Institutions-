<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Micro-Financial Institutions</title>
    </head>
    <style type="text/css">
body{
background: url(http://www.totalfinance.com.au/wp-content/uploads/2015/04/background.png);
background-repeat: no-repeat;
background-size: cover;}
.button {
  padding: 15px 15px;
  font-size: 12px;
  text-align: center;
  position: relative;
  cursor: pointer;
  outline: none;
  color: #ffffff;
  background-color: #031e4f;
  border-collapse: collapse;
  border-radius: 15px;
  box-shadow: 0 2px #999;
}
   
.button:hover {background-color: #02173e}

.button:active {
  background-color: #011438;
  box-shadow: 0 2px #666;
  transform: translateY(4px);
}

</style> 
    <body>
        <%       
         try{
              Class.forName("oracle.jdbc.driver.OracleDriver");
          }
          catch(ClassNotFoundException e)
          {
              out.print("Driver not found");
               e.printStackTrace();
          } 
          try {
              String acc=request.getParameter("ano");
               long ano=Long.parseLong(acc);
               String cust=request.getParameter("CID");
               long cid=Long.parseLong(cust);
              String title=request.getParameter("title");
              String fn=request.getParameter("First_Name");
              String mn=request.getParameter("Middle_Name");
              String ln=request.getParameter("Last_Name");
              String dob=request.getParameter("Date");
              /*SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yy");
              Date dob = df.parse(d);*/
              String gender=request.getParameter("Gender");
              String a=request.getParameter("Age");
               int age=Integer.parseInt(a);
              String phone=request.getParameter("Phone");
              long pno=Long.parseLong(phone);
               String email=request.getParameter("Email");
              String add1=request.getParameter("Address1");
              String city=request.getParameter("City");
              String p=request.getParameter("Pin");
              int pin=Integer.parseInt(p);
              String state=request.getParameter("State");
              String country=request.getParameter("Country");
              String aadhar=request.getParameter("Aadhar");
              
              String ann=request.getParameter("Ann_Inc");
              long annual=Long.parseLong(ann);
              String occ=request.getParameter("Occ");
              String qual=request.getParameter("Qual");
  
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="update c_personal set TITLE='"+title+"',FNAME='"+fn+"',MNAME='"+mn+"',LNAME='"+ln+"',DOB='"+dob+"',GENDER='"+gender+"',AGE='"+age+"',PHONE='"+pno+"',EMAIL='"+email+"',ADDRESS1='"+add1+"',CITY='"+city+"',PIN='"+pin+"',STATE='"+state+"',COUNTRY='"+country+"' WHERE CID='"+cid+"'";
//String s1="insert into C_PERSONAL values('"+cid+"','"+title+"','"+fn+"','"+mn+"','"+ln+"','"+dob+"','"+gender+"','"+age+"','"+pno+"','"+email+"','"+add1+"','"+city+"','"+pin+"','"+state+"','"+country+"')";
            //String s2="insert into C_FINANCIAL values('"+ano+"','"+aad+"','"+annual+"','"+occ+"','"+qual+"')";
            String s2="update c_financial set aadhar='"+aadhar+"',ANN_INC='"+annual+"',OCCUPATION='"+occ+"',QUALIFICATION='"+qual+"' WHERE AC_NO='"+ano+"'"; 
            Statement stmt=cn.createStatement();
            stmt.executeQuery(s1);
            stmt.executeQuery(s2);
            %> 
<br><br><br><br>
<h1 style="color:#1A5276; text-align:center;">Customer Details Edited! 
</h1> 
<form action="A_applicant.jsp" method="get">
    <center><button class="button" type="Submit">Done</button></center></form>
<br><br><br><br>

<% stmt.close();
cn.close(); 
}
catch(Exception e)
{    
out.println("ERROR OCCURED"+e);
e.printStackTrace();
          
}
      
%>
    
    </body>
</html>

