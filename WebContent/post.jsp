<%@page import="post.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="post" class="post.Post" />
	<jsp:setProperty property="*" name="post" />
	<%
		String text = request.getParameter("text");
		request.setAttribute("text", text);
		String sessionId = (String) session.getAttribute("sessionId");
		System.out.println("세션아이디는" + sessionId);
		PostDao dao = PostDao.getInstance();
		post.setMember_id(sessionId);
		post.setText(text);
		int result = dao.insertPost(request, post);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("작성성공");
		location.href = "timeline.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("작성실패");
		location.href = "timeline.jsp";
	</script>
	<%
		}
	%>
</body>
</html>