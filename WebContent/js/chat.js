$(function() {
	$(".chatStart").click(function(e) {
		alert("chatroomid: " + e.target.id);
		var chatroomid = e.target.id;
		var sendData = "chatRoom=" + chatroomid;
		$.post("getChat.jsp", sendData, function(data) {
			var start = data.indexOf('<span>');
			var end = data.indexOf('</span>');
			var result = data.slice(start + 6, end);
			console.log("chat" + result);
			$(".chat").attr("id", "chat-" + chatroomid);
			$(".send").attr("id", "send-" + chatroomid);
			$(".send").attr("data-chatRoom", chatroomid)
			$(".send").attr("data-getT", e.target.getAttribute("data-getT"));
			$(".send").attr("data-sendT", e.target.getAttribute("data-sendT"));
			$(".FKKK").attr("id", "FKKK-" + chatroomid);
			$("#placeI").show();
			$("#chatRoomDisplay").html(result);
			$("#chatRoomDisplay").scrollTop(
					$("#chatRoomDisplay")[0].scrollHeight);
			
		});
	});

	$(".send").click(
			function(e) {
				if ($(".chat").val() == "") {
					alert("메시지를 입력하세요");
					$(".chat").focus();
					return;
				}
				var sendData = {
					chat : $(".chat").val(),
					sendT : $(".send").attr("data-sendT"),
					getT : $(".send").attr("data-getT")
				};

				$.post("saveChat.jsp", sendData, function(data) {
					var sendData = "chatRoom="
							+ $(".send").attr("data-chatroom");
					$.post("getChat.jsp", sendData, function(data) {
						var start = data.indexOf('<span>');
						var end = data.indexOf('</span>');
						var result = data.slice(start + 6, end);
						console.log("chat" + result);
//						$(".send").attr("data-getT",
//								e.target.getAttribute("data-getT"));
//						$(".send").attr("data-sendT",
//								e.target.getAttribute("data-sendT"));
//						$("#placeI").show();
						$("#chatRoomDisplay").html(result);
						$("#chatRoomDisplay").scrollTop(
								$("#chatRoomDisplay")[0].scrollHeight);
						$(".chat").val("");
					});
				});
			});

	$(".FKKK").click(function(e) {
		$("#placeI").hide();
	});
});

function enterKeyPressed() {
	if ($(".chat").val() == "") {
		alert("메시지를 입력하세요");
		$(".chat").focus();
		return;
	}
	var sendData = {
		chat : $(".chat").val(),
		sendT : $(".send").attr("data-sendT"),
		getT : $(".send").attr("data-getT")
	};

	$.post("saveChat.jsp", sendData, function(data) {
		var sendData = "chatRoom=" + $(".send").attr("data-chatroom");
		$.post("getChat.jsp", sendData, function(data) {
			var start = data.indexOf('<span>');
			var end = data.indexOf('</span>');
			var result = data.slice(start + 6, end);
			console.log("chat" + result);
//			$(".send").attr("data-getT", e.target.getAttribute("data-getT"));
//			$(".send").attr("data-sendT", e.target.getAttribute("data-sendT"));
//			$("#placeI").show();
			$("#chatRoomDisplay").html(result);
			$("#chatRoomDisplay").scrollTop(
					$("#chatRoomDisplay")[0].scrollHeight);
			$(".chat").val("");
		});
	});
}
