<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();	

	String vehicleCost = request.getParameter("vehicleCost");
	String initialAmount = request.getParameter("initialAmount");
	int loanAmount = Integer.parseInt(request.getParameter("loanAmount"));
	String emiPlan = request.getParameter("emiPlan");
	String emiPerMonth = request.getParameter("emiPerMonth");
	String accountNumber = request.getParameter("accountNumber");
	String accountBalance = request.getParameter("accountBalance");
	
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
	
		PreparedStatement ps = con.prepareStatement("INSERT INTO `lmsjsp`.`loandetails` (`vehicleCost`, `initialAmount`, `loanAmount`, `emiPlan`, `emiPerMonth`, `accountNumber`, `accountBalance`, `status`, `email`) VALUES (?,?,?,?,?,?,?,?,?)");
		ps.setString(1, vehicleCost);
		ps.setString(2, initialAmount);
		ps.setInt(3, loanAmount);
		ps.setString(4, emiPlan);
		ps.setString(5, emiPerMonth);
		ps.setString(6, accountNumber);
		ps.setString(7, accountBalance);
		ps.setString(8, "Pending");
		ps.setString(9, email);
		
		ps.executeUpdate();
		response.sendRedirect("requestLoan.jsp?msg=done");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("requestLoan.jsp?msg=wrong");
	}
%>