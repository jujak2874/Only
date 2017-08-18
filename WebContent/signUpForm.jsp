<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/signUp.css">
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/signUp.js"></script>
<script type="text/javascript">
	/* function chk() {
		inputLogin = eval("document.loginForm");
		if (!inputLogin.member_id.value) {
			alert("아이디를 입력하세요");
			inputLogin.member_id.focus();
			return false;
		}
		if (!inputLogin.password.value) {
			alert("비밀번호를 입력하세요");
			inputLogin.password.focus();
			return false;
		}
	} */
	var check = false;
	var lastKeyword = '';
	var loopSendKeyword = false;
	function checkId() {
		if (check == false) {
			setTimeout("sendId();", 500);
			loopSendKeyword = true;
		}
		check = true;
	}
	function sendId() {
		if (loopSendKeyword == false) {
			return;
		}
		var keyword = $('#member_id').val();
		if (keyword == '') {
			lastKeyword = '';
			$('#checkMsg').css('color','red');
			$('#checkMsg').text("아이디를 입력하세요");
			console.log('아이디작성안하면작동');
		} else if (keyword != lastKeyword) {
			lastKeyword = keyword;
			if (keyword != '') {
				var params ="id="+encodeURIComponent(keyword);
				console.log(params);
				$.post("id_check.jsp", params, function(data) {
					var start = data.indexOf('<li>');
					var end = data.indexOf('</li>');
					var kk = data.slice(start+4,end);
				 displayResult(kk);
				console.log(kk);
				});
				console.log("아이디작성하면작동");
			} else {
			}
		}
		setTimeout("sendId();", 500);
	}

	function displayResult(data) {
				var listView = document.getElementById('checkMsg');
				/* document.getElementById('checkMsg') */
				if (data == 0) {
					console.log("사용가능");
					listView.innerHTML = "사용할 수 있는 ID에요";
					listView.style.color = "#4a76b2";
					$('#signup_fin').prop('disabled',false);
				} else {
					console.log("사용불가");
					listView.innerHTML = "이미 다른분이 사용중인 ID에요";
					listView.style.color = "#ce375f";
					$('#signup_fin').prop('disabled',true);
				}
			} 
</script>
</head>
<body>
	<div class="signUpContain">
		<!-- 로그인 폼 시작 -->
		<div class="login-signup l-attop" id="login">
			<div class="login-signup-title">LOG IN</div>
			<div class="login-signup-content">
				<div class="input-name">
					<h2>ID</h2>
				</div>
				<form action="login.jsp" name="loginForm" method="post"
					onsubmit="return chk()">
					<input type="text" name="member_id" value=""
						class="field-input" />
					<div class="input-name input-margin">
						<h2>Password</h2>
					</div>
					<input type="password" name="password" value="" class="field-input" />
					<div class="input-r">
						<div class="check-input">
							<input type="checkbox" id="remember-me-2" name="rememberme"
								value="" class="checkme"> <label class="remmeberme-blue"
								for="remember-me-2"></label>
						</div>
						<div class="rememberme">
							<label for="remember-me-2">Remember Me</label>
						</div>
					</div>
					<button class="submit-btn sub-before">Enter</button>
				</form>
				<button type="submit" class="submit-btn sub-before" id="signup-btn">SignUp</button>
				<div class="forgot-pass">
					<a href="#">Forgot Password?</a>
				</div>
			</div>
		</div>
		<!-- 로그인 폼 끝 -->
		<!-- 회원가입 폼 시작 -->
		<div class="login-signup s-atbottom" id="signup">
			<div class="login-signup-title">SIGN UP</div>
			<div class="login-signup-content">
				<form action="signUp.jsp" method="post">
					<div class="input-name">
						<h2>ID</h2>
					</div>
					<input type="text" name="member_id1" value=""
						class="field-input signup_id" id="member_id" onkeyup="checkId()"/>
						<div id="checkMsg">아이디를 입력하세요</div>
					<div class="input-name input-margin">
						<h2>Password</h2>
					</div>
					<input type="password" name="password" value=""
						class="field-input signup_pwd" id="password" />
					<div class="input-name input-margin">
						<h2>Nickname</h2>
					</div>
					<input type="text" name="nickname" value=""
						class="field-input signup_nick" id="nickname" />
					<div class="input-name input-margin">
						<h2>E-Mail</h2>
					</div>
					<input type="email" name="email" value=""
						class="field-input signup_mail" id="email" />
					<button class="submit-btn sub-before" id="signup_fin" disabled="disabled">Enter</button>
				</form>
				<button class="submit-btn sub-before" id="login-btn">Login</button>
			</div>
		</div>
		<!-- 회원가입 폼 끝 -->
	</div>
</body>
</html>