<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/personalDetails.css">
    <title>Personal Detials</title>
</head>
<body>
	<% 
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	%>
    <header>
        <img src="image/lmsLogo.png" alt="logo" class="logoImg" height=110px>
    </header>
    <nav class="navbar">
        <a href="customerHome.jsp" id="home">Home</a>
        <a href="personalDetails.jsp" id="personalDetails">Personal Details</a>
        <a href="noData.jsp">Request Loan</a>
        <a href="viewLoan.jsp">View Loan</a>
        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
    <!------------------------------------------ Header Section end/ Personal Details Start ------------------------------------------->  
    
    <%
		String msg = request.getParameter("msg");
		if("done".equals(msg)){
	%>
		<h4>Updated successfully !</h4>
	<%} %>
	<% 
		if("Nodata".equals(msg)){
	%>
		<h4>Update personal details first !</h4>
	<%} %>
	<%
		if("wrong".equals(msg)){
	%>
		<h4>Something went wrong !  Try again !</h4>
	<%} %>
    <section>
      
        <%
	        String email = null;
	        
	        if(session.getAttribute("email") == null) {
	        response.sendRedirect("index.jsp");
	        }
	        else {
				email = session.getAttribute("email").toString();        		
	        }
        


    try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from customer where email = '"+email+"'");
		while(rs.next()){
	%>
    <form action="personalDetailsAction.jsp" method="post">
    <div class="personalDetailContainer">
            <table>
                <tr>
                    <td colspan="2"><h1>Personal Details</h1></td>
                </tr>
                <tr>
                
                    <td><label for="name">Customer Name </label></td>
                    <td><input type="text" name="name" placeholder="Enter your name" value="<%=rs.getString(1) %>"  required></td>
                </tr>
                <tr>
                    <td><label for="age">Age </label></td>
                    <td><input type="tel" name="age" min="22"  <% if(rs.getString(2) != null) { %> value="<%=rs.getString(2) %>"<% } else { %> placeholder="Age above 22" <%} %> maxlength="2" required pattern="[0-9]{<22}"></td>
                </tr>
                <tr>
                    <td><label for="gender">Gender </label></td>
                    <td><input type="radio" name="gender" value="Male" <%if(rs.getString(3) != null){ if(rs.getString(3).equals("Male")){  out.print("checked='checked'");}}%>>   Male            &nbsp;&nbsp;&nbsp;&nbsp;      
                        <input type="radio" name="gender" value="Female"<%if(rs.getString(3) != null){ if(rs.getString(3).equals("Female")){  out.print("checked='checked'");} }%>>   Female</td>
                </tr>
                <tr>
                    <td><label for="mobileNumber" >Mobile Number </label></td>
                    <td><input type="tel" name="mobileNumber" maxlength="10" <% if(rs.getString(4) != null) { %> value="<%=rs.getString(4) %>"<% } else { %> placeholder="Enter your mobile number" <%} %> required pattern="[0-9]{10}"></td>
                </tr>
                <tr>
                    <td><label for="email">Email ID </label></td>
                    <td><input type="email" name="email" <% if(rs.getString(5) != null) { %> value="<%=rs.getString(5) %>"<% } else { %> placeholder="Enter your email" <%} %> required></td>
                </tr>
                <tr>
                    <td><label for="address">Address </label></td>
                    <td><input type="text" name="address" <% if(rs.getString(7) != null) { %> value="<%=rs.getString(7) %>"<% } else { %> placeholder="Building No, Street, Area" <%} %> required></td>
                </tr>
                <tr>
                    <td><label for="city">City </label></td>
                    <td><input type="text" name="city" <% if(rs.getString(8) != null) { %> value="<%=rs.getString(8) %>"<% } else { %> placeholder="Enter your district" <%} %> required></td>
                </tr>
                <tr>
                    <td><label for="state">State</label></td>
                    <td><input type="text" name="state" <% if(rs.getString(9) != null) { %> value="<%=rs.getString(9) %>"<% } else { %> placeholder="Enter your state" <%} %>  required></td>
                </tr>
                <tr>
                    <td><label for="city">Country </label></td>
                    <td><select name="country" required>
                        <option value="" selected>--Select Country--</option>
                        <option value="india" <% if(rs.getString(10) != null){ if(rs.getString(10).equals("india")) { %> Selected <% }}%>>India</option>
                        <option value="others" <% if(rs.getString(10) != null){ if(rs.getString(10).equals("others")) { %> Selected <% }}%> >Others</option>
                    </select></td>
                </tr>
            </table>	
    </div>
    <button>Update Details</button>
    </form>
    <%}
		}
		catch(Exception e){
			System.out.print(e);
		}
		%>
    </section>
 
</body>
