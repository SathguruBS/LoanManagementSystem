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
        <a href="requestedLoan.jsp">Requested Loans</a>
        <a href="loans.jsp" id="activeLoans">Loans</a>
        
        <a href="../logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->
   	
   	<section>
   	<%
   		String msg = request.getParameter("msg");
   		if("done".equals(msg)){
   	%>
   		<h3 align="center" class="message">Loan closed successfully !</h3>
   	<%} %>
   	<% if("wrong".equals(msg)){ %>
   		<h3 align="center" class="message">Something went wrong !</h3>
   	<%} %>
   	
   		<h2>Loan Details</h2>
				<table class="request-table">
                    <thead>
                        <tr>
                            <th>Loan ID</th>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Loan Amount</th>
                            <th>EMI Plan</th>
                            <th>EMI per month</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Close</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                    try{
                    	Connection con = ConnectionProvider.getCon();
                    	Statement st = con.createStatement();
                    	ResultSet rs = st.executeQuery("select loandetails.id, customer.name, customer.mobileNumber, customer.email, loandetails.loanAmount, loandetails.emiPlan, loandetails.emiPerMonth, loandetails.date, loandetails.status from loandetails Inner Join customer on customer.email = loandetails.email where loandetails.status!='Pending';");
                    	while(rs. next()){
                    %>
                        <tr>
                        	<td><%=rs.getString(1) %></td>
                            <td class="name"><%=rs.getString(2) %></td>
                            <td><%=rs.getString(3) %> <br> <%=rs.getString(4) %> </td>
                            <td><%=rs.getString(5) %></td>
                            <td><% if(rs.getString(6).equals("14")){ out.print("12 Months"); } 
	                    			else if(rs.getString(6).equals("22")){ out.print("18 Months"); }
	                    			else if(rs.getString(6).equals("28")){ out.print("24 Months"); }
	                    			else if(rs.getString(6).equals("35")){ out.print("30 Months"); }
	                    			else { out.print(""); }%></td>
                            <td><%=rs.getString(7) %></td>
                            <td><%=rs.getString(8) %></td>
                      		<td><%if("Approved".equals(rs.getString(9))){ %><p class="approved">Approved</p><%}else if("Rejected".equals(rs.getString(9))){ %><p class="rejected">Rejected</p><%}else if("Closed".equals(rs.getString(9))){ %><p style="color: blue;">Closed</p><%} %></td>
                           	<td><%if("Approved".equals(rs.getString(9))){ %><a href="closeLoanAction.jsp?msg=<%=rs.getString(1) %>">Close</a><%} %></td>
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
	    	    	response.sendRedirect("../index.jsp");
	    	    }
	    	    else {		
	        	 name = session.getAttribute("name").toString();        		
	        	}
        	%>	
    </body>
    </html>