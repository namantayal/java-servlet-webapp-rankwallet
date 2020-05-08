<%@page import="rankwallet.Customer"%>
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
	<title>Rank Wallet</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css?version=11">
</head>
<body>
	<nav class="nav-bar">
		<h2 class="title">Rank Wallet</h2>
		<form action="logout.jsp" method="post" class="logout-form">
			<input class="logout-button" type="submit" value="Logout">
		</form>
	</nav>
	<div class="info">
		<p> Hi, <%out.println(Customer.getInfo(phone,"Name"));%></p>
		<div class="bal-display">
			<p class="bal-head">Current Balance</p>
			<p class="bal-value"><%out.println(Customer.getInfo(phone,"Bal"));%></p>
		</div>
	</div>	
	<div class="menu">
		<button onclick="window.location.href='addMoney.jsp'">Add Money</button>
		<button onclick="window.location.href='sendMoney.jsp'">Send Money</button>
		<button onclick="window.location.href='transactions.jsp'">Statement</button>
		<button onclick="window.location.href='delete.jsp'">Delete</button>
	</div>
</body>
</html>