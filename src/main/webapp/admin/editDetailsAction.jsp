<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String id = request.getParameter("id");	

	String vehicleCost = request.getParameter("vehicleCost");
	String initialAmount = request.getParameter("initialAmount");
	int loanAmount = Integer.parseInt(request.getParameter("loanAmount"));
	String emiPlan = request.getParameter("emiPlan");
	String emiPerMonth = request.getParameter("emiPerMonth");
	String accountNumber = request.getParameter("accountNumber");
	String accountBalance = request.getParameter("accountBalance");
	
	try{
		System.out.println(loanAmount);
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();


	st.executeUpdate("update loandetails set vehicleCost='"+vehicleCost+"', initialAmount='"+initialAmount+"', loanAmount='"+loanAmount+"', emiPlan='"+emiPlan+"', emiPerMonth='"+emiPerMonth+"', accountNumber='"+accountNumber+"', accountBalance='"+accountBalance+"' where id='"+id+"'");

	response.sendRedirect("editDetails.jsp?msg=done");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("editDetails.jsp?msg=wrong");
	}
%>