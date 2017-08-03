<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/timeline.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	/* JS - infinite scroll 구현 */
	var page = 4;
	$(window)
			.scroll(
					function() {
						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) {
							console.log(++page);
							$("body")
									.append(
											'<div class="infinite_scroll"><h1>Page '
													+ page
													+ '</h1>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br></div>');
						}
					});
	/* infinite scroll 끝 */
</script>
</head>
<body>
	<!-- 상단고정바 시작 -->
	<div class="header">
		<!-- 상단고정바 로고 -->
		<div class="head_logo">
			<h1 class="head_logo">
				<a href="#"> <img id="logo_top" alt="" src="img_all/logo3.png">
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
	<div class="main">
		<div class="infinite_scroll">
			<h1>page1</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
		<div class="infinite_scroll">
			<h1>page2</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
		<div class="infinite_scroll">
			<h1>page3</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
		<div class="infinite_scroll">
			<h1>page4</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
		<div class="infinite_scroll">
			<h1>page5</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
		<div class="infinite_scroll">
			<h1>page6</h1>
			테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>
		</div>
	</div>
	<!-- 내용 들어갈 부분 -->
</body>
</html>