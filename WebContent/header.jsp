<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/search.js"></script>
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
			<input list="searchResult" class="searchTerm" name="searchTerm" placeholder="Search" onkeyup="runSearch()" autocomplete="off">
			<datalist id="searchResult">
  			</datalist>
			<button type="submit">Search</button>
		</form>
	</div>
	<!-- 서치 끝 -->
	<div class="header_profile">
			<div class="header_profile_wraper" data-click="profile_icon">
				<a id="user_profile_url" href="${sessionId }"> 
				<img style="vertical-align:middle" src=".${profile_img }">
  				<span>${name }</span> 
				</a>
			</div>
		</div>
</div>
<!-- 상단고정바 끝 -->
</body></html>