<!--                                                                                                     
                                                                                                    
                                                                      
                                                                      
                                                                      
                                                                      
                                                                      
         KeeeeD                             eee                       
       eeeeeeeeeee                         Xee                        
     eeeK       eee                        eee                        
    eee          eeD                       ee                         
   ee#           eeE    ee     yee        9e9        ee      Xee      
  eee            ee     ee   #eeee        ee        ee5      ee       
  ee            eee     ee  eeW ee       eee       Ee#      ,ee       
 eee           eee     5e  ee   ee     9eeee       ee       ee        
 eee          eee      ee,ee    ee   Eee  ee     zeee    GeeeX        
  eey      zeee        eeeK     eeeeeeW   ee   Xee eeeeeee ee         
   eeeeeeeeee          ee                 eeeeeeD   Xeeu   e#         
    yeeee9                                 5zD            ee          
                                                         ee,          
                                                         ee           
                                                        eeE           
                                                                      
                                                                      
                                                                      
         
                                                                                                    
                                                                                                    

 -->
<%@page import="dao.AlertDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dto.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<%!boolean isset(String str) {
		if (str == null) {
			return false;
		}
		if (str.equals("")) {
			return false;
		}
		return true;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/timeline.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
<script type="text/javascript">
	/* 검색창 focus 상태에서 검색이력 view */
	/* 검색창 focus 상태에서 검색이력 view 끝 */
</script>
<link rel="stylesheet" type="text/css" href="css/timelineFull.css">
<link rel="stylesheet" type="text/css" href="css/timelineMobile.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
<link rel="stylesheet" type="text/css" href="css/chat.css">
</head>
<%
	if (!isset((String) session.getAttribute("sessionId"))) {
%>
<%
	} else {
		System.out.println("세션받아옴");
		String userid = (String) session.getAttribute("sessionId");
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
			if(notification.type=='chat'){
				if(notification.to == '<%=userid%>
	') {
				console.log("메시지 받음: " + notification.message);
				console.log("현 메시지 창: "
						+ $("#message_notification").attr("data-currentroom"));
				chat_reload(notification.message);
				setTimeout(function() {
					$.post("updateNotification.jsp", {
						type : "chat"
					}, function(data) {
						console.log("update msg notification");
						updateMessageNotification(data.trim());
					});
				}, 500);
			}
		} else if (notification.type == 'post') {
			$.post("followChk.jsp", "userid2=" + notification.from, function(
					data) {
				if (data.indexOf("true") > 0) {
					setTimeout(function() {
						$.post("updateNotification.jsp", {
							type : "post"
						}, function(data) {
							console.log("update post notification");
							updateAlertNotification(data.trim());
						});
					}, 100);
				}
			});
		}
	}

	function sendChat(message) {
		websocket.send(message);
	}
	function updateMessageNotification(num) {
		console.log(num);
		if (num == 0 || num == "0") {
			$("#message_notification").html("<span>모든 메시지 읽음</span>");
			$("#message_notification").removeClass('alert');
		} else {
			$("#message_notification").html(
					"<span>" + num + "개의 읽지 않은 Message</span>");
			$("#message_notification").addClass('alert');
		}
	}

	function updateAlertNotification(num) {
		console.log(num);
		if (num == 0 || num == "0") {
			$("#alarm_notification").html("<span>새 글 없음</span>");
			$("#alarm_notification").removeClass('alert');
		} else {
			$("#alarm_notification").html(
					"<span>" + num + "개의 읽지 않은 새 글</span>");
			$("#alarm_notification").addClass('alert');
		}
	}
