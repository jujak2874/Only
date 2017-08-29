<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- aside 부분 / *팔로우 추천, 광고등 -->
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
		<div class="chatProfile">
			<div class="half">
				<img alt="" src=".${profile_img }" class="chatProfileImg">
				<h2>${user }</h2>
			</div>
		</div>
		<div id="chatRoomDisplay"></div>
		<div id="chatRoomInput">
			<input class="chat chatBtn" id="" type="text" name="chat"
				onkeypress="if(event.keyCode==13) {enterKeyPressed(); return false;}">
			<button type="submit" class="send chatBtn" id="" data-chatRoom="" data-sendT="" data-getT="">보내기</button>
			<!-- <input class="FKKK chatBtn" id="" type="submit" value="나가기"> -->
		</div>
	</div>
</div>

<!-- aside 부분 / *팔로우 추천, 광고등 끝 -->
<!-- aside 부분 / *팔로우 추천, 광고등 끝 -->