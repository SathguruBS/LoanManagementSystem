<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	int z=0;
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from customer where email ='"+email+"' and password ='"+password+"'");
		while(rs.next()){
			z=1;
			session.setAttribute("email", email);
			response.sendRedirect("customerHome.jsp");
		}
		if(z==0) {
			response.sendRedirect("userLogin.jsp?msg2=notexist");
		}
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("userLogin.jsp?msg2=invalid");
	}	

%>