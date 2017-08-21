<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function searchChk() {
		if(document.frm.searchTerm.value==""){
			alert("검색어를 입력하세요");
			return false;
		}
	}
</script>
</head>
<body>
<%
System.out.println("header");
%>
<!-- 상단고정바 시작 -->
<div class="header">
	<!-- 상단고정바 로고 -->
	<div class="head_logo">
		<h1 class="head_logo">
			<a id="logo_href" href="#"> <img id="logo_top" alt=""
				src="img_all/logo3.png">
			</a>
		</h1>
	</div>
	<!-- 로고 끝 -->
	<!-- 상단고정바 서치 -->
	<div class="search">
		<form class="form-wrapper cf" name="frm" action="search.do" method="post" onsubmit="return searchChk()">
			<input type="text" class="searchTerm" name="searchTerm" placeholder="Search">
			<button type="submit">Search</button>
		</form>
	</div>
	<!-- 서치 끝 -->
</div>
<!-- 상단고정바 끝 -->
</body></html>