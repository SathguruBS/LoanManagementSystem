<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
	try{
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String mobileNumber = request.getParameter("mobileNumber");
	String email = request.getParameter("email");
	String address = request.getParameter("address");														
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	String status = "Created";
	
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update customer set name='"+name+"',age='"+age+"',gender='"+gender+"',mobileNumber='"+mobileNumber+"',address='"+address+"',city='"+city+"',state='"+state+"',country='"+country+"', status='"+status+"' where email='"+email+"'");
 	
	response.sendRedirect("personalDetails.jsp?msg=done"); 
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("personalDetails.jsp?msg=wrong");
	}
%>