<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Micro-Financial Institutions</title>
</head>
<style type="text/css">
	h1{
		color: #1A5276;
		text-align:center;
		text-decoration: italic;
		font-family: "Georgia",Times,serif;
        
	}
	h4{
		text-align:justify;
		font-family: Arial, Helvetica, sans-serif;
		color: #06315f;
		width: 400px;
        left: 100px;
	}
	body{
		background: url(http://www.totalfinance.com.au/wp-content/uploads/2015/04/background.png);
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	h3{
		text-align:center;
		color: #06315f;
	}
	.info-box {
	box-sizing: border-box;
    position: relative;
    top: 50px;
    left: 100px;
    width: 600px;
    min-height: 300px;
    }
	.login-box, body.narrow {
	box-sizing: border-box;
	box-shadow: 0 2px 4px 0 rgba(181,181,181,.7);
    width: 360px;
    right: 100px;
    min-height: 200px;
    z-index: 1;
    padding: 0 5px;
    border-top: 1px solid #f1f1f5;
    position: absolute;
    top: 150px;
    }
    table{
  font-family: Calibri; 
  color:#06315f; 
  font-size: 14pt; 
  font-style: normal;
  font-weight: bold;
  border-collapse: collapse;
  width: 600px; 
    border: 1px solid black;
}
table,th,td{
	border:1px solid black;
  border-collapse: collapse;
}
    .button {
  padding: 15px 15px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
  align-self: center;
  outline: none;
  color: #ffffff;
  background-color: #031e4f;
  border: none;
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
   <%int app=0;
    String stat="";%>
   <% try{
              Class.forName("oracle.jdbc.driver.OracleDriver");
          }
          catch(ClassNotFoundException e)
          {
              out.print("Driver not found");
               e.printStackTrace();
          } 
          try {
               String ano=request.getParameter("app_id");
               app=Integer.parseInt(ano);
               Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
               Statement stmt=cn.createStatement();
               /*String s2="UPDATE LOAN SET STATUS='Accepted' WHERE APP_NO='"+app+"' AND AC_NO IN(SELECT C.AC_NO FROM C_FINANCIAL C WHERE C.AC_NO=AC_NO AND C.ANN_INC>AMT AND AMT BETWEEN 25000 AND 40000)";
               String s3="UPDATE LOAN SET STATUS='Rejected' WHERE APP_NO='"+app+"' AND AC_NO IN(SELECT C.AC_NO FROM C_FINANCIAL C WHERE C.AC_NO=AC_NO AND C.ANN_INC<=AMT OR AMT NOT BETWEEN 25000 AND 40000)";*/
               String s1="select STATUS FROM LOAN WHERE APP_NO='"+app+"'";
               /*stmt.executeQuery(s2);
               stmt.executeQuery(s3);*/
               ResultSet rs=stmt.executeQuery(s1);
               boolean entry=false;
               while(rs.next())
               {
                   entry=true;
                   stat=rs.getString("status");
               }
               if(entry=false)
               {
                   stat="Invalid No";
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
	<h1>Loan Generation</h1>
<p>
	<div class="info-box">
	<table align="center" cellpadding = "10">
  <tr>
    <td>Loan Size</td>
    <td>? 25000 to 40000</td>
  </tr>
  <tr>
    <td>Rate of Interest</td>
    <td>10% service charges</td>
  </tr>
  <tr>
    <td>Loan Tenure</td>
    <td>18-24 months</td>
  </tr>
  <tr>
    <td>Purpose of Loan</td>
    <td><p>Lifecycle Needs: such as weddings, funerals, childbirth, education, home building, widowhood and old age.                                                                                                    
    	Personal Emergencies: such as sickness, injury, unemployment, theft, harassment or death.                      
        Disasters: such as campfires, floods, cyclones and man-made events like war or bulldozing of dwellings.         
        Investment Opportunities: expanding a business, buying land or equipment, improving housing, securing a job, etc. 
</p>
</td>
</tr>
</table>
	</div>
	<div class="login-box">
		
	</p>
    <p>
    	<form action="A_loanform.jsp" method="get">
            <center><button class="button" type="Submit">Loan Application</button></center></form>

	</p>

	<h3>Application Status
 		<div>
	<p id="hello"> 
            <form action="A_loanstatch.jsp" method="get">
	<input type="text" placeholder="Application ID" name="app_id" value=<%=app%>>
	<p>
            
                <button class="button" type="Submit">Check Status</button></form>
	</p>
	<p>
		<input type="text" placeholder="Status" name="Status" readonly value=<%=stat%>>
	</p>
        <p>
            <form action="A_home.jsp" method="get">
                <button class="button" type="Submit">Back</button></form>
	</p>
	
</form>
</div>
</div>


	</div>
</body>
</html>