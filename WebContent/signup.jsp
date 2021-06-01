<%@page import="rankwallet.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>SignUp</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css">
</head>
<body>
	<div class="signup-status">
		<h3><%
			String name=request.getParameter("name").toString();
			String lname=request.getParameter("lname").toString();
			String phone=request.getParameter("phone").toString();
			String dob=request.getParameter("dob").toString();
			String pass=request.getParameter("password").toString();
			if(Customer.register(name,lname, phone, dob, pass)){
				out.println("Registaration Successful!!");
			}
			else{
				out.println("User Already Exists!!");
			}
		%></h3>
		<button onclick="window.location.href='index.jsp'">Login</button>
	</div>
</body>
</html>