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
       h3{
  color: #1A5276;
		text-align:center;
		text-decoration: italic;
		font-size: 20pt;
		font-family: "Georgia",Times,serif;
}
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
        <%int pid=0;
    String pname="";
    String aadhar="";
    String gen="";
    long ph=0;
    String email="";
    String user="";
    String pass="";
    %>
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
              pid=Integer.parseInt(id);
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="select * from provider where pid='"+pid+"'"; 
            Statement stmt=cn.createStatement();
            ResultSet rs=stmt.executeQuery(s1);
            boolean valid=false;
            while(rs.next())
            {
                valid=true;
                pname=rs.getString("pname");
                  aadhar=rs.getString("aadhar");
                  gen=rs.getString("gender");
                  ph=rs.getLong("phone");
                  email=rs.getString("email");
                  user=rs.getString("username");
                  pass=rs.getString("password");
            }
            if(valid==false)
            {
            response.sendRedirect("A_invalid.jsp");
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
<p><br></p>
<h3>Edit Provider</h3>
<p></p>
<p></p>
 <form action="A_editch.jsp" method="get">
<table align="center" cellpadding = "10">
 
<!----- Provider id --------------------------------------------------------->
<tr>
<td>Provider ID</td>
<td><input type="text" name="PID" maxlength="10" readonly value=<%=pid%> />
</td>
</tr>
 
<!----- Name ---------------------------------------------------------->
<tr>
<td>Provider Name</td>
<td><input type="text" name="Pname" maxlength="30" value=<%=pname%> />
</td>
</tr>
 
 <!----- Aadhar no ---------------------------------------------------------->
<tr>
<td>Aadhar No.</td>
<td>
<input type="text" name="Aadhar" maxlength="16" value=<%=aadhar%> />
</td>
</tr>

<!----- Gender ----------------------------------------------------------->
<tr>
<td>Gender</td>
<td>
Male <input type="radio" name="Gender" value="M" />
Female <input type="radio" name="Gender" value="F" />
Other <input type="radio" name="Gender" value="O" />
<input value=<%=gen%> />
</td>
</tr>
 
 <!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>Phone</td>
<td>
<input type="text" name="Phone" maxlength="10" value=<%=ph%> />
</td>
<td>Email ID</td>
<td><input type="text" name="Email" maxlength="100" value=<%=email%> /></td>
</tr>

<!----- username---------------------------------------------------------->
<tr>
<td>Create New Username</td>
<td>
<input type="text" name="username" value=<%=user%> />
</td>
<td>Create New Password</td>
<td>
<input type="text" name="password" value=<%=pass%> />
</td>
</tr>
 
<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="5" align="center">
        <button class="button" type="Submit">Edit Provider</button></form>
	<form action="A_provider.jsp" method="get">
	<button class="button" type="Submit">Back</button>
</td>
</tr>
</table>
 
</form>
 
</body>
</html>

