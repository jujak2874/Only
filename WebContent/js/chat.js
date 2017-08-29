$(function() {
	$("#send").click(function(e) {
		if($("#chat").val()==""){
			alert("메시지를 입력하세요");
			return;
		}
		var sendData = {
				chat : $("#chat").val(),
				sendT : $("#send").attr("data-sendT"),
				getT : $("#send").attr("data-getT")
			};
		
		$.post("saveChat.jsp", sendData, function(data) {
			var sendData = "chatRoom=" + $("#send").attr("data-chatRoom");
			$.post("getChat.jsp", sendData, function(data) {
				var start = data.indexOf('<span>');
				var end = data.indexOf('</span>');
				var result = data.slice(start + 6, end);
				console.log("chat" + result);
				$("#send").attr("data-getT", e.target.getAttribute("data-getT"));
				$("#send").attr("data-sendT", e.target.getAttribute("data-sendT"));
				$("#placeI").show();
				$("#chatRoomDisplay").html(result);
				$("#chatRoomDisplay").scrollTop($("#chatRoomDisplay")[0].scrollHeight);
				webStart();
			});
		});
	});
	$('#send').on('click',function(){
		$('#chat').val('');
	});
});

