<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<html>
<head>
<title>Micro-Financial Institutions</title>

</head>
 <style type="text/css">
h3{
  color: #1A5276;
		text-align:center;
		text-decoration: italic;
		font-size: 20pt;
		font-family: "Georgia",Times,serif;
}
body{
		background: url(http://www.totalfinance.com.au/wp-content/uploads/2015/04/background.png);
		background-repeat: no-repeat;
		background-size: cover;
	}
table{
  font-family: Calibri; 
  color:#06315f; 
  font-size: 11pt; 
  font-style: normal;
  font-weight: bold; 
  border-collapse: collapse;
  width: 900px; 
    border: 0px solid black;
}
table,tr,th,td{
	border:0px solid black;
}
table.inner{
  border: 0px
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
    <%int ran=0;%>
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
              ran=(int)(Math.random()*1000000);
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="select pid from provider where pid='"+ran+"'"; 
            Statement stmt=cn.createStatement();
            ResultSet res=stmt.executeQuery(s1);
            while(res.next())
            {
                ran=(int)(Math.random()*1000000);
                res.absolute(1);
                s1="select pid from provider where pid='"+ran+"'";
            }
          session.setAttribute("pid",ran);
       
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
<h3>Provider Registration Form</h3>
<p></p>
<p></p>
 <form action="A_procheck.jsp" method="get">
<table align="center" cellpadding = "10">
 
<!----- Provider id --------------------------------------------------------->
<tr>
<td>Provider ID</td>
<td><input type="text" name="PID" maxlength="10" readonly value=<%=ran%> <input/>
</td>
</tr>
 
<!----- Name ---------------------------------------------------------->
<tr>
<td>Provider Name</td>
<td><input type="text" name="Pname" maxlength="30"/>
</td>
</tr>
 
 <!----- Aadhar no ---------------------------------------------------------->
<tr>
<td>Aadhar No.</td>
<td>
<input type="text" name="Aadhar"  />
</td>
</tr>

<!----- Gender ----------------------------------------------------------->
<tr>
<td>Gender</td>
<td>
Male <input type="radio" name="Gender" value="M" />
Female <input type="radio" name="Gender" value="F" />
Other <input type="radio" name="Gender" value="O" />
</td>
</tr>
 
 <!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>Phone</td>
<td>
<input type="text" name="Phone" maxlength="10" />
</td>
<td>Email ID</td>
<td><input type="text" name="Email" maxlength="100" /></td>
</tr>

<!----- username---------------------------------------------------------->
<tr>
<td>Create New Username</td>
<td>
<input type="text" name="username"  />
</td>
<td>Create New Password</td>
<td>
<input type="password" name="password"  />
</td>
</tr>
 
<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="5" align="center">
        <button class="button" type="Submit">Insert Provider</button></form>
	<form action="A_home.jsp" method="get">
	<button class="button" type="Submit">Back</button>
</td>
</tr>
</table>
 
</form>
 
</body>
</html>