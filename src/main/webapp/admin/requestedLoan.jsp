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
        <a href="requestedLoan.jsp" id="showRequest">Requested Loans</a>
        <a href="loans.jsp">Loans</a>
        
        <a href="../logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->

			<section>
			<%
			String msg = request.getParameter("msg");
			if("done".equals(msg)){
			%>
			<h3 align="center">Approved Successfully !</h3>
			<%} %>
			
			<%
			if("wrong".equals(msg)){
			%>
			<h3 align="center">Something went wrong !</h3>
			<%} %>
			
			<%
			String msg2 = request.getParameter("msg2");
			if("done".equals(msg2)){
			%>
			<h3 align="center">Rejected Successfully !</h3>
			<%} %>
			
			<%
			if("wrong".equals(msg2)){
			%>
			<h3 align="center">Something went wrong !</h3>
			<%} %>
			
			<h2>Loan Requests</h2>
				<table class="request-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Contact</th>
                            <th>Address</th>
                            <th>Loan Details</th>
                            <th>EMI Details</th>
                            <th>Account Details</th>
                            <th>Status</th>
                            <th>Edit</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                    try{
                    	Connection con = ConnectionProvider.getCon();
                    	Statement st = con.createStatement();
                    	ResultSet rs = st.executeQuery("select loandetails.id, customer.name,  customer.age,  customer.gender, customer.mobileNumber, customer.email, customer.address, customer.city, customer.state, loandetails.vehicleCost, loandetails.initialAmount, loandetails.loanAmount, loandetails.emiPlan, loandetails.emiPerMonth, loandetails.accountNumber, loandetails.accountBalance from loandetails Inner Join customer on customer.email = loandetails.email where loandetails.status='Pending';");
                    	while(rs. next()){
                    %>
                        <tr>
                            <td class="name"><%=rs.getString(2) %></td>
                            <td><%=rs.getString(3) %></td>
                            <td><%=rs.getString(4) %></td>
                            <td><%=rs.getString(5) %><br> <%=rs.getString(6) %></td>
                            <td><%=rs.getString(7) %> <br> <%=rs.getString(8) %> <br> <%=rs.getString(9) %></td>
                            <td>VC: <%=rs.getString(10) %> <br> IP: <%=rs.getString(11) %> <br> LA : <%=rs.getString(12) %></td>
                            <td>EMI Plan : <% if(rs.getString(13).equals("14")){ out.print("12 Months"); } 
				                    			else if(rs.getString(13).equals("22")){ out.print("18 Months"); }
				                    			else if(rs.getString(13).equals("28")){ out.print("24 Months"); }
				                    			else if(rs.getString(13).equals("35")){ out.print("30 Months"); }
				                    			else { out.print(""); }%> <br>
				                EMI per month: <%=rs.getString(14) %></td>
                            <td>AC No: <%=rs.getString(15) %> <br> Balance: <%=rs.getString(16) %></td>
                            
                            <td class="button"><a href="approveAction.jsp?msg=<%=rs.getString(1)%>"><button type="submit" class="approve">Approve</button></a> <br> 
                            				   <a href="rejectAction.jsp?msg=<%=rs.getString(1)%>"><button type="submit" class="reject">Reject</button></a></td>
                            
                            <td><a href="editDetails.jsp?msg=<%=rs.getString(1)%>">Edit</a></td>
                            
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
	    	}%>	
</body>
</html>