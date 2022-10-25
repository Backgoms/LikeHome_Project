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
			 <div class="col-auto" onclick="location.href='../customer/customerProfileMyHomePage'">프로필</div>
			 <div class="col-auto" style="color:#ff6500;" onclick="location.href='myOrderListPage'">나의 쇼핑</div>
			 <div class="col-auto" onclick="location.href='customerInfoSettingPage'">설정</div>
  		</div>
  	</div>
  </div>  


<!-- 마이페이지 > 나의쇼핑 -->
<div class="row bg-white">
  	<div class="col px-0">
	  <div class="scroll-container py-2 mb-1 text-center">
		 <div class="menu" id="myOrderListPage" onclick="location.href='myOrderListPage'">주문배송내역조회</div>
		 <div class="menu" id="customerShoppingProductScrapPage" onclick="location.href='customerShoppingProductScrapPage'">상품 스크랩북</div>
		 <div class="menu" id="customerShoppingProductQnaPage" onclick="location.href='customerShoppingProductQnaPage'">상품문의내역</div>
		 <div class="menu" id="customerShoppingProductReviewPage" onclick="location.href='customerShoppingProductReviewPage'">리뷰관리</div>
		 <div class="menu" id="customerShoppingCouponPage" onclick="location.href='customerShoppingCouponPage'">쿠폰</div>
		 <div class="menu" id="customerShoppingPointPage" onclick="location.href='customerShoppingPointPage'">포인트</div>
		 <div class="menu" id="customerShoppingGradePage" onclick="location.href='customerShoppingGradePage'">구매등급</div>
		 <div class="menu" id="customerShoppingHelpPage" onclick="location.href='customerShoppingHelpPage'">고객센터</div>
		 <div class="menu" id="customerMyHelpQnaPage" onclick="location.href='customerMyHelpQnaPage'">문의하기</div>
  	  </div>
  </div>
</div>  