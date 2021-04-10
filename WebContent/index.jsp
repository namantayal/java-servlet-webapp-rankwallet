<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
		HttpSession loginSession=request.getSession();
		if(loginSession.getAttribute("login")==null){
			loginSession.setAttribute("login", false);				
		}
		else{
			boolean status = (boolean)loginSession.getAttribute("login");
			if(status){
				response.sendRedirect("/RankWallet/welcome.jsp");
			}
		}
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Rank Wallet</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css?version=40">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
</head>

<body>

	<div class="first">
	<nav class="nav-bar">
		<h2 class="title">Rank Wallet</h2>
	</nav>
	
	<div class="image">
		<img src='https://image.freepik.com/free-vector/illustration-digital-wallet_146120-148.jpg' />
	</div>
	</div>
	<div class="second">
	
	
		<form class="login" action="login.jsp" method="post" class="login-form">
		
		   
			<input class="login-input" required type="text" name="phone" placeholder="Phone No" pattern="[0-9]{10}">
		
			
		
			
			<input class="login-input" required type="password" name="password" placeholder="Password"> 
			<input class="login-button" type="submit" value="Login">
		</form> 
	
	
	<div class="box">
 
	<div class="buttonBox">
	<p class ="button">Sign Up</p>

	</div>


	
		
	<div class="signup-form">
		<form action="signup.jsp" method="post">
			<input class="signup-input" required type="text" name="name" placeholder="Name">
			<input class="signup-input" required type="text" name="phone" placeholder="Phone No." pattern="[0-9]{10}">
			<input class="signup-input" required type="date" name="dob" placeholder="Date Of Birth">
			<input class="signup-input" required type="password" name="password" placeholder="Password">
			<input class="signup-button" type="submit" value="Sign Up">
		</form>
	</div>
	
	</div>
	
	</div>
	
</body>
</html>