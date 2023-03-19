<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/customerHome.css">
    <title>Customer Home</title>
</head>
<style>
	h1{
		text-align: center;
		margin-top: 12%;
		font-size: 80px;
		color: red;
	}
	#home{
		border: 2px solid white;
        padding: 7px 12px;
		border-radius: 30px;
	}
</style>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	%>
    <header>
        <img src="image/lmsLogo.png" alt="logo" class="logoImg" height=110px>
    </header>
    <nav class="navbar">
        <a href="customerHome.jsp" id="home">Home</a>
        <a href="personalDetails.jsp">Personal Details</a>
        <a href="noData.jsp">Request Loan</a>
        <a href="viewLoan.jsp">View Loan</a>
        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->
    <%
    
	    String email = null;
	    
	    if(session.getAttribute("email") == null) {
	    response.sendRedirect("index.jsp");
	    }
	    else {
			email = session.getAttribute("email").toString();        		
	    }
    
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select name from customer where email = '"+email+"'");
		while(rs.next()){ %>
		
		
		<h1 class="content"> Welcome <%=rs.getString(1) %>!</h1>
			
	<% }%>	
    
    
    	
</body>
</html>