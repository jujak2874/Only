<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	/* JS - infinite scroll 구현 */
	var page = 6;
	$(window)
			.scroll(
					function() {
						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							console.log(++page);
							$('.post_view_box')
									.append(
											'<li class="infinite_scroll"><h3>'
													+ page
													+ '번포스트 '
													+ '<hr>'
													+ '</h3>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br></li>');
						}
					});
	/* infinite scroll 끝 */
	/* 검색창 focus 상태에서 검색이력 view */
	$('.img_text').on('click', function() {
		$('#next').removeClass('choice_box_next');
		return false;
	});
	/* 검색창 focus 상태에서 검색이력 view 끝 */
</script>
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css" href="css/timeline.css">
</head>
<body>
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
			<form class="form-wrapper cf">
				<input type="text" class="searchTerm" placeholder="Search">
				<button type="submit">Search</button>
			</form>
		</div>
		<!-- 서치 끝 -->
	</div>
	<!-- 상단고정바 끝 -->
	<div class="header_hidden"></div>
	<!-- 내용 들어갈 부분 -->
	<div class="timeline_main">
		<!-- 포스트작성 / 뷰 부분 -->
		<div class="timeline_post">
			<div class="page_margin"></div>
			<ol class="post_view_box">
				<!-- 포스트 작성 타입 선택 전-->
				<li class="type_choice_box choice_box_prev" id="prev"><a
					href="#" class="type_choice img_text"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/pencil-edit-button.svg" width="35px">
					</i> <br> <span class="type_choice_name">텍스트</span>
				</a> <a href="#" class="type_choice img_img"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/photography-landscape-mode.svg" width="35px">
					</i> <br> <span class="type_choice_name">이미지</span>
				</a> <a href="#" class="type_choice img_video"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/film-roll.svg" width="35px">
					</i> <br> <span class="type_choice_name">비디오</span>
				</a> <a href="#" class="type_choice img_audio"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/sound-button.svg" width="35px">
					</i> <br> <span class="type_choice_name">오디오</span>
				</a> <a href="#" class="type_choice img_qna"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/question.svg" width="35px">
					</i> <br> <span class="type_choice_name">Q&A</span>
				</a></li>
				<!-- 타입 선택 전 끝 -->
				<!-- 타입 선택 후 -->
				<li class="type_choice_box choice_box_next" id="next"><a
					href="#" class="type_choice img_text"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/pencil-edit-button.svg" width="35px">
					</i> <br> <span class="type_choice_name">텍스트</span>
				</a> <a href="#" class="type_choice img_img"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/photography-landscape-mode.svg" width="35px">
					</i> <br> <span class="type_choice_name">이미지</span>
				</a> <a href="#" class="type_choice img_video"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/film-roll.svg" width="35px">
					</i> <br> <span class="type_choice_name">비디오</span>
				</a> <a href="#" class="type_choice img_audio"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/sound-button.svg" width="35px">
					</i> <br> <span class="type_choice_name">오디오</span>
				</a> <a href="#" class="type_choice img_qna"> <i
						class="type_choice_img"> <img alt=""
							src="img_timeline/question.svg" width="35px">
					</i> <br> <span class="type_choice_name">Q&A</span>
				</a>
					<hr> <textarea rows="10" cols="80"></textarea></li>
				<!-- 타입 선택 후 끝 -->
				<!-- 포스트 뷰 시작 -->
				<li class="infinite_scroll">
					<h3>1번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
				<li class="infinite_scroll">
					<h3>2번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
				<li class="infinite_scroll">
					<h3>3번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
				<li class="infinite_scroll">
					<h3>4번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
				<li class="infinite_scroll">
					<h3>5번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
				<li class="infinite_scroll">
					<h3>6번포스트</h3>
					<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
				</li>
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