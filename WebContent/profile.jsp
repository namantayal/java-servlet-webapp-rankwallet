<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="rankwallet.Customer"%>
    
<%!
	String phone=null;
%>
<%
	HttpSession loginSession=request.getSession();
	if(loginSession.getAttribute("login")==null){
		loginSession.setAttribute("login", false);
		response.sendRedirect("/RankWallet/index.jsp");
	}
	else{
		boolean status = (boolean)loginSession.getAttribute("login");
		if(!status){
			response.sendRedirect("/RankWallet/index.jsp");
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
	<title>Profile</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/profile.css?version=65">
	
	<style>
body {
  background-image: url('https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
</head>
<body>
	<div class = "navBar">

		<h2 class="Heading">Rank Wallet</h2>
		<div class="buttonsDiv">
		<button class="text" onclick="window.location.href='addMoney.jsp'">Add Money</button>
		<button class="text" onclick="window.location.href='sendMoney.jsp'">Send Money</button>
		<button class="text" onclick="window.location.href='transactions.jsp'">Statement</button>
		<button class="button" onclick="window.location.href='profile.jsp'">Profile</button>
		</div>
		<form action="logout.jsp" method="post" class="logOut" >
			<input class="logbut" type="submit" value="Logout">
		</form>
	
</div>
<div class="container">
<div class="formContainer">
	<p class="sendMoney">User Profile</p>
	<div class="line"></div>
	<form action="sendMoneyAction.jsp" method="post" class="form">
	<div class="detailBox">
		<p class="headText"> User Name: </p>
		<p class="headText">	<%out.println(Customer.getInfo(phone,"Name") + " " + Customer.getInfo(phone,"LName")); %>
		</p>
	</div>
		
		<div class="detailBox">
		<p class="headText"> Balance: </p>
		<p class="headText">	<%out.println(Customer.getInfo(phone,"Bal")); %>
		</p>
	</div>
	
	<div class="detailBox">
		<p class="headText"> Date Of Birth: </p>
		<p class="headText">	<%out.println(Customer.getInfo(phone,"DOB")); %>
		</p>
	</div>
		
		<div class="lines"></div>
		<input  value="Delete Account" class="sendButton" onclick="window.location.href='delete.jsp'">
	</form>
	</div>
</div>

</body>
</html>