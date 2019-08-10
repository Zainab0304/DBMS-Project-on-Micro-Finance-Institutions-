<%@page import="java.sql.*"%>
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
table,th,td{
	border:0px solid black;
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
    <%int acc=0;
    int cust=0;%>
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
              acc=(int)(Math.random()*1000000);
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="select AC_NO from C_FINANCIAL where AC_NO='"+acc+"'"; 
            Statement stmt=cn.createStatement();
            ResultSet res=stmt.executeQuery(s1);
            while(res.next())
            {
                acc=(int)(Math.random()*1000000);
                res.absolute(1);
                s1="select AC_NO from C_FINANCIAL where AC_NO='"+acc+"'";
            }
          session.setAttribute("ac_no",acc);
         
          cust=(int)(Math.random()*1000000);
          String s2="select CID from C_PERSONAL where CID='"+cust+"'";
          ResultSet rs=stmt.executeQuery(s2);
            while(rs.next())
            {
                cust=(int)(Math.random()*1000000);
                rs.absolute(1);
                s2="select CID from C_PERSONAL where CID='"+cust+"'";
            }
       session.setAttribute("cid",cust);
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
<h3>Applicant Registration Form</h3>

 
<table align="center" cellpadding = "10">
<form action="A_inscheck.jsp" method="get">
    <tr>
<td>Account No.</td>
<td><input type="text" name="ano" maxlength="10" readonly value=<%=acc%> />

</td>
<td>Customer ID</td>
<td><input type="text" name="CID" maxlength="10" readonly value=<%=cust%> />

</td>
</tr>
    
 <!----- Date Of Birth -------------------------------------------------------->
<tr>
<td>Title</td>
 
<td>
<select name="title" id="title">
	<option value="mr">Mr</option>
        <option value="mrs">Mrs</option>
        <option value="mis">Miss</option>
        <option value="pro">Prof</option>
        <option value="dr">Dr</option>
	</select>
</td>
</tr>
<!----- First Name ---------------------------------------------------------->
<tr>
<td>First Name*</td>
<td><input type="text" name="First_Name" required maxlength="30"/>

</td>
<td>Middle Name</td>
<td><input type="text" name="Middle_Name" maxlength="30"/>

</td>
</tr>


<!----- Last Name ---------------------------------------------------------->
<tr>
<td>Last Name*</td>
<td><input type="text" name="Last_Name" required maxlength="30"/>

</td>
<td>Date of Birth*</td>
 
<td>
<input type="Date" name="Date">
</td>
</tr>
 
 
<!----- Gender ----------------------------------------------------------->
<tr>
<td>Gender</td>
<td>
Male <input type="radio" name="Gender" value="M" />
Female <input type="radio" name="Gender" value="F" />
Others <input type="radio" name="Gender" value="O" />
</td>
<td>Age</td>
<td>
<input type="text" name="Age"  />
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
 
<!----- Address ---------------------------------------------------------->
<tr>
<td>Address <br /><br /><br /></td>
<td><textarea name="Address1" rows="4" cols="30"></textarea></td>
</tr>

 
<!----- City ---------------------------------------------------------->
<tr>
<td>City</td>
<td><input type="text" name="City" maxlength="30" />
</td>
<td>Pin Code</td>
<td><input type="text" name="Pin" maxlength="6" />
</td>
</tr>
 
 
<!----- State ---------------------------------------------------------->
<tr>
<td>State</td>
<td><input type="text" name="State" maxlength="30" />
</td>
<td>Country</td>
<td><input type="text" name="Country" value="India" readonly="readonly" /></td>
</tr>

 
<!----- Aadhar no ---------------------------------------------------------->
<tr>
<td>Aadhar No.</td>
<td>
<input type="text" name="Aadhar" maxlength="16" />
</td>
</tr>
 
 <!----- Annual Income ---------------------------------------------------------->
<tr>
<td>Family Annual Income</td>
<td>
<input type="text" name="Ann_Inc"  />
</td>
</tr>

<!----- Occupation ---------------------------------------------------------->
<tr>
<td>Occupation</td>
<td>
<input type="text" name="Occ"  />
</td>
<td>Qualification</td>
<td>
<input type="text" name="Qual"  />
</td>
</tr>


<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="5" align="center">
	
    <button class="button" type="Submit">Register Customer</button></form>
	<form action="A_applicant.jsp" method="get">
	<button class="button" type="Submit">Back</button>
</td>
</tr>
</table>
 
</form>
 
</body>
</html>