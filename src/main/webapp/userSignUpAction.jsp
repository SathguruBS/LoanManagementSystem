<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
	String name = request.getParameter("name");
	String age = null;
	String gender = null;
	String mobileNumber = request.getParameter("mobileNumber");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String address = null;
	String city = null;
	String state = null;
	String country = null;
	String status = "Nodata";
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, gender);
		ps.setString(4, mobileNumber);
		ps.setString(5, email);
		ps.setString(6, password);
		ps.setString(7, address);
		ps.setString(8, city);
		ps.setString(9, state);
		ps.setString(10, country);
		ps.setString(11, status);
		
		ps.executeUpdate();
		
		response.sendRedirect("userLogin.jsp?msg=valid");
	}
	catch(Exception e) {
		System.out.print(e);
		response.sendRedirect("userLogin.jsp?msg=invalid");
	}
%>