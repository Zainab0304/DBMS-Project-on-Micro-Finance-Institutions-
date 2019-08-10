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
              String id=request.getParameter("provider");
               int pid=Integer.parseInt(id);
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="select PID from provider where PID='"+pid+"'";
            String s2="Delete from provider where PID='"+pid+"'"; 
            Statement stmt=cn.createStatement();
            stmt.executeQuery(s1);
             ResultSet rs=stmt.executeQuery(s1);
            boolean valid=false;
            while(rs.next())
            {
                valid=true;
                stmt.executeQuery(s2);
            %> 
<br><br><br><br>
<h1 style="color:#1A5276; text-align:center;">Provider Deleted!
</h1> 
<form action="A_provider.jsp" method="get">
    <center><button class="button" type="Submit">Done</button></center></form>
<br><br><br><br>

<% }
if (valid=false)
{
response.sendRedirect("A_invalpro.jsp");
}
stmt.close();
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

