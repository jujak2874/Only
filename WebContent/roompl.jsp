<%@page import="dto.ChatMessage"%>
<%@page import="dao.ChatDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$(".roomset").bind("click", function() {
			$("#chat1").val($(this).attr("title"));
			$("#placeI").empty();
			white = true;
			black = true;
			startRefresh();
		});
	});
</script>
<style type="text/css">
.roomset {
	border: 1px solid silver;
	background-color: white;
	width: 450px;
	height: 100px;
	font-size: x-large;
	font-weight: bold;
	overflow: hidden;
	cursor: pointer;
	user-select: none;
	transition: background-color, 0.5s;
}

.roomset:HOVER {
	background-color: #2377ff;
}

.p {
	text-align: center;
}
</style>
</head>
<body>
	<span>
		<%
			List<ChatMessage> chatRoomList = new ArrayList<>();
			ChatDao dao = ChatDao.getInstance();
			chatRoomList = dao.chatRLoad((String) session.getAttribute("sessionId"));
			chatRoomList = dao.chatRLoad("test");
			if (chatRoomList.size() == 0) {
			%>No Chat History<%
			} else{
				%><ol><%
				for (ChatMessage cm : chatRoomList) {
					%><li><%=cm.getCid() %>|| <%=cm.getMessage() %></li><%
				}
				%></ol><%
			}
		%>
	</span>
</body>
</html>