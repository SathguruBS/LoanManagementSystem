<%@page import = "project.ConnectionProvider"%>
<%@page import = "java.sql.*"%>

<%
	try{
		response.sendRedirect("requestedLoan.jsp");
	}
	catch(Exception e){
		out.print(e);
	}
%>