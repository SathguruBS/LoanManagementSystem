<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/adminLogin.css">
    <title>Admin-Login</title>
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form action="adminLoginAction.jsp" method="post">
            
      <!------------------- Error message ------------------------------>
           		<%
           		String msg = request.getParameter("msg");
           		if("notexist".equals(msg)){
           		%>
           		<h4 style="margin-bottom:50px; color: #fff95b;">Incorrect username or password !</h4>
           		<%} %>
           		<%
           		if("invalid".equals(msg)){
           		%>
           		<h4 style="margin-bottom:50px; color: #fff95b;">Something went wrong !</h4>
           		<%} %>
           		
                
                <h1>Admin Login</h1>
                <input type="text" name="name" placeholder="Username" autofocus="on" required>
                <input type="password" name="password" placeholder="Password" required>
                <button>Sign In</button>
            </form>
        </div>
    </div>
</body>
</html>