// 타입선택 각 버튼 누를시 글쓰기 폼 열림/닫힘
/*$(function() {
 $('.img_text_prev').on('click', function() {
 $('#next').removeClass('choice_box_next');
 $('#next').addClass('choice_box_prev');
 $('#prev').removeClass('choice_box_prev');
 $('#prev').addClass('choice_box_next');
 });
 });
 $(function() {
 $('.img_text_next').on('click', function() {
 $('#next').removeClass('choice_box_prev');
 $('#next').addClass('choice_box_next');
 $('#prev').removeClass('choice_box_next');
 $('#prev').addClass('choice_box_prev');
 });
 });
 $(function() {
 $('.img_img_prev').on('click', function() {
 $('#next').removeClass('choice_box_next');
 $('#next').addClass('choice_box_prev');
 $('#prev').removeClass('choice_box_prev');
 $('#prev').addClass('choice_box_next');
 });
 });
 $(function() {
 $('.img_img_next').on('click', function() {
 $('#next').removeClass('choice_box_prev');
 $('#next').addClass('choice_box_next');
 $('#prev').removeClass('choice_box_next');
 $('#prev').addClass('choice_box_prev');
 });
 });*/
// 타입선택 각 버튼 누를시 글쓰기 폼 열림/닫힘 끝
// textarea focus일 때 작성폼 열기
$(function() {
	$('.type_choice_textarea').on('focus', function() {
		$(this).css("height", "150px");
		$('.img_hide').removeClass('img_hidden');
	});
	$('.type_choice_textarea').on('blur', function() {
		if ($('textarea[name="text"]').val() == '') {
			$(this).css("height", "30px");
			$('.img_hide').addClass('img_hidden');
		}
	});
});
// textarea focus일 때 작성폼 열기 끝
// infinite scroll 구현
var page = 7;
$(window)
		.scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() == $(document).height()) {
						$('.post_view_box')
								.append(
										'<li class="infinite_scroll">'
												+ '<h3>'
												+ page++
												+ '번포스트</h3>'
												+ '<hr> 테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>테스트<br>'
												+ '</li>')
					}
				});
// infinite scroll 끝