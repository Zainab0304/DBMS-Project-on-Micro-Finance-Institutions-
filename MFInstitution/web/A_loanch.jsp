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
              String an=request.getParameter("App");
               int app=Integer.parseInt(an);
               String cust=request.getParameter("CID");
               int cid=Integer.parseInt(cust);
               String ano=request.getParameter("acc_no");
               int acc=Integer.parseInt(ano);
               String loan=request.getParameter("loan_amt");
               int amt=Integer.parseInt(loan);
              String guan=request.getParameter("loan_guar");
              String ld=request.getParameter("loan_dur");
               int dur=Integer.parseInt(ld);
              String pur=request.getParameter("purpose");
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","zainab","zainab");
            String s1="insert into LOAN (CID,AC_NO,AMT,GUARANTOR,DURATION,PURPOSE,APP_NO) VALUES('"+cid+"','"+acc+"','"+amt+"','"+guan+"','"+dur+"','"+pur+"','"+app+"')";
            String s2="UPDATE LOAN SET STATUS='Accepted' WHERE APP_NO='"+app+"' AND AC_NO IN(SELECT C.AC_NO FROM C_FINANCIAL C WHERE C.AC_NO=AC_NO AND C.ANN_INC>AMT AND AMT BETWEEN 25000 AND 40000)";
            String s3="UPDATE LOAN SET STATUS='Rejected' WHERE APP_NO='"+app+"' AND AC_NO IN(SELECT C.AC_NO FROM C_FINANCIAL C WHERE C.AC_NO=AC_NO AND C.ANN_INC<=AMT OR AMT NOT BETWEEN 25000 AND 40000)";
            String s4="select STATUS FROM LOAN WHERE APP_NO='"+app+"'";
            String s5="INSERT INTO EMI (APP_NO,PRINCIPAL,DUR) VALUES('"+app+"','"+amt+"','"+dur+"')";
            Statement stmt=cn.createStatement();
            stmt.executeQuery(s1);
            stmt.executeQuery(s2);
            stmt.executeQuery(s3);
            ResultSet rs=stmt.executeQuery(s4);
            while(rs.next())
               {
                String stat=rs.getString("status");
                if(stat.equals("Accepted")){
                    stmt.executeQuery(s5);
                    break;
                }
               }
            %> 
<br><br><br><br>
<h1 style="color:#1A5276; text-align:center;">Loan Application Submitted Successfully! 
</h1> 
<form action="A_loan.jsp" method="get">
    <center><button class="button" type="Submit">Done</button></center></form>
<br><br><br><br>

<% stmt.close();
cn.close(); 
}
catch(Exception e)
{    
out.println("ERROR OCCURED"+e);
e.printStackTrace();
          
}
      
%>
    
    </body>
</html>

