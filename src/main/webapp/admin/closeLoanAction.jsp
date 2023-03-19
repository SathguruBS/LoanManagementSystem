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
		st.executeUpdate("update loandetails set status='Closed', date = '"+Date+"' where id='"+id+"'");
		response.sendRedirect("loans.jsp?msg=done");
	}
	catch(Exception e){
		response.sendRedirect("loans.jsp?msg=wrong");
		System.out.print(e);
	}
%>