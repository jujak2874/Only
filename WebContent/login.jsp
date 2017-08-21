<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="signup.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int result = (int) request.getAttribute("result");
		if (result == 1) {
			session.setAttribute("sessionId", request.getAttribute("id"));
			System.out.println("세션넘어감");
	%>
	<script type="text/javascript">
		alert("로그인 성공");
		location.href = "timeline.jsp";
	</script>
	<%
		} else if (result == 0) {
	%>
	<script type="text/javascript">
		alert("로그인 실패 비밀번호를 확인하세요");
		location.href = "signUpForm.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("로그인 실패 아이디를 확인하세요");
		location.href = "signUpForm.jsp";
	</script>
	<%
		}
	%>
</body>
</html>