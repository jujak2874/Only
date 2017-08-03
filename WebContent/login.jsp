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
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("member_id");
		String pwd = request.getParameter("password");

		SignUpDao dao = SignUpDao.getInstance();
		int result = dao.login(id, pwd);

		if (result == 1) {
			session.setAttribute("sessionId", id);
	%>
	<script type="text/javascript">
		alert("로그인 성공");
		location.href="timeline.jsp";
	</script>
	<%
		} else if (result == 0) {
	%>
	<script type="text/javascript">
		alert("로그인 실패 비밀번호를 확인하세요");
		location.href="signUpForm.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("로그인 실패 아이디를 확인하세요");
		location.href="signUpForm.jsp";
	</script>
	<%
		}
	%>
</body>
</html>