<%@page import="signup.SignUpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String member_id = request.getParameter("id");
		System.out.println(member_id);
		SignUpDao dao = SignUpDao.getInstance();
		int result = dao.checkId(member_id);
	%>
	<li><%=result %></li>
</body>
</html>