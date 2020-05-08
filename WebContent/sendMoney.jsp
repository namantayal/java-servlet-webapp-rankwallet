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
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css?version=14">
</head>
<body>
	<nav class="nav-bar">
		<h2 class="title">Rank Wallet</h2>
		<form action="logout.jsp" method="post" class="logout-form">
			<input class="logout-button" type="submit" value="Logout">
		</form>
	</nav>
	<h3 class="func-title">Send Money</h3>
	<form action="sendMoneyAction.jsp" method="post">
		<input type="number" min=0 name="sendphone" placeholder="Send Money to" pattern="[0-9]{10}" class="amount">
		<input type="number" min=0 name="amount" placeholder="Amount" class="amount">
		<input type="submit" value="Send Money" class="addButton">
	</form>
</body>
</html>