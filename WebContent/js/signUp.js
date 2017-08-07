// 회원가입 로그인페이지 버튼 누를시 페이지 변경하게 하는 스크립트
$(document).ready(function() {

	$('#signup-btn').on("click", function() {
		$("#signup").removeClass("s-atbottom");
		$("#signup").addClass("s-attop");
		$("#login").removeClass("l-attop");
		$("#login").addClass("l-atbottom");
	});

	$('#login-btn').click(function() {
		$("#signup").removeClass("s-attop");
		$("#signup").addClass("s-atbottom");
		$("#login").removeClass("l-atbottom");
		$("#login").addClass("l-attop");
	});
});

// 아이디 중복체크하는 스크립트
