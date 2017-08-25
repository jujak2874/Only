<%@page import="dao.ChatDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> use = new ArrayList<>();
		List<String> use2 = new ArrayList<>();
		List<String> use3 = new ArrayList<>();
		ChatDao CB = ChatDao.getInstance();
		int chat1 = CB.chkrow(request.getParameter("chat1"));
		int chat2 = CB.chkrow(request.getParameter("chat2"));
		if (chat1 < chat2) {
			use = CB.chatload(request.getParameter("chat1") + ":" + request.getParameter("chat2"));
			use2 = CB.getList();
			use3 = CB.getList2();
		} else {
			use = CB.chatload(request.getParameter("chat2") + ":" + request.getParameter("chat1"));
			use2 = CB.getList();
			use3 = CB.getList2();
		}
		int a = 0;
		for (String i : use) {
			if (use2.get(a).equals(request.getParameter("chat1"))) {
	%><div
		style="padding: 8px; border-style: solid; border: 0px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; background-color: #1DDB16; color: white; width: 225px; float: left; margin-top: 15px; font-size: medium; word-break: break-all;">
		<%
			out.println(i);
		%>
	</div>
	<div style="font-size: 1px; float: left; margin-left: 130px;">
		<%
			out.print(use3.get(a));
		%>
	</div>
	<%
		}
			if (use2.get(a).equals(request.getParameter("chat2"))) {
	%>

	<div
		style="padding: 8px; border-style: solid; border: 0px; border-top-left-radius: 10px; border-bottom-left-radius: 10px; background-color: #00D8FF; color: white; width: 225px; float: right; margin-top: 10px; font-size: medium; word-break: break-all;">
		<%
			out.print(i);
		%>
	</div>
	<div style="font-size: 1px; float: right; margin-right: 130px;">
		<%
			out.print(use3.get(a));
		%>
	</div>
	<%
		}
			a++;
		}
	%>

</body>
</html>