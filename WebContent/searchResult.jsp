<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/timeline.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" type="text/css" href="css/timeline.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
</head>
<body>
	<!-- 상단고정바 시작 -->
	<div id="header"><jsp:include page="header.jsp"></jsp:include></div>
	<!-- 상단고정바 끝 -->
	<div class="header_hidden"></div>
	<!-- 내용 들어갈 부분 -->

	<div class="search_main">
		<!-- 포스트작성 / 뷰 부분 -->
		<div class="search_post">
			<div class="page_margin"></div>
			<!-- 테스트 -->
			<!--  -->
			<ol class="search_view_box">
				<!-- 타입 선택 후 끝 -->
				<!-- 포스트 뷰 시작 -->
				<%
					if (request.getAttribute("searchResult") == null) {
				%>
				<li class="infinite_scroll"><h3>검색 결과가 없습니다</h3></li>
				<%
					} else {
						List<Member> list = (ArrayList) request.getAttribute("searchResult");
						for (Member member : list) {
				%>
				<li class="search_result">
					<div class="search_profile">
						<table>
							<tr>
								<td valign="middle">
								<img alt=''
									src='<%=application.getContextPath() + "/" + (member.getProfile_image())%>'>
								</td>
								<td valign="middle"><h3><%=member.getUsername()%></h3></td>
							</tr>
						</table>
					<hr><%=member.getEmail()%><br>
					<hr><%=member.getProfile_image()%><br> <%=member.getBirth()%><br>
					<hr>
		</div>
		</li>

		<%
			}
			}
		%>
		</ol>
		<!-- 포스트 뷰 끝 -->
	</div>
	<!-- 포스트작성 / 뷰 끝 -->
	<!-- aside 부분 / *팔로우 추천, 광고등 -->
	<div class="timeline_aside">
		<div class="page_margin"></div>
		<div class="aside_follow">
			<h3>팔로우 추천 테스트</h3>
			<hr>
			내용 테스트<br> 내용 테스트<br> 내용 테스트<br>
		</div>
		<div class="aside_interested">
			<h3>내 관심사 테스트</h3>
			<hr>
			내용 테스트<br> 내용 테스트<br> 내용 테스트<br>
		</div>
	</div>
	<!-- aside 부분 / *팔로우 추천, 광고등 끝 -->
	</div>
	<!-- 내용 들어갈 부분 끝 -->
</body>
</html>