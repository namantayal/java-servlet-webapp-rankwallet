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
	<link rel="stylesheet" type="text/css" href="/RankWallet/welcome.css?version=80">
</head>
<body>
<div class = "navBar">

		<h2 class="Heading">Rank Wallet</h2>
		<div class="buttonsDiv">
		<button class="button" onclick="window.location.href='addMoney.jsp'">Add Money</button>
		<button class="button" onclick="window.location.href='sendMoney.jsp'">Send Money</button>
		<button class="button" onclick="window.location.href='transactions.jsp'">Statement</button>
		<button class="button" onclick="window.location.href='delete.jsp'">Delete</button>
		</div>
		<form action="logout.jsp" method="post" class="logOut" >
			<input class="logbut" type="submit" value="Logout">
		</form>
	

</div>
<%-- <div class = "two">
	<div class="">
		<p> Hi, <%out.println(Customer.getInfo(phone,"Name"));%></p>
		<div class="bal-display">
			<p class="">Current Balance</p>
			<p class=""><%out.println(Customer.getInfo(phone,"Bal"));%></p>
		</div>
	</div>	
	
		
	
	</div> --%>
</body>
</html>