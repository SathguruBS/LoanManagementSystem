<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
	String id = request.getParameter("msg");

	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("DELETE FROM loandetails WHERE id='"+id+"'");
		response.sendRedirect("viewLoan.jsp?msg=done");
	}
	catch(Exception e){
		response.sendRedirect("viewLoan.jsp?msg=wrong");
		System.out.print(e);
	}
%>