<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/showReuqest.css">
    <title>View Loan</title>
</head>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	%>
    <header>
        <img src="image/lmsLogo.png" alt="logo" class="logoImg" height=110px>
    </header>
    <nav class="navbar">
        <a href="customerHome.jsp" id="home">Home</a>
        <a href="personalDetails.jsp">Personal Details</a>
        <a href="noData.jsp">Request Loan</a>
        <a href="viewStatus.jsp" id="viewLoan">View Loan</a>
        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
    
    <%
	    String email = null;
	    
	    if(session.getAttribute("email") == null) {
	    response.sendRedirect("index.jsp");
	    }
	    else {
			email = session.getAttribute("email").toString();        		
	    }
    %>
   <!------------------------------------------ Personal Details Grid ------------------------------------------->
   <section>
   <%
   		String msg = request.getParameter("msg");
   		if("done".equals(msg)){
   %>
   		<h3 align="center">Delete request successfully !</h3>
   <%} %>
   <%
   		if("wrong".equals(msg)){
   %>
   		<h3 align="center">Something went wrong !</h3>
   <%} %>
   
   		<h2>Personal Details</h2>
				<table class="request-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{
                    	
                    	Connection con = ConnectionProvider.getCon();
                    	Statement st = con.createStatement();
                    	ResultSet rs = st.executeQuery("select * from customer where email = '"+email+"'");
                    	while(rs. next()){
                    %>
                    
                    <tr>
                    	<td class="name"><%=rs.getString(1) %></td>
                    	<td><% if(rs.getString(2)==null){ out.print(""); } else{ out.print(rs.getString(2)); } %></td>
                    	<td><% if(rs.getString(3)==null){ out.print(""); } else{ out.print(rs.getString(3)); } %></td>
                    	<td><%=rs.getString(4) %></td>
                    	<td><%=rs.getString(5) %></td>
                    	<td><% if(rs.getString(7)==null){ out.print(""); } else{ out.print(rs.getString(7)); } %>
                    	<br><% if(rs.getString(8)==null){ out.print(""); } else{ out.print(rs.getString(8)); } %>
                    	<br><% if(rs.getString(9)==null){ out.print(""); } else{ out.print(rs.getString(9)); } %></td>
                    	<td><a href="personalDetails.jsp" style="color: green;">Edit</a></td>
                    </tr>
                    </tbody>
                    
                    <%}
                    	}
                    	catch(Exception e){
                    		System.out.print(e);
                    	}
                    	%>
               	</table>
               	
   <!------------------------------------------ Loan Details Grid ------------------------------------------->               	
               	
               	<h2>Loan Details</h2>
               	<table class="request-table">
               		<thead>
                        <tr>
                        	<th>Loan ID</th>
                            <th>Vehicle cost</th>
                            <th>Initial payment</th>
                            <th>Loan amount</th>
                            <th>EMI plan</th>
                            <th>EMI per month</th>
                            <th>Account number</th>
                            <th>AC balance</th>
                            <th>Status</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{
                    	
                    	Connection con = ConnectionProvider.getCon();
                    	Statement st = con.createStatement();
                    	ResultSet rs = st.executeQuery("select * from loandetails where email = '"+email+"'");
                    	while(rs. next()){
                    %>
                    
	                    <tr>
	                    	<td><% if(rs.getString(1)==null){ out.print(""); } else{ out.print(rs.getString(1)); } %></td>
	                    	<td><% if(rs.getString(2)==null){ out.print(""); } else{ out.print(rs.getString(2)); } %></td>
	                    	<td><% if(rs.getString(3)==null){ out.print(""); } else{ out.print(rs.getString(3)); } %></td>
	                    	<td><% if(rs.getString(4)==null){ out.print(""); } else{ out.print(rs.getString(4)); } %></td>
	                    	
	                    	<td><% if(rs.getString(5).equals("14")){ out.print("12 Months"); } 
	                    			else if(rs.getString(5).equals("22")){ out.print("18 Months"); }
	                    			else if(rs.getString(5).equals("28")){ out.print("24 Months"); }
	                    			else if(rs.getString(5).equals("35")){ out.print("30 Months"); }
	                    			else { out.print(""); }%></td>
	                    			
	                    	<td><% if(rs.getString(6)==null){ out.print(""); } else{ out.print(rs.getString(6)); } %></td>
	                    	<td><% if(rs.getString(7)==null){ out.print(""); } else{ out.print(rs.getString(7)); } %></td>
	                    	<td><% if(rs.getString(8)==null){ out.print(""); } else{ out.print(rs.getString(8)); } %></td>
	                    	
	                    	<td><%if(rs.getString(10)==null){ out.print(""); }
	                    	else if("Approved".equals(rs.getString(10))){ %><p class="approved">Approved</p><%}
	                    	else if("Rejected".equals(rs.getString(10))){ %><p style="color: #d00000;">Rejected</p><%}
	                    	else if("Closed".equals(rs.getString(10))){ %><p style="color: #01497c;">Closed</p><%} 
	                    	else if("Pending".equals(rs.getString(10))){ %><p style="color: black;">Pending</p><%} %></td>
	                    	
	                    	<td><a href="deleteRequest.jsp?msg=<%=rs.getString(1)%>"><%if("Pending".equals(rs.getString(10))){ %> Delete <%} %></a></td>
	                    </tr>
                    	
                    </tbody>
                    <%}
                    	}
                    	catch(Exception e){
                    		System.out.print(e);
                    	}
                    	%>
               	</table>
   </section>
</body>
</html>