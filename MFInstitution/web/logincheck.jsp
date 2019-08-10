<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Micro-Financial Institutions</title>
    </head>
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
               String user=request.getParameter("username");
               String pass=request.getParameter("password");
               out.println(user+pass);
               if (user.equals("admin") && pass.equals("Admin"))
               {
                  response.sendRedirect("A_home.jsp"); 
               }
               Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
               Statement stmt=cn.createStatement();
               String s1="select username , password from provider where username='"+user+"'";
               ResultSet rs=stmt.executeQuery(s1);
               boolean entry=false;
               while(rs.next())
               {   
                  if( user.equals(rs.getString("username")) && pass.equals(rs.getString("password")))
                  {
                      response.sendRedirect("U_home.jsp");
                      entry=true;
                  }
               }
                  if(entry==false)
                 {   
                   response.sendRedirect("invalid.jsp");
                  
               }              
               rs.close();
               stmt.close();
               cn.close(); 
           } catch(Exception e)
             { out.println("ERROR OCCURED"+e);
              e.printStackTrace();
              }
           %>  
    </body>
</html>
