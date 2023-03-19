<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/userLogin.css">
    <title>User-Login</title>
</head>
<body>
			
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	%>
	<!---------------------- SignUp Container ---------------------->
	
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="userSignUpAction.jsp" method="post">         
                <h1>Create Account</h1>
	                <input type="text" placeholder="Name" name="name" required>
	                <input type="email" placeholder="Email" name="email" required pattern="^[a-zA-Z0-9.!#$%&'*+/=?_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$">
	                <input type="text" placeholder="Mobile Number" name="mobileNumber" maxlength="10" required pattern="[0-9]{10}">
	                <input type="password" placeholder="Password" name="password" maxlength="8" required>
	            <button>Register</button>
            </form>
        </div>
        
        <!---------------------- SignIn Container ---------------------->
        
        <div class="form-container sign-in-container">
            <form action="userLoginAction.jsp" method="post">
            
            <!------------------------- Error message - Login --------------------------->
				<%
				String msg2 = request.getParameter("msg2");
				if("notexist".equals(msg2)){
				%>
					<h4 style="margin-bottom:50px; color: red;">Incorrect Username or Password !</h4>	
				<%} %>
				
				<%if("invalid".equals(msg2)){ %>
					<h4 style="margin-bottom:50px; color: red;">Something went wrong ! Try again !</h4>
				<%} %>
                <h1>Sign In</h1>
                <input type="email" name="email" placeholder="Email" required autofocus="autofocus">
                <input type="password" name="password" maxlength="8" placeholder="Password" required>
                <button>Login</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>If already you are a customer</h1>
                    <p>Sign In here to go to your exiting account !</p>
                    <button class="press" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                
                 <!----------------------- Error message - Register -------------------------->            
                <%
	            String msg = request.getParameter("msg");
	            if("valid".equals(msg)){
	            %>
                	<h3 style="margin-bottom:50px; color: yellow;">Registered Successfully !</h3>
                <%} %>
                
            	<%if("invalid".equals(msg)){ %>
                	<h3 style="margin-bottom:50px; color: yellow;">User already exist !</h3>
                <%} %>
                
                    <h1>New customer</h1>
                    <p>Sign Up here to create a new account !</p>
                    <button class="press" id="signUp">Create account</button>
                </div>
            </div>
        </div>
    </div>
 
    <script>
        const signUpButton = document.getElementById("signUp");
        const signInButton = document.getElementById("signIn");
        const container = document.getElementById("container");

        signUpButton.addEventListener('click',()=>{
            container.classList.add("right-panel-active");
        })
        
        signInButton.addEventListener('click',()=>{
            container.classList.remove("right-panel-active");
        })
    </script>

</body>
</html>