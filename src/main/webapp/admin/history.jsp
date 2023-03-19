<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/showReuqest.css">
    <title>Show Request</title>
</head>
<style>
	h1{
		text-align: center;
		margin-top: 12%;
		font-size: 80px;
		color: red;
	}
</style>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	%>
    <header>
        <img src="../image/lmsLogo.png" alt="logo" class="logoImg" height=110px>
    </header>
    <nav class="navbar">
        <a href="adminHome.jsp">Home</a>
        <a href="showRequest.jsp">Show Requests</a>
        <a href="activeLoans.jsp">Active Loans</a>
        <a href="history.jsp" id="history">History</a>
        
        <a href="../logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->
    		
    	<section>
		    <h2 class="rejected">Rejected requests</h2>
		         <table class="request-table">
		             <thead>
		                 <tr>
		                     <th>Customer ID</th>
		                     <th>Name</th>
		                     <th>Contact</th>
		                     <th>Vehicle cost</th>
		                     <th>Loan amount</th>
		                     <th>EMI plan</th>
		                     <th>Account number</th>
		                     <th>Account balance</th>
		                     <th>Status</th>
		                 </tr>
		             </thead>
		
		             <tbody>
			            <%
		                    try{
		                    	Connection con = ConnectionProvider.getCon();
		                    	Statement st = con.createStatement();
		                    	ResultSet rs = st.executeQuery("select loandetails.id, customer.name, customer.mobileNumber, customer.email, loandetails.vehicleCost, loandetails.loanAmount, loandetails.emiPlan, loandetails.accountNumber, loandetails.accountBalance, loandetails.status from loandetails Inner Join customer on customer.email = loandetails.email where loandetails.status='Rejected';");
		                    	while(rs. next()){
	                    %>
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %> <br> <%=rs.getString(4) %> </td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(7) %></td>
							<td><%=rs.getString(8) %></td>
							<td><%=rs.getString(9) %></td>
							<td class="red"><%=rs.getString(10) %></td>
						</tr>
						<%}
				         }
				         catch(Exception e){
				        	 System.out.print(e);
				         }
				         %>
		             </tbody>
		         </table>
		  </section>	
    		
    		<% 
				String name = null;
		    
			    if(session.getAttribute("name") == null) {
			    	response.sendRedirect("adminLogin.jsp");
			    }else {
						
		    	 name = session.getAttribute("name").toString();        		
	    	}%>	
    </body>
    </html>