<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/adminHome.css">
    <title>Admin Home</title>
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
        <img src="../image/lmsLogo.png" alt="logo" class="logoImg" height=110px>
    </header>
    <nav class="navbar">
        <a href="adminHome.jsp" id="home">Home</a>
        <a href="requestedLoan.jsp">Requested Loan</a>
        <a href="loans.jsp">Loans</a>

        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->
		
		<h1 class="content"> Welcome Admin !</h1>
		<% 
		String name = null;
    
	    if(session.getAttribute("name") == null) {
	    	response.sendRedirect("../index.jsp");
	    }
	    else {		
    	 name = session.getAttribute("name").toString();        		
    	}
    	%>	
</body>
</html>