<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/requestLoan.css">
    <title>Show Request</title>
</head>
<style>
	h1{
		text-align: center;
		margin-top: 12%;
		font-size: 80px;
		color: red;
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
        <a href="adminHome.jsp">Home</a>
        <a href="requestedLoan.jsp">Requested Loans</a>
        <a href="loans.jsp">Loans</a>
        
        <a href="../logout.jsp" id="logout">Logout</a>
    </nav>
<!------------------------------------------------------- Header Section end ------------------------------------------------------->
			<%
		String msg = request.getParameter("msg");
		if("done".equals(msg)){
		%>
		<h4>Updated Successfully !</h4>
		<%} %>
		
		<%
		if("wrong".equals(msg)){
		%>
		<h4>Something went wrong !  Try again !</h4>
		<%} %>
	
	
    	<% 
		
    String id = request.getParameter("msg");
    
		try{
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from loanDetails where id = '"+id+"'");
			while(rs.next()){
	%>	
    	<section>
    	<a href ="backAction.jsp" style="margin:20px 20px; text-decoration: none; color: blue;" >Back</a>
		    
		         <form action="editDetailsAction.jsp" method="post">
    <div class="loanDetailContainer">
        <table>
        <tr>
        	<td colspan="2"><h2 class="rejected">EDIT LOAN DETAILS</h2></td>
        </tr>
        <tr>
        	<td><input type="hidden" name="id" value="<%out.print(id);%>"></td>
        </tr>
            <tr>
                <td><label for="vehicleCost">Vehicle Cost </label></td>
                <td><input type="tel" name="vehicleCost" id="Text1" maxlength="6" oninput="sub_number()" <% if(rs.getString(2) != null) { %> value="<%=rs.getString(2) %>"<% } else { %> placeholder="Ener VC in Rs." <%} %> required readonly></td>
                
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
                <td><input type="text" name="emiPlan" value="<%=rs.getString(5) %>" readonly></td>
            </tr>
            <tr>
                <td><label for="">EMI Amount per month </label></td>
                <td><input type="text" id="emiresult" name="emiPerMonth" <% if(rs.getString(6) != null) { %> value="<%=rs.getString(6) %>"<% } %>></td>
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
                <td><input type="tel" name="accountNumber" maxlength="12" <% if(rs.getString(7) != null) { %> value="<%=rs.getString(7) %>"<% } else { %> placeholder="Enter your Bank AC number" <%} %> required readonly></td>
            </tr>
            <tr>
                <td><label for="accountBalance">Account balance </label></td>
                <td><input type="tel" name="accountBalance" maxlength="6" <% if(rs.getString(8) != null) { %> value="<%=rs.getString(8) %>"<% } else { %> placeholder="Minimum of 50,000" <%} %> required readonly> </td>
            </tr>
            <tr class="clear"><td colspan="2"><input type="reset" name="clear" value="Clear"></td></tr>
            <tr>
        </table>
        		
    </div>
  			<button type="submit">Update details</button>
    </form>
		  </section>	
    		<%}
			}
			catch(Exception e){
				System.out.print(e);
			}
				%>
    		<% 
				String name = null;
		    
			    if(session.getAttribute("name") == null) {
			    	response.sendRedirect("adminLogin.jsp");
			    }else {
						
		    	 name = session.getAttribute("name").toString();        		
	    	}%>	
    </body>
    </html>