<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />


<title>나의 주문내역</title>

<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

	body {
		font-family: Pretendard;
		color:#404040;
		
		}

	.o-info{
		font-size:0.9rem;
		font-weight:600;
	}	
    .o-detail{
    	font-size:0.8rem;
    	color:#757575;
    	
    }
		
	.delivery{
		color:#404040;
		font-size:0.9rem;
	}
	
	.deliveryInfo{
		font-size: 0.9rem;
	    color: #757575;
	    text-align: center;
	    margin: 3rem;
	}
		
	.b-name{
		font-size: 0.8rem;
		color:#757575;
		}
		
	.p-name{
		font-size:0.9rem;
		}
		
	.p-price{
		font-size:0.9rem;
		}
    
	.rc{
	     background-color: white;
	     margin-bottom:0.5rem;
	     padding-bottom:0.7rem;
	   }
	   
	 a {text-decoration: none !important;}
	 
	 .btn-sub{
	 	background-color:white;
	 	color:#ff6500;
	 	font-size:0.9rem;
	 	border-color:#ff6500;
	 	}
	 	
	 	.nav{
	 	font-size:0.8rem
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


		.btn-outline-secondary{
			font-size:0.9rem;
		}
		
		.btn-main{
		background-color:#ff6500;
		color:white;
		}
/*네비바*/

		.btn-check:active+.btn, .btn-check:checked+.btn, .btn.active, .btn.show, .btn:active{
		 background-color: #ff6500;
		 }
		 
		 .review-title{
		 	font-weight: 600;
		 }
		 
		 .star-default{
		 	color:#dee2e6;
		 }
		 
		 .star-fill{
		 	color:#ff6500;
		 }
		 
		 .review-box{
		 	width:5rem;
		 	height:5rem;
		 }
		 
		 .review-img{
		 	width: 100%;
		    height: 100%;
		    object-fit: cover;
		 }
		 
		 .reviewplus{
		 	font-size: 3rem;
		    color: #ff6500;
		    border: #ff6500 dashed 0.1rem;
		    text-align: center;
		    width: 100%;
		    height: 100%;
		    font-weight: 100;
		 }
 
</style>
 
 
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

</head>
<body class="bg-light">

<div class="container-fluid">
      
	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/myShoppingTabs.jsp"/>

      <div class="row bg-white"><!--배송진행상황-->
        <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=3'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">전체</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=0'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">결제완료</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=1'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송중</button>
        </div>
         <div class="col px-0 text-center" onclick="location.href='../customer/customerShoppingStatePage?deliveryStatus=2'">
        	<button class="btn btn-outline-secondary rounded-pill py-0 my-1">배송완료</button>
        </div>
      </div>
      <div class="row"><!--필터-->
        <div class="col"></div>
      </div>
      
      <div class="row rc"><!--나의 주문내역 로우-->
        <div class="col">
        	<c:if test="${empty dataList}">
        		<div class="deliveryInfo">
	        		<c:choose>
	        			<c:when test="${deliveryStatus == 0 }">결제완료된 상품이 없습니다.</c:when>
	        			<c:when test="${deliveryStatus == 1 }">배송중인 상품이 없습니다.</c:when>
	        			<c:when test="${deliveryStatus == 2 }">배송완료된 상품이 없습니다.</c:when>
	        		</c:choose>
        		</div>
        	</c:if>
          <c:forEach items="${dataList }" var="data">
          <div class="row rc"><!--나의 주문내역>주문하나-->
            <div class="col">
              <div class="row pt-2">
                <div class="col o-info">
                	<span><fmt:formatDate pattern="yyyy.MM.dd" value="${data.orderVo.order_date }"/></span>
                </div>
                <div class="col-4 text-end"><a href="../order/orderDetailPage?order_no=${data.orderVo.order_no }" class="o-detail">주문상세<i class="bi bi-chevron-right fs"></i></a></div>
              </div>
              <c:forEach items="${data.orderDetailList }" var="orderDetail">
              <div class="row">
                <div class="col">
                    <div class="card my-1">
                      <div class="card-header delivery py-1">
					<c:choose>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 0}">결제완료</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 1}">배송중</c:when>
						<c:when test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">배송완료</c:when>
					</c:choose>
                      </div>
                      <div class="card-body pb-1">
                        <div class="row mb-2">
                          <div class="col-3"><img src="../../uploadFiles/titleImage/${orderDetail.productTitleImageVo.title_image_link }" class="img-fluid rounded" alt="..."></div>
                          <div class="col">
                            <div class="row">
                            	<div class="col b-name">${orderDetail.vendorVo.vendor_brand_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-name">${orderDetail.productVo.product_name }</div>
                            </div>
                            <div class="row">
                            	<div class="col p-price">
                            		<span class="money">${orderDetail.productVo.product_price}</span>
                            	<span class="text-secondary"> | </span>${orderDetail.orderDetailVo.order_detail_quantity }개
                            	</div>
                            </div>
                          </div>
                        </div>
                        <c:if test="${orderDetail.orderDetailVo.order_detail_delivery_status == 2}">
                         <div class="row">
                           <div class="col d-grid"><button class="btn btn-main py-1 mb-2" data-bs-toggle="offcanvas" data-bs-target="#reviewForm" aria-controls="offcanvasRight">리뷰 작성</button></div>
                           <!-- 리뷰작성 offcanvas -->
                           <div class="offcanvas offcanvas-end" tabindex="-1" id="reviewForm" aria-labelledby="offcanvasRightLabel">
							  <div class="offcanvas-header">
							    <h5 class="offcanvas-title" id="offcanvasRightLabel">상품 리뷰 작성</h5>
							    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
							  </div>
							  <div class="offcanvas-body">
							  	<div class="row mb-4">
		                          <div class="col-4"><img src="../../uploadFiles/titleImage/${orderDetail.productTitleImageVo.title_image_link }" class="img-fluid rounded" alt="..."></div>
							  	  <div class="col">
		                            <div class="row">
		                            	<div class="col b-name">${orderDetail.vendorVo.vendor_brand_name }</div>
		                            </div>
		                            <div class="row">
		                            	<div class="col p-name">${orderDetail.productVo.product_name }</div>
		                            </div>
		                            <div class="row">
		                            	<div class="col p-price">
		                            		<span class="money">${orderDetail.productVo.product_price}</span>
		                            	<span class="text-secondary"> | </span>${orderDetail.orderDetailVo.order_detail_quantity }개
		                            	</div>
		                            </div>
		                          </div>
		        				</div>
		        				<div class="row my-4 ">
		        					<div class="col text-center">
										<div class="review-title">상품은 어떠셨나요?</div>											        					
										<div class="fs-1">
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-fill"></i>
											<i class="bi bi-star-fill star-default"></i>
										</div>											        					
		        					</div>
		        				</div>
		        				<div class="row my-2">
		        					<div class="col">
		        						<div class="review-title">사진 첨부(선택)</div>
		        					</div>
		        				</div>
		        				<div class="row row-cols-4">
		        					<div class="col">
		        						<div class="review-box">
			        						<img class="review-img rounded" alt="" src="../resources/review/none(6).jpeg">
		        						</div>
		        					</div>
		        					<div class="col ">
		        						<div class="review-box">
		        							<div class="reviewplus">+</div>
		        						</div>
		        					</div>
		        				</div>
		        				<div class="row mt-4 mb-2">
		        					<div class="col">
		        						<div class="review-title">리뷰 작성</div>
		        					</div>
		        				</div>
		        				<div class="row mt-1 mb-3">
		        					<div class="col">
										  <textarea class="form-control" placeholder="구매하신 상품의 후기를 20자 이상 남겨주시면 다른 구매자들에게도 도움이 됩니다." style="height: 100px;font-size: 0.9rem;"></textarea>
		        					</div>
		        				</div>
		        				<div class="row mb-3">
		        					<div class="col" style="font-size:0.7rem;color:#757575;">
		        						상품과 무관한 사진 및 욕설/비속어가 포함된 리뷰는 고지 없이 삭제될 수 있습니다.<br>
		        						구매하신 상품을 직접 촬영한 사진만 리뷰 등록 및 포인트 지급이 가능합니다.<br>
		        						상품 반품/취소 시, 리뷰 삭제 및 지급 포인트가 회수됩니다.<br>
		        					</div>
		        				</div>
		        				<div class="row">
		        					<div class="col d-grid">
		        						<button class="btn btn-main">등록</button>
		        					</div>
		        				</div>
							  </div>
							</div>
                         </div>
                        </c:if>
                      </div>
                    </div>
                </div>
              </div>
            </c:forEach>
            </div>
          </div>
        </c:forEach>
        </div>
      </div>
   	
   	<jsp:include page="../common/footer.jsp"></jsp:include>		
    
    </div>
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  </body>
</html>