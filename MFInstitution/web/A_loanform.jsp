<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<html>
<head>
<title>Micro Finance Institution</title>

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
            String s1="select APP_NO from LOAN where APP_NO='"+ran+"'"; 
            Statement stmt=cn.createStatement();
            ResultSet res=stmt.executeQuery(s1);
            while(res.next())
            {
                ran=(int)(Math.random()*1000000);
                res.absolute(1);
                s1="select APP_NO from LOAN where APP_NO='"+ran+"'";
            }
          session.setAttribute("app_no",ran);
       
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
<h3>Loan Application</h3>
<p></p>
<p></p>
<p></p>
<p></p>
 
<table align="center" cellpadding = "10">
 
<!----- Provider id ----------------------------------------------------------
<tr>
<td>Provider ID</td>
<td><input type="text" name="Provider_id" maxlength="10"/>
</td>
<td>Application ID</td>
<td><input type="text" name="P_name" maxlength="10"/>
</td>
</tr>-->
 <form action="A_loanch.jsp" method="get">
 <tr>
<td>Application No.</td>
<td><input type="text" name="App" maxlength="10" readonly value=<%=ran%> <input/>
</td>
</tr>
 <!----- Aadhar no ---------------------------------------------------------->
<tr>
<td>Customer ID</td>
<td>
<input type="text" name="CID" maxlength="10" />
</td>
<td> Account No.</td>
<td>
<input type="text" name="acc_no" maxlength="10" />
</td>
</tr>

 <!----- Branch Name ---------------------------------------------------------->
<tr>
<td>Loan Amount</td>
<td>
<input type="text" name="loan_amt" maxlength="10" />
</td>
<td>Loan Guarantor</td>
<td>
<input type="text" name="loan_guar" />
</td>
</tr>

<tr>
<td>Loan Duration (in Months)</td>
<td>
<input type="text" name="loan_dur" maxlength="10" />
</td>
</tr>

<tr>
<td>Purpose<br /><br /><br /></td>
<td><textarea name="purpose" rows="4" cols="30"></textarea></td>
</tr>
 
<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="5" align="center">
	
	<button class="button" type="Submit">Submit Application</button>
	<form action="A_loan.jsp" method="get">
            <button class="button" type="Submit">Back</button></form>
</td>
</tr>
</table>
 

 
</body>
</html>