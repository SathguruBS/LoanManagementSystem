<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/requestLoan.css">
    <title>Request Loan</title>
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
        <a href="personalDetails.jsp">Personal Details</a>
		<a href="noData.jsp" class="requestLoan">Request Loan</a>
        <a href="viewLoan.jsp">View Loan</a>
        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------ Header Section end ------------------------------------------->
<section>
	<%
	String msg = request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<h4>Request send successfully !</h4>
	<%} %>
	
	<%
	if("wrong".equals(msg)){
	%>
	<h4>Something went wrong !  Try again !</h4>
	<%} %>
	
	<!------------------------------------------------------- Loan Details ------------------------------------------------------->
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
			ResultSet rs = st.executeQuery("select * from loandetails where email='"+email+"' and status='Pending'");
			
			if(rs.next()==false){
					rs.close();
				 rs = st.executeQuery("select * from loandetails where email='duplicate@gmail.com'");				 
			}
			else  {
				rs.close();
				rs = st.executeQuery("select * from loandetails where email='"+email+"' and status='Pending'");
				out.print("<h3>Loan request is pending... Wait for response !</h3>");
			}
		while(rs.next()) {
		%>
		
		
		
		<form action="requestLoanAction.jsp" method="post">
    <div class="loanDetailContainer">
        <table>
            <tr>
                <td colspan="2"><h1>Loan Details</h1></td>
            </tr>
            <tr>
                <td><label for="vehicleCost">Vehicle Cost </label></td>
                <td><input type="tel" name="vehicleCost" id="Text1" maxlength="6" oninput="sub_number()" <% if(rs.getString(2) != null) { %> value="<%=rs.getString(2) %>"<% } else { %> placeholder="Ener VC in Rs." <%} %> required></td>
            </tr>
            <tr>
                <td><label for="initialAmount">Initial Payment </label></td>
                <td><input type="tel" name="initialAmount" id="Text2" maxlength="6" oninput="sub_number()" <% if(rs.getString(3) != null) { %> value="<%=rs.getString(3) %>"<% } else { %> placeholder="Ener IP in Rs." <%} %> required></td>
            </tr>
            <script type="text/javascript">
		        var text1 = document.getElementById("Text1");
		        var text2 = document.getElementById("Text2");
		
		
		        function sub_number() {
		            var first_number = parseFloat(text1.value);
		            if (isNaN(first_number)) first_number = 0;
		            var second_number = parseFloat(text2.value);
		            if (isNaN(second_number)) second_number = 0;
		            var result = first_number - second_number;
		            document.getElementById("txtresult").value = result;
        		}
    		</script>
            <tr>
                <td><label for="loanAmount">Loan Amount </label></td>
                <td><input type="text" id="txtresult" name="loanAmount" <% if(rs.getString(4) != null) { %> value="<%=rs.getString(4) %>"<% } %> readonly></td>
            </tr>
            <tr>
                <td><label for="emiPlan">Choose EMI Plan </label></td>
                <td><select name="emiPlan" id="roi" required oninput="Emi()" required>		<option value="">--Select Plan--</option>
                    <option value="14"<% if(rs.getInt(5) == 14) { %> Selected <% } %>>12 Months</option>
                    <option value="22"<% if(rs.getInt(5) == 22) { %> Selected <% } %>>18 Months</option>
                    <option value="28"<% if(rs.getInt(5) == 28) { %> Selected <% } %>>24 Months</option>
                    <option value="35"<% if(rs.getInt(5) == 35) { %> Selected <% } %>>30 Months</option>
                </select></td>
            </tr>
            <tr>
                <td><label for="">EMI Amount per month </label></td>
                <td><input type="text" id="emiresult" name="emiPerMonth" <% if(rs.getString(6) != null) { %> value="<%=rs.getString(6) %>"<% } %> readonly></td>
            </tr>
            <script type="text/javascript">
            var loan_amt = document.getElementById("txtresult");
            var roi_amt = document.getElementById("roi");
            function Emi() {
                var loan_num = parseFloat(loan_amt.value);
                if (isNaN(loan_num)) loan_num = 0;
                var roi_num = parseFloat(roi_amt.value);
                if (isNaN(roi_num)) roi_num = 0;
                
                var emi_amt = (loan_num * roi_num)/100;
                var emi  = 0;
                switch (parseInt(roi_amt.value)) {
                    case 14:
                        emi = (emi_amt + loan_num) / 12; break;
                     case 22:
                        emi = (emi_amt + loan_num) / 18; break;
                    case 28:
                        emi = (emi_amt + loan_num) / 24; break;
                    case 35:
                        emi = (emi_amt + loan_num) / 30; break;
                   
                    default:
                        break;
                }
               
                document.getElementById("emiresult").value = Math.round(emi);
            }
            </script>
            
            
            <tr><td colspan="2"><h3>Account Details for Proof</h3></td></tr>
            <tr>
                <td><label for="accountNumber">Account number </label></td>
                <td><input type="tel" name="accountNumber" maxlength="12" <% if(rs.getString(7) != null) { %> value="<%=rs.getString(7) %>"<% } else { %> placeholder="Enter your Bank AC number" <%} %> required></td>
            </tr>
            <tr>
                <td><label for="accountBalance">Account balance </label></td>
                <td><input type="tel" name="accountBalance" maxlength="6" <% if(rs.getString(8) != null) { %> value="<%=rs.getString(8) %>"<% } else { %> placeholder="Minimum of 50,000" <%} %> required> </td>
            </tr>
            
            <tr>
        </table>
    </div>
    
        <button <% if(rs.getString(10) != null) {if(rs.getString(10).equals("Pending")) {%>disabled<% }  }%>>Send Request</button>
    </form>
		
		
		
	<% }
		}
		catch(Exception e){
			System.out.print(e);
		}
    %>
    
    
</section>   
</body>
</html>