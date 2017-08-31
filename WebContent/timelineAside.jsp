<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<%
	String userid = (String)session.getAttribute("sessionId"); 
%>
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

	<div class="page_margin"></div>
	<div id="placeI" class="chatListToggle">
	<div class="aside_chat">
		<div id="chatRoomDisplay" data-currentroom=""></div>
		<div id="chatRoomInput">
			<input class="chat" id ="" type="text" name="chat" onkeypress="if(event.keyCode==13) {enterKeyPressed(); return false;}"
				style="float: left; width: 90%; height: 20px;"> 
			<input
				class="send" id="" type="submit" value="보내기" data-chatRoom="" data-sendT=""
				data-getT="" style="float: left; height: 26px; width: 40%;">
			<input class="FKKK" id="" type="submit" value="나가기"
				style="width: 40%; float: left; height: 26px;">
		</div>
	</div>
</div>
		
<!-- aside 부분 / *팔로우 추천, 광고등 끝 -->