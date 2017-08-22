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
var page = 4;
$(window)
		.scroll(
				function() {
					if ($(window).scrollTop()+$(window).height() == $(document).height()) {
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
$(function(){
	
$(".heart").on('click', function(){
	  $(this).toggleClass('is_animating');
	});
	$(".heart").on('animationend', function(){
	  $(this).toggleClass('is_animating');
		$(this).toggleClass('bg-position');
	});
});

function dEI(elementID){
	return document.getElementById(elementID);
}

function openLayer(IdName, tpos, lpos){
	var pop = dEI(IdName);
	pop.style.top = tpos + "px";
	pop.style.left = lpos + "%";
	pop.style.display = "block";

	var wrap = dEI("wrapper");
	var reservation = document.createElement("div");
	reservation.setAttribute("id", "deemed");
	wrap.appendChild(reservation);
}

//레이어 팝엽 닫기
function closeLayer( IdName ){
	var pop = dEI(IdName);
	pop.style.display = "none";
	var clearEl=parent.dEI("deemed");
	var momEl = parent.dEI("wrapper");
	momEl.removeChild(clearEl);
}

