<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">


<title>Insert title here</title>
 <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		}  
      
	section{
		background-color: white;
        margin-bottom:0.3rem;
	}
	
	.b-name{
		font-size: 0.9rem;
		color:#757575;
		}

	 a {
	 	text-decoration: none;
	 	color:#404040;
	 	}
	
	.btn-outline{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	padding:0.2rem 0;
	 	}
	 	
	 	
	 .title{
	 	font-weight: 600;
		padding-block: 0.5rem;	
		font-size:0.9rem; 
	 }
	 
	 .subtitle{
	 	font-size:0.9rem;
	 	color:#757575;
	 	margin-bottom:0.6rem;
	 }
	 
	header {
    font-family: pretendard;
	}
	
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
	
	.content{
		font-size:0.9rem;
	}
	
	.orderinfo{
		padding-top: 0.5rem;
	    padding-bottom: 0.3rem;
	}
	
	.total{
		font-size: 1rem;
	    color: #ff6500;
	    font-weight: 600;
	}

	 
    </style>
    
</head>


<script type="text/javascript">
	window.addEventListener("DOMContentLoaded", function (){
		changeMoneyUnit();
	});
	
	//원 표시 자동변환 script
	function changeMoneyUnit() {
	    var moneyValue = document.querySelectorAll(".money");
	    const moneyUnit = "원"
	    var regex = /[^0-9]/g;
	    for(i of moneyValue){
	        result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	        result = result.concat(moneyUnit);
	        i.innerText = result;
	    };
	};


</script>
<body class="bg-light">

 <div class="container-fluid">
	
	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>
	
    
    <section class="row orderinfo content"><!--주문번호 주문 일자-->
      <div class="col">
      	<div>주문번호 <span style="font-weight: 600;">${orderVo.order_code }</span></div>
      </div>
	  <div class="col-3 text-end">
	 	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${orderVo.order_date }"/></span>
	  </div>      	
    </section>
    <section class="row"><!--주문내역(상품여러개)-->
      <div class="col">
      	<div class="row">
      		<div class="col title">주문상품정보</div>
      	</div>
      
        <c:forEach items="${dataList}" var="data">
        <div class="row py-2 content">
          <div class="col-3">
         	<img class="img-fluid rounded" src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }">
          </div>
          <div class="col">
            <div class="row">
              <div class="col b-name">${data.vendorVo.vendor_brand_name }</div>
            </div>
            <div class="row">
              <div class="col p-name">
                <a href="../product/productDetailPage?product_no=${data.productVo.product_no }">${data.productVo.product_name}</a>
              </div>
            </div>
            <div class="row">
              <div class="col">
              	<span class="money fw-bold">${data.orderDetailVo.order_detail_quote_price}</span>
              	<span class="text-secondary"> | </span>
              	<span>${data.orderDetailVo.order_detail_quantity}개</span>
              </div>
            </div>
            <c:if test="${data.orderDetailVo.order_detail_delivery_status == 2 }">
	            <div class="row">
	              <div class="col my-2 d-grid">
	                <button class="btn btn-outline">리뷰쓰기</button>
	              </div>
	            </div>
            </c:if>
          </div>
        </div>
      </c:forEach>
      </div>
    </section>
    <section class="row"><!--배송지 정보-->
      <div class="col">
        <div class="row">
          <div class="col title">배송지 정보</div>
        </div>
        <div class="row">
          <div class="col content">
            <div class="row">
             <div class="col-3 subtitle">받는사람</div> 
             <div class="col">${orderVo.order_receiver_name }</div> 
            </div>
            <div class="row">
              <div class="col-3 subtitle">연락처</div> 
              <div class="col">${orderVo.order_receiver_phone }</div> 
            </div>
            <div class="row">
              <div class="col-3 subtitle">주소</div> 
              <div class="col">${orderVo.order_receiver_address1}</div> 
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <c:set var="productSum" value="0"></c:set>
    <c:set var="deliverySum" value="0"></c:set>
      
   	<c:forEach items="${dataList }" var="data">
   		<c:set var = "productSum" value="${productSum + (data.orderDetailVo.order_detail_quote_price * data.orderDetailVo.order_detail_quantity) }"></c:set>
   		<c:set var = "deliverySum" value="${deliverySum + data.productVo.product_delivery_fee }"></c:set>
   	</c:forEach>
   
   	<c:set var="totalSum" value="${productSum + deliverySum }"></c:set>
	
    
    
    
    <section class="row pb-3"><!--결제 정보-->
      <div class="col">
        <div class="row">
          <div class="col title">결제정보</div>
        </div>
        <div class="row content">
          <div class="col">
            <div class="row">
              <div class="col subtitle">상품금액</div>
              <div class="col text-end"><span id="productAmt" class="money"><c:out value="${productSum }"></c:out></span></div>
            </div>
            <div class="row">
              <div class="col subtitle">선불배송비</div>
              <div class="col text-end"><span id="deliveryAmt" class="money"><c:out value="${deliverySum }"></c:out></span></div>
            </div>
            <div class="row">
              <div class="col subtitle">사용 포인트</div>
              <div class="col text-end">000P</div>
            </div>
            <div class="row">
              <div class="col subtitle">쿠폰 할인가</div>
              <div class="col text-end"><span class="money">00000</span></div>
            </div>
            <div class="row">
              <div class="col subtitle">결제 방법</div>
              <div class="col text-end">카카오페이</div>
            </div>
            <div class="row">
              <div class="col subtitle" style="font-size:1rem">결제 금액</div>
              <div class="col text-end total"><span class="money">${orderVo.order_total_amount }</span></div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"></jsp:include>		
    

   </div><!-- container-fluid end -->


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> 

</body>
</html>