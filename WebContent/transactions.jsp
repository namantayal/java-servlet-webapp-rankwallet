<%@page import="java.sql.ResultSet"%>
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
	<title>Transactions</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/style.css?version=15">
</head>
<body>
	<nav class="nav-bar">
		<h2 class="title">Rank Wallet</h2>
		<form action="logout.jsp" method="post" class="logout-form">
			<input class="logout-button" type="submit" value="Logout">
		</form>
	</nav>
</body>
<h3 class="func-title">Transactions</h3>
<div>
	<table>
		<tr>
			<th>S.No.</th>
			<th>Mode</th>
			<th>Amount</th>
		</tr>
		<%
			ResultSet rs= Customer.transaction(phone);
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>");
				out.println(rs.getString("Id"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("Mode"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("Amount"));
				out.println("</td>");
				out.println("</tr>");
			}
			
		%>
	</table>
</div>
</html>