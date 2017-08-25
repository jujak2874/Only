<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript">
   function searchChk() {
      if (document.frm.searchTerm.value == "") {
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
         <form class="form-wrapper cf" name="frm" action="search.do"
            method="post" onsubmit="return searchChk()">
            <input list="searchResult" class="searchTerm" name="searchTerm"
               placeholder="Search" onkeyup="runSearch()" autocomplete="off">
            <datalist id="searchResult">
            </datalist>
            <button type="submit">Search</button>
         </form>
      </div>
      <!-- 서치 끝 -->
      <div class="header_profile">
         <div class="header_wraper" data-click="profile_icon">
            <a id="user_profile_url" href="${sessionId }"> 
            <img style="vertical-align: middle" src=".${profile_img }"> <span>${name }</span>
            </a>
         </div>

         <div class="header_wraper">
            <div class="nav_icon">
               <div class="friend_list">
               <form action="friendList.do" method="post">
                  <a  class="info" href="javascript:;" onclick="parentNode.submit();">
                     <div class='navImage'><span>Friend List</span></div>
                  </a>
                  <input type="hidden" name="member_id" value="${sessionId }">
                  </form>
               </div>
            </div>
            <div class="nav_icon">
               <div class="alarm_list" data-click="alarm_list_icon">
                  <a href="alarm.do" class="info">
                  <div class='navImage'><span>Notifications</span></div></a>
               </div>
            </div>

            <div class="nav_icon">
               <div class="message_list" data-click="message_list_icon">
                  <a href="message.do" class="info">
                  <div class='navImage'><span>Message</span></div></a>
               </div>
            </div>

         </div>
      </div>
   </div>
   <!-- 상단고정바 끝 -->
</body>
</html>