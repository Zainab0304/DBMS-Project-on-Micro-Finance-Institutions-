<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    left: 200px;
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
    .button {
  padding: 15px 15px;
  font-size: 20px;
  text-align: center;
  cursor: pointer;
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
	<p><br></p>
	<h1>Micro-Finance Institution</h1>
<p>
	<div class="info-box">
		<h4>
			Microfinance has emerged as a larger movement whose objective is
			"a world in which as everyone, especially the poor and socially marginalized
			people and households have access to a wide range of affordable, high quality
			financial products and services, including not just credit but also savings,
			insurance, payment services, and fund transfers."
			The Micro Financial Institutions (MFI) Loan Management System
		    aims to offer financial services like loans, incentives, savings account,
		    income management services, etc. 
		</h4>
	</div>
	<div class="login-box">
		
	</p>

	<h3>LOG-IN
 		<div>
	<p id="hello"> 
	<form action="logincheck.jsp" method="get">
	<input type="text" placeholder="Username" id="user" name="username" required="username">
	<p>
		<input type="password" placeholder="Password" id="pass" name="password" required="password">
	</p>
	
	<p>
		<button class="button" type="submit">Submit</button>
	</p>
</form>
</div>
</div>


	</div>
        
</body>
</html>
