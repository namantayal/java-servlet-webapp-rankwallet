<%@page import="rankwallet.Customer"%>
<%@ page import="java.util.UUID" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			response.sendRedirect("/RankWallet/welcome.jsp");
		}
		else{
			phone=loginSession.getAttribute("phone").toString();
		}
	}
%>
<%	UUID uuid=UUID.randomUUID();
	String amount = request.getParameter("amount").toString();
	Customer.addBalance(phone, amount,uuid,phone);
	response.sendRedirect("/RankWallet/welcome.jsp");
%>