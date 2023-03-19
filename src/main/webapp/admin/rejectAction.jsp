<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>

<%
	String id = request.getParameter("msg");
	
	SimpleDateFormat myDate = new SimpleDateFormat("yyyy-MM-dd");
	String Date = myDate.format(new Date());
	
	try{
		Connection con = ConnectionProvider.getCon();
    	Statement st = con.createStatement();
    	st.executeUpdate("update loandetails SET status = 'Rejected', date = '"+Date+"' WHERE id = '"+id+"'");
    	response.sendRedirect("requestedLoan.jsp?msg2=done");
	}
	catch(Exception e){
		response.sendRedirect("requestedLoan.jsp?msg2=wrong");
		System.out.print(e);
	}
%>