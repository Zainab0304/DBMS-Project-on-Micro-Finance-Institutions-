<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
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
        <%int emi=0;%>
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
              String acc=request.getParameter("ano");
               int ano=Integer.parseInt(acc);
               int d1=0,d2=0,m1=0,m2=0,pri=0,bal=0,dur=0,inter=0,amt=0;
               
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="SELECT PRINCIPAL INTO C_PRIN,BALANCE INTO C_BAL,DUR INTO C_DUR,EXTRACT(MONTH FROM LAST) AS M1,EXTRACT(DAY FROM LAST) AS L1 FROM EMI WHERE APP_NO='"+ano+"'";
            String s2="SELECT EXTRACT(MONTH FROM SYSDATE) AS M2,EXTRACT(DAY FROM SYSDATE) AS L2 FROM DUAL";
            //String s2="update c_financial set aadhar='"+aad+"',ANN_INC='"+annual+"',OCCUPATION='"+occ+"',QUALIFICATION='"+qual+"' WHERE AC_NO='"+ano+"'"; 
            Statement stmt=cn.createStatement();
            ResultSet rs=stmt.executeQuery(s1);
            //stmt.executeQuery(s2);
            while(rs.next())
            {
               pri=rs.getInt("C_PRIN"); 
               bal=rs.getInt("C_BAL");
               dur=rs.getInt("C_DUR");
               m1=rs.getInt("M1");
               d1=rs.getInt("L1");
               bal=pri-bal;
               ResultSet res=stmt.executeQuery(s2);
               while(res.next())
               {
               m2=rs.getInt("M2");
               d2=rs.getInt("L2");
               }
               
               if(d2>=d1 && m2>m1 && dur!=0)
                {
                        inter=(10*bal)/100;
                        amt=bal+inter;
                        emi=amt/dur;
                        dur=dur-1;
                }
            else{
                inter=0;
                emi=0;
                }
               String s3="UPDATE EMI SET BALANCE='"+amt+"',EMI_AMT='"+emi+"',DUR='"+dur+"',INTEREST='"+inter+"' WHERE APP_NO='"+ano+"'";
               stmt.executeQuery(s2);
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
  <td><input type="text" name="app_id" placeholder="EMI.." readonly value=<%=emi%>/></td>
</tr>
  
  <form action="A_home.jsp" method="get">
      <center><button class="button" type="Submit">Back</button></center></form>
</td>
</tr>
</table>
    
    </body>
</html>

