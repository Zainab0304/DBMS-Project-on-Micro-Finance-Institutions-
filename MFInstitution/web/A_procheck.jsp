<%@page import="java.sql.*"%>
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
              String id=request.getParameter("PID");
               int pid=Integer.parseInt(id);
              String pname=request.getParameter("Pname");
              String ano=request.getParameter("Aadhar");
              long aadhar=Long.parseLong(ano);
              String gender=request.getParameter("Gender");
              String phone=request.getParameter("Phone");
              long pno=Long.parseLong(phone);
              String email=request.getParameter("Email");
              String user=request.getParameter("username");
              String pass=request.getParameter("password");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="insert into provider (PID,PNAME,AADHAR,GENDER,PHONE,EMAIL,USERNAME,PASSWORD)values('"+pid+"','"+pname+"','"+aadhar+"','"+gender+"','"+pno+"','"+email+"','"+user+"','"+pass+"')"; 
            Statement stmt=cn.createStatement();
            stmt.executeQuery(s1);
            %> 
<br><br><br><br>
<h1 style="color:#1A5276; text-align:center;">Provider Registered! 
</h1> 
<form action="A_provider.jsp" method="get">
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

