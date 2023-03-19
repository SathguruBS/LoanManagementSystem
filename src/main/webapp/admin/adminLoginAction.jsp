<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	
	int z=0;
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from admin where name ='"+name+"' and password ='"+password+"'");
		while(rs.next()){
			z=1;
			session.setAttribute("name", name);
			response.sendRedirect("adminHome.jsp");
		}
		if(z==0) {
			response.sendRedirect("adminLogin.jsp?msg=notexist");
		}
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("adminLogin.jsp?msg=invalid");
	}
%>