</script>
<body>
	<div id="wrapper">
		<div id="layerPop">
			<h3>공유하기</h3>
			<hr>
			테스트
			<hr>
			테스트 <a href="#" onclick="closeLayer('layerPop')" class="close">close</a>
		</div>
	</div>
	<!-- 상단고정바 시작 -->
	<div id="header"><jsp:include page="header.jsp"></jsp:include></div>
	<div class="header_hidden"></div>
	<!-- 내용 들어갈 부분 -->
	<div class="timeline_main">
		<!-- 포스트작성 / 뷰 부분 -->
		<div class="timeline_post">
			<div class="page_margin"></div>
			<!-- 테스트 -->
			<!--  -->
			<div id="main_container">
				<ol class="post_view_box">
					<li class="type_choice_box" id="infinite_container">
						<form action="postWrite.do" method="post"
							enctype="multipart/form-data"
							onsubmit='return sendChat(JSON.stringify({type:"post",from:"<%=id%>"}));'>
							<input type="hidden"
								value="<%=(String) session.getAttribute("sessionId")%>"
								name="member_id">
							<%
								System.out.println("path=" + application.getRealPath("/fileSave"));
							%>
							<input type="hidden"
								value="<%=application.getRealPath("/fileSave")%>" name="path">
							<textarea rows="1" cols="1" class="type_choice_textarea"
								name="text" placeholder="오늘은 무슨일이 있었나요?"></textarea>
							<div class="write_type_choice">
								<a class="choice_type"> <img alt=""
									src="img_timeline/picture.svg"
									class="img_hide img_hidden type_photo" width="30px" border='0'
									onclick='document.all.imageUpload.click();'> <input
									type="file" name="imageUpload" style='display: none;'
									accept="image/png, image/gif, image/jpg">
								</a> <a class="choice_type"> <img
									src='img_timeline/video-camera.svg'
									class="img_hide img_hidden img_video" width="30px" border='0'
									onclick='document.all.videoUpload.click();'> <input
									type="file" name="videoUpload" style='display: none;'
									accept="video/mp4">
								</a> <label class="img_hide img_hidden"><br>해시태그</label><input
									class="img_hide img_hidden" type="text" name="hashtag"><br>
								<label class="img_hide img_hidden">회원태그</label><input
									class="img_hide img_hidden" type="text" name="membertag"><br>
							</div>
							<button type="submit" class="post_submit_btn">작성</button>
						</form>
					</li>
					<!-- 타입 선택 후 끝 -->
					<%
						PostDao pdo = PostDao.getInstance();
							List<Post> postList = pdo.getTimelinePostList(userid);
							if (postList == null) {
					%>
					<li class="infinite_scroll">
						<h3>등록된 글이 없습니다</h3>
					</li>
					<%
						} else {
								System.out.println(postList.size() + "개의 포스트가 있음");
								for (Post p : postList) {
									AlertDao ado = AlertDao.getInstance();
									ado.markReadPost(userid, p.getPid());
					%><li class="infinite_scroll">
						<%
							if (p.getType() == 0) { // 텍스트 타입
						%>
						<h3><%=p.getUserid()%></h3>
						<hr>
						<h3><%=p.getText()%></h3> <%
 	} else if (p.getType() == 1) { // 사진타입
 %>
						<h3><%=p.getUserid()%></h3>
						<hr>
						<h3><%=p.getText()%></h3> <img src="upload/<%=p.getUrl()%>" class="postImg"> <%
 	} else if (p.getType() == 2) {
 %> <video class="postVideo" controls>
							<source src="upload/<%=p.getUrl()%>" type="video/mp4">
							<source src="upload/<%=p.getUrl()%>" type="video/ogg">
							<source src="upload/<%=p.getUrl()%>" type="video/mp4">
						</video> <%
 	}
 %><div class="reactBtn">
							<div class='heart'></div>
							<div class="share_out" onclick="openLayer('layerPop',200,18)"></div>
						</div>
						<div class="commentForm">
							<textarea rows="1" cols="1" name="text" placeholder="댓글쓰기"
								class="comment_textarea"></textarea>
						</div>
					</li>
					<%
						}
							}
					%>
				</ol>
			</div>
			<!-- 포스트 뷰 끝 -->
		</div>
		<jsp:include page="timelineAside.jsp"></jsp:include>
		<!-- <input id="FKKK" type="submit" value="나가기" style="width: 112px; float: left; height: 26px;"> -->
	</div>
	<!-- 내용 들어갈 부분 끝 -->
	<%
		}
	%>
</body>
</html>