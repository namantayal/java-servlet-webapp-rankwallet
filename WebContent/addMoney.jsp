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
	<title>Add Money</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/addmoney.css?version=40">
	
	<style>
body {
  background-image: url('https://subscribe-renew.com/image/catalog/Blogs/Save%20Money%20Resolutions.jpg');
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
		<button class="button" onclick="window.location.href='addMoney.jsp'">Add Money</button>
		<button class="text" onclick="window.location.href='sendMoney.jsp'">Send Money</button>
		<button class="text" onclick="window.location.href='transactions.jsp'">Statement</button>
		<button class="text" onclick="window.location.href='delete.jsp'">Delete</button>
		</div>
		<form action="logout.jsp" method="post" class="logOut" >
			<input class="logbut" type="submit" value="Logout">
		</form>
	
</div>

<div class="container">

<div class="formContainer">
	<p class="addMoney">Add Money</p>
	<div class="line"></div>
	<form action="addMoneyAction.jsp" method="post" class = "form">
	<p class="headText">Amount To Be Added</p>
		<input type="number" min=0 name="amount" placeholder="Enter Amount" class = "inputBox">
	<div class="lines"></div>
		<input type="submit" value="Add Money" class="addButton">
	</form>
	</div>
</div>
	
	
	
</body>
</html>