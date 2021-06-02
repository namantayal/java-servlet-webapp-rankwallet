<%@page import="java.sql.ResultSet"%>
<%@page import="rankwallet.Customer"%>
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
	<title>Transactions</title>
	<link rel="stylesheet" type="text/css" href="/RankWallet/transaction.css?version=90">
	
	<style>
body {
  background-image: url('https://images.unsplash.com/photo-1563013544-824ae1b704d3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGF5bWVudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80');
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
		<button class="button" onclick="window.location.href='transactions.jsp'">Statement</button>
		<button class="text" onclick="window.location.href='profile.jsp'">Profile</button>
		</div>
		<form action="logout.jsp" method="post" class="logOut" >
			<input class="logbut" type="submit" value="Logout">
		</form>
	
</div>
</body>

<h3 class="func-title"><u>Transactions</u></h3>

<div class = "container">
<div class = "formContainer">
	<table>
		<tr>
			<th>S.No.</th>
			<th>Phone</th>
			<th>Transaction ID</th>
			<th>Mode</th>
			<th>Received from/ Sent to</th>
			<th>Amount</th>
			<th>Transaction Time</th>
		</tr>
		
		<%
		ResultSet rs= Customer.transaction(phone);
		int i=0;
			while(rs!=null && rs.next()){
				i++;
				out.println("<tr>");
				out.println("<td>");
				out.println(i);
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("Phone"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("T_ID"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("Mode"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("sendphone"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("Amount"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("time"));
				out.println("</td>");
				out.println("</tr>");
			}
			
			
		%>
	</table>
</div>
</div>

<div class="bottomBar">
<p class="headText">Current Balance:
  <% out.println(Customer.getInfo(phone,"Bal")); %>
</p>
</div>
</html>