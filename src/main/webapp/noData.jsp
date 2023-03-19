<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<% 
	String email = session.getAttribute("email").toString(); 

try{
	
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select status from Customer where email='"+email+"'");
	
	while(rs.next()){ 
		
			if(rs.getString(1).equals("Nodata"))
			{
		
				response.sendRedirect("personalDetails.jsp?msg=Nodata");
			
			}else{
					
					response.sendRedirect("requestLoan.jsp");
				}
	}
	}
	catch(Exception e){
		
		System.out.print(e);
		}
					
					
			

	


%>