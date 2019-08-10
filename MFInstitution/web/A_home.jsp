

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Micro-Financial Institutions</title>

</head>
<style type="text/css">
 h3{
  color: #1A5276;
		text-align:center;
		text-decoration: italics;
		font-size: 20pt;
		font-family: "Georgia",Times,serif;
}
h1{
    color: #1A5276;
    text-align:center;
    text-decoration: italic;
    font-family: "Georgia",Times,serif;
        
  }
body{
		background: url(http://www.totalfinance.com.au/wp-content/uploads/2015/04/background.png);
		background-repeat: no-repeat;
		background-size: cover;
	}
table{
  font-family: Calibri; 
  font-size: 11pt; 
  font-style: normal;
  font-weight: bold;
  border-collapse: collapse;
  
    border: 0px solid black;
}



.button {
  padding: 15px 25px;
  font-size: 20px;
  width: 200px;
  height: 200px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #ffffff;
  background-color: #031e4f;
  border: none;
  border-radius: 15px;
  box-shadow: 0 2px #999;
  margin-left: 3em;
}
   
.button:hover {background-color: #02173e}

.button:active {
  background-color: #011438;
  box-shadow: 0 2px #666;
  transform: translateY(4px);
}
</style>
<body>
  <p><br></p>
<h1>Micro-Finance Institution</h1>

 
<table align="center" cellpadding = "10">
<tr>
<td>
  <form action="A_provider.jsp" method="get">
    <button class="button" type="Submit">Manage Provider</button></form>
  </td>
  <td>
  <form action="A_applicant.jsp" method="get">
  <button class="button" type="Submit">Manage Applicant</button></form>
</td>
<td>
  <form action="" method="get">
  <button class="button" type="Submit">Generate Receipt</button></form>
</td>
</tr>

  <tr>
    <td>
      <form action="A_loan.jsp" method="get">
  <button class="button" type="Submit">Generate Loan</button>
</form>
</td>
<td>
  <form action="A_emi.jsp" method="get">
  <button class="button" type="Submit">Transactions</button>
</form>
</td>
<td>
  <form action="login.jsp" method="get">
  <button class="button" type="Submit">LOG-OUT</button>
</form>
</td>
</tr>
</table>
 
</body>
</html>

