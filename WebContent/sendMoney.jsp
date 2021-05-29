<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%!
	String phone=null;
%>
<%
	HttpSession loginSession=request.getSession();
	if(loginSession.getAttribute("login")==null){
		loginSession.setAttribute("login", false);
		response.sendRedirect("/RankWallet/welcome.jsp");
	}
	else{
		boolean status = (boolean)loginSession.getAttribute("login");
		if(!status){
			response.sendRedirect("/RankWallet/welcome.jsp");
		}
		else{
			phone=loginSession.getAttribute("phone").toString();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Send Money</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/sendmoney.css?version=40">
</head>
<body>
	<div class = "navBar">

		<h2 class="Heading">Rank Wallet</h2>
		<div class="buttonsDiv">
		<button class="text" onclick="window.location.href='addMoney.jsp'">Add Money</button>
		<button class="button" onclick="window.location.href='sendMoney.jsp'">Send Money</button>
		<button class="text" onclick="window.location.href='transactions.jsp'">Statement</button>
		<button class="text" onclick="window.location.href='delete.jsp'">Delete</button>
		</div>
		<form action="logout.jsp" method="post" class="logOut" >
			<input class="logbut" type="submit" value="Logout">
		</form>
	
</div>
<div class="container">
<div class="formContainer">
	<p class="sendMoney">Send Money</p>
	<div class="line"></div>
	<form action="sendMoneyAction.jsp" method="post" class="form">
		<p class="headText">Account Holder Name</p>
		<input type="number" min=0 name="sendphone" placeholder="Send Money to" pattern="[0-9]{10}" class="inputBox">
		
		<p class="headText">Amount To Send</p>
		<input type="number" min=0 name="amount" placeholder="Amount" class="inputBox" >
		<div class="lines"></div>
		<input type="submit" value="Send Money" class="sendButton">
	</form>
	</div>
</div>
</body>
</html>