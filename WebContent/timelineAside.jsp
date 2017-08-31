<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<%
	String userid = (String)session.getAttribute("sessionId"); 
%>
	<script type="text/javascript">
	var websocket = new WebSocket("ws://localhost:8080/Only/mysocket");
	websocket.onopen = function(){
		document.getElementById("disp").innerHTML += "연결성공<br>";
	}

	websocket.onclose = function(){
		document.getElementById("disp").innerHTML += "연결종료<br>";
	}

	websocket.onerr = function(){
		document.getElementById("disp").innerHTML += "에러발생<br>";
	}
	
	websocket.onmessage = function(event){
		var notification = JSON.parse(event.data);
		if(notification.to=='<%=userid%>'){
			  console.log("메시지 받음: "+ notification.message);
			  console.log("현 메시지 창: " + $("#message_notification").attr("data-currentroom"));
			  
			  switch(notification.type){
			  case 'chat':
				 chat_reload(notification.message);
				 $.post("updateNotification.jsp", {type:"chat"}, function(data) {
					 console.log("update notification");
					 updateMessageNotification(data.trim());	 
					 });
				 break;
			  }
		}
	}
	
	function sendChat(message){
		websocket.send(message);
	}
	
	function updateMessageNotification(num){
		console.log(num);
		if(num==0 || num=="0"){
			$("#message_notification").html("<span>모든 메시지 읽음</span>");
			$("#message_notification").removeClass('alert');
		}else{
			$("#message_notification").html("<span>"+num+"개의 읽지 않은 Message</span>");
			$("#message_notification").addClass('alert');
		}
	}
	</script>
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