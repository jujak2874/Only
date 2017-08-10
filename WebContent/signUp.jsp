<%@page import="signup.*"%>
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
	<jsp:useBean id="signUp" class="signup.SignUp" />
	<jsp:setProperty property="*" name="signUp" />
	<%
		SignUpDao dao = SignUpDao.getInstance();
		int result = dao.insert(signUp);
		if (result > 0) {
	%>
	<script type="text/javascript">
		alert("가입성공");
		location.href = "signUpForm.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("가입실패");
		location.href = "signUpForm.jsp";
	</script>
	<%
		}
	%>

	<%
		String id = request.getParameter("mem_id");
		SignUpDao dao2 = SignUpDao.getInstance();
		int result2 = dao2.chkId(id);
	%>
	<%=result2 %>
</body>
</html>