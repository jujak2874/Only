<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String type= request.getParameter("type");
	System.out.println(type);
	int unreadMessage = 0;
	if(type.equals("chat")){
		ChatDao cdo = ChatDao.getInstance();
		unreadMessage = cdo.checkUnreadMessage((String) session.getAttribute("sessionId"));
		System.out.println("unread message: " + unreadMessage);
	}
%><%=unreadMessage %>
