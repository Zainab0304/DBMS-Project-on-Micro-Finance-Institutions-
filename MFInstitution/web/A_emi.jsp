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
input[type="text"] {
    width: 800px;
}
</style>
<body>
	<p><br></p>
<h3>Generate EMI</h3>
<p></p>
<p></p>

<table align="center" cellpadding = "10">
 <form action="A_emical.jsp" method="get">
<tr>
<td>Enter Application ID to check monthly EMI</td>
</tr>
<tr>
  <td><input type="text" name="app_id" placeholder="Application ID....." /></td>
</tr>


<tr>
<td colspan="5" align="center">
  <button class="button" type="Submit">Generate EMI for this month</button></form>
  <tr>
  <td><input type="text" name="app_id" placeholder="EMI.." /></td>
</tr>
  
  <form action="A_home.jsp" method="get">
      <center><button class="button" type="Submit">Back</button></center></form>
</td>
</tr>
</table>
</body>
</html>