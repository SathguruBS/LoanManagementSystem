<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
    *{
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
    }
    header{
        border: 1px solid white;
        position: sticky;
        top: 0;
        padding: 8px;
        display: flex;
        align-items: center;
        background: linear-gradient(45deg, #ff4b3b, #ff416c);
    }
    img{
        margin-left: 35%;
    }
    .navbar{
        background: linear-gradient(45deg, #ff4b3b, #ff416c);
        border: 1px solid white;
        border-top: 0;
        padding: 8px;
        margin-bottom: 5px;
        padding: 10px 15px;
    }
    .navbar a{
        text-decoration: none;
        color: white;
        font-size: 14px;
        font-weight: 530;
        text-transform: uppercase;
        padding: 12px;
    }

</style>
<body>
    <header>
        <img src="F:\Finance Management System\logo1.png" alt="" height="80px">
    </header>
    <nav class="navbar">
        <a href="customerHome.jsp" id="home">Home</a>
        <a href="personalDetails.jsp">Personal Details</a>
        <a href="requestLoan.jsp">Request Loan</a>
        <a href="viewLoan.jsp">View Loan</a>
        <a href="logout.jsp" id="logout">Logout</a>
    </nav>
</body>
</html>