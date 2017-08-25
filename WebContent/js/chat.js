var white = true;
var black = false;
$(function() {
	startRefresh();
	var chat2 = {
		chat : $("#chat").val(),
		chat1 : $("#chat1").val(),
		chat2 : $("#chat2").val()
	};
	$.get("roompl.jsp", chat2, function(data) {
		$("#placeI").html(data);
	});
	$(".roomset").bind("click", function() {
		$("#chat1").val($(this).attr("title"));
		$("#placeI").empty();
		white = true;
		black = true;
	});
	$("#FKKK").bind("click", function() {
		black = false;
		$.get("roompl.jsp", chat2, function(data) {
			setTimeout(function() {
				document.getElementById("chat1").value = "";
				$("#placeI").empty();
				$("#placeI").html(data);
			}, 500);
		});
	});
	$("input[name=chat]").keydown(function(key) {
		if (key.keyCode == 13) {
			var sendData = {
				chat : $("#chat").val(),
				chat1 : $("#chat1").val(),
				chat2 : $("#chat2").val()
			};
			$.post("chatsave.jsp", sendData, function(data) {
				document.getElementById("chat").value = "";
				setTimeout(function() {
					$("#placeI").scrollTop($("#placeI")[0].scrollHeight)
				}, 500);
				webStart();
			});
		}
	});
	var first = true;
	$(".B").bind("click", function() {
		if (first) {
			$("#toggle").slideToggle(500, function() {
				$("#C").toggleClass("other");
			});
			$("#C").animate({
				top : "+=477px"
			}, 500);
		} else if (!first) {
			$("#C").toggleClass("other", 1, function() {
				$("#toggle").slideToggle(500);
				$.get("roompl.jsp", chat2, function(data) {
					$("#placeI").empty();
					$("#placeI").html(data);
				});
			});
			$("#C").animate({
				top : "-=477px"
			}, 500);
		}
		first = !first;
	});
	$("#C").draggable({
		handle : ".F",
		containment : 'window',
		scroll : false
	});
	$("#send").click(function() {
		var sendData = {
			chat : $("#chat").val(),
			chat1 : $("#chat1").val(),
			chat2 : $("#chat2").val()
		};
		$.post("chatsave.jsp", sendData, function(data) {
			document.getElementById("chat").value = "";
			setTimeout(function() {
				$("#placeI").scrollTop($("#placeI")[0].scrollHeight)
			}, 500);
		});
	});
	var two = true;
	$(".B").click(function() {
		if (two) {
			$(".B").attr("id", "chatBtn");
		} else {
			$("#chatBtn").removeAttr('id');
		}
		two = !two;
	});
});
function startRefresh() {
	if (black) {
		var some = {
			chat1 : $("#chat1").val(),
			chat2 : $("#chat2").val()
		};
		$.get('chatplace.jsp', some, function(data) {
			$('#placeI').html(data);
		});
		if (white) {
			setTimeout(function() {
				$("#placeI").scrollTop($("#placeI")[0].scrollHeight);
			}, 500);
			white = !white;
		}
		setTimeout(startRefresh, 250);
	}
}


