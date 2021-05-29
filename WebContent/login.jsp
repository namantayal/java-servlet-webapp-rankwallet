<%@page import="rankwallet.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css?version=13">
</head>
<body>
	<div class="login-status">
		<h3><%
			String phone=request.getParameter("phone").toString();
			String pass=request.getParameter("password").toString();
			if(Customer.auth(phone, pass)){
				out.println("Login Successful!!");
				HttpSession loginSession=request.getSession();
				loginSession.setAttribute("login", true);
				loginSession.setAttribute("phone",phone);
				response.sendRedirect("/RankWallet/welcome.jsp");
			}
			else{
				out.println("Login Failed!!");
			}
		%></h3>
		<button onclick="window.location.href='index.jsp'">Try Again</button>
	</div>
</body>
</html>