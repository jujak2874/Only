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