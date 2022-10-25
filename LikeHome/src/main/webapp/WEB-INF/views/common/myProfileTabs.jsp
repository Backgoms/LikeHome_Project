<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	
	window.addEventListener("DOMContentLoaded", function (){
		var currentPage = document.URL.substring(document.URL.lastIndexOf("/") + 1);
		document.getElementById(currentPage).style.color = '#ff6500';
	});

</script>

<!-- 마이페이지(프로필/쇼핑/설정) -->
  <div class="row bg-white">
  	<div class="col">
  		<div class="row text-center py-2 justify-content-center border-bottom">
			 <div class="col-auto" style="color:#ff6500;" onclick="location.href='../customer/customerProfileMyHomePage'">프로필</div>
			 <div class="col-auto" onclick="location.href='myOrderListPage'">나의 쇼핑</div>
			 <div class="col-auto" onclick="location.href='customerInfoSettingPage'">설정</div>
  		</div>
  	</div>
  </div>  


<!-- 마이페이지 > 나의쇼핑 -->
<div class="row bg-white">
  	<div class="col px-0">
	  <div class="scroll-container py-2 text-center">
		 <div class="menu" id="customerProfileMyHomePage" onclick="location.href='customerProfileMyHomePage'">마이홈</div>
		 <div class="menu" id="" onclick="location.href='#'">사진</div>
		 <div class="menu" id="customerShocustomerProfileMyLikePageppingProductQnaPage" onclick="location.href='customerProfileMyLikePage'">좋아요</div>
		 <div class="menu" id="customerProfileMyPostScrapPage" onclick="location.href='customerProfileMyPostScrapPage'">사진스크랩</div>
		 <div class="menu" id="" onclick="location.href='#'">팔로워</div>
		 <div class="menu" id="" onclick="location.href='#'">팔로우</div>
  	  </div>
  </div>
</div>  