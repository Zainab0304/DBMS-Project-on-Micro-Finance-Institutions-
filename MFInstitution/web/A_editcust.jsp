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
    <% //String ano="";
        long ano=0;
        String cno="";
      long cid=0;
       String title="";
       String fn="";
       String mn="";
       String ln="";
       String dob="";
       String gender="";
       int age=0;
       long pno=0;
       String email="";
       String add="";
       String city="";
       int pin=0;
       String state="";
       String country="";
       String aadhar="";
       long annual=0;
       String occ="";
       String qual="";%>
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
              cno=request.getParameter("CID");
              cid=Integer.parseInt(cno);
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="select * from customer where CID='"+cid+"'";
            //String s2="select * from C_PERSONAL where CID='"+cid+"'";
            //String s3="select * from c_financial where ac_no='"+ano+"'";
            Statement stmt=cn.createStatement();
            ResultSet rs=stmt.executeQuery(s1);
            boolean valid=false;
            while(rs.next())
            {
                valid=true;
                ano=rs.getLong("ac_no");
                //ano=Integer.parseInt(acc);
                String s2="select * from C_PERSONAL where CID='"+cid+"'";
                ResultSet res=stmt.executeQuery(s2);
                while(res.next())
                {
                title=res.getString("title");
                fn=res.getString("fname");
                mn=res.getString("mname");
                ln=res.getString("lname");
                dob=res.getString("dob");
                gender=res.getString("gender");
                age=res.getInt("age");
                pno=res.getLong("phone");
                email=res.getString("email");
                add=res.getString("address1");
                city=res.getString("city");
                pin=res.getInt("pin");
                state=res.getString("state");
                country=res.getString("country");
                }
                String s3="select * from c_financial where ac_no='"+ano+"'";
                ResultSet rest=stmt.executeQuery(s3);
                while(rest.next())
                {
                    annual=rest.getLong("ann_inc");
                    occ=rest.getString("occupation");
                    qual=rest.getString("qualification");
                    aadhar=rest.getString("aadhar");
                }
                    
                
            }
            
          if(valid==false)
            {
            response.sendRedirect("A_invaledit.jsp");
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
<h3>Applicant Registration Form</h3>

 
<table align="center" cellpadding = "10">
<form action="A_inscheck.jsp" method="get">
    <tr>
<td>Account No.</td>
<td><input type="text" name="ano" maxlength="10" readonly value=<%=ano%>>

</td>
<td>Customer ID</td>
<td><input type="text" name="CID" maxlength="10" readonly value=<%=cid%>>

</td>
</tr>
    
 <!----- Date Of Birth -------------------------------------------------------->
<tr>
<td>Title</td>
 
<td>
<select name="title" id="title"  >
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
<td><input type="text" name="First_Name" required  value=<%=fn%>>

</td>
<td>Middle Name</td>
<td><input type="text" name="Middle_Name" value=<%=mn%>>

</td>
</tr>


<!----- Last Name ---------------------------------------------------------->
<tr>
<td>Last Name*</td>
<td><input type="text" name="Last_Name" required value=<%=ln%>>

</td>
<td>Date of Birth*</td>
 
<td>
<input type="Date" name="Date" value=<%=dob%>>
</td>
</tr>
 
 
<!----- Gender ----------------------------------------------------------->
<tr>
<td>Gender</td>
<td>
Male <input type="radio" name="Gender" value="M" >
Female <input type="radio" name="Gender" value="F" >
Others <input type="radio" name="Gender" value="O" >
</td>
<td>Age</td>
<td>
<input type="text" name="Age" value=<%=age%> >
</td>
</tr>

<!----- Mobile Number ---------------------------------------------------------->
<tr>
<td>Phone</td>
<td>
<input type="text" name="Phone" maxlength="10" value=<%=pno%> >
</td>
<td>Email ID</td>
<td><input type="text" name="Email" value=<%=email%> ></td>
</tr>
 
<!----- Address ---------------------------------------------------------->
<tr>
<td>Address <br /><br /><br /></td>
<td><textarea name="Address1" rows="4" cols="30" ><%=add%></textarea></td>
</tr>

 
<!----- City ---------------------------------------------------------->
<tr>
<td>City</td>
<td><input type="text" name="City" value=<%=city%> >
</td>
<td>Pin Code</td>
<td><input type="text" name="Pin" value=<%=pin%> >
</td>
</tr>
 
 
<!----- State ---------------------------------------------------------->
<tr>
<td>State</td>
<td><input type="text" name="State" value=<%=state%>>
</td>
<td>Country</td>
<td><input type="text" name="Country" value="India" readonly="readonly" /></td>
</tr>

 
<!----- Aadhar no ---------------------------------------------------------->
<tr>
<td>Aadhar No.</td>
<td>
<input type="text" name="Aadhar" maxlength="16" value=<%=aadhar%> >
</td>
</tr>
 
 <!----- Annual Income ---------------------------------------------------------->
<tr>
<td>Family Annual Income</td>
<td>
<input type="text" name="Ann_Inc" value=<%=annual%> >
</td>
</tr>

<!----- Occupation ---------------------------------------------------------->
<tr>
<td>Occupation</td>
<td>
<input type="text" name="Occ" value=<%=occ%> >
</td>
<td>Qualification</td>
<td>
<input type="text" name="Qual" value=<%=qual%> >
</td>
</tr>


<!----- Submit and Reset ------------------------------------------------->
<tr>
<td colspan="5" align="center">
	
    <button class="button" type="Submit">Edit Customer Details</button></form>
	<form action="A_applicant.jsp" method="get">
	<button class="button" type="Submit">Back</button>
</td>
</tr>
</table>
 
</form>
 
</body>
</html>