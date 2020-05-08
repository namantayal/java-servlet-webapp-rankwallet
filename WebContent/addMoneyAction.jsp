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
<%
	String amount = request.getParameter("amount").toString();
	Customer.addBalance(phone, amount);
	response.sendRedirect("/RankWallet/welcome.jsp");
%>
