<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<title>Insert title here</title>
<style>
	@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");
	body{
		font-family: Pretendard;
	}
	
	#title{
		
		font-size: 0.6rem;
		
	}
	
	#card{
		background-color: white;
		margin: 1rem;
        border: none;
	}
	
	#end{
		text-align: center;
        margin-top: 1em;
        margin-left: 1em;
	}
	
	#center{
		margin-top: 0.8em;
		margin-left: 0.7em;
		margin-right: 0.5em;
		font-size: 1rem;
		font-weight: bold;
		text-align: left;
		margin-bottom: 0px;
		color: #404040;
	}
	
	#amount{
	font-size: 1.3rem;
}
	
	#btncoupon{
	font-size: 1rem;
	background-color: #ff6500;
	color: white;

}

	#coupon_input{
	color: #ff6500;
	float: left;
}
	
	#inputCoupon{
	
	}
	
/*네비바*/
::-webkit-scrollbar {
   display: none;
}

#search{
	font-size: 1.2rem;	
}

#cart{
	margin-left: 10px;
	font-size: 1.5rem;
}

.scroll-container {
  display: flex;
  flex-wrap: no-wrap;
  overflow-x: scroll;
  overflow-y: hidden;
}
.menu {
  margin-left:20px;
  flex: 0 0 auto;
}

/*네비바*/	
	

	
</style>

</head>
<body>

<div class="container-fluid">
     <jsp:include page="../common/sidebarHeader.jsp"></jsp:include>	
     <jsp:include page="../common/myShoppingTabs.jsp"></jsp:include>	

	  
	  
	<div class="row mt-1 pb-3">
		<div class="col border-top">
		<c:forEach items="${CustomerCouponDataList }" var="data">
			<!-- c:if 지우기 -->
		   <div id="card" class="card my-4 shadow-lg">
		    <div class="card-body">
		     	<div id="title" class="row">	
		     		<div id="center" class="col-8">
		                 ${data.couponVo.coupon_name }<br>
			     	  <span id="amount">${data.couponVo.coupon_amount }원</span> <br>
			     	  <span style="font-size: 0.7rem; color: #757575;"><fmt:formatDate value="${data.couponVo.coupon_end_date }" pattern="yyyy.MM.dd"/>까지</span>
		     		</div>
		     		<div id="end" class="col px-0">
						<button class="btn" style="text-align: center; font-size: 3.5em;" onClick='btnClick()'><i class="bi bi-check-circle-fill" style="color: #ff6500;"></i></button>
		     		</div>
		     	</div> 
		  	</div>
		</div>
		<c:choose>
			<c:when test="${data.couponVo.coupon_end_date < data.customerCouponVo.coupon_use_date }">
				*유효기간이 지난 쿠폰입니다.
			</c:when>
		</c:choose>
	</c:forEach>
		
		</div>
	</div>  
	

<jsp:include page="../common/footer.jsp"></jsp:include>		
</div><!-- container-fluid end -->



<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>