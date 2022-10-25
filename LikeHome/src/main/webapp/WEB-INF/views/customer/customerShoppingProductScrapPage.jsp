<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css" />
<style type="text/css">
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/static/pretendard.css");

body {
    font-family: Pretendard;
    color:#404040;
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

.btn-check:active+.btn, .btn-check:checked+.btn, .btn.active, .btn.show, .btn:active{
 background-color: #ff6500;
}

	#sort{
      font-size: 1.1rem;
      font-weight: bold;
    }
	    
	.product-name{
		overflow:hidden;
		text-overflow:ellipsis;
		line-height:1.2em;
		height:1.2em;
		font-size:0.9rem;
		display: inline-block;
		white-space: nowrap;
		width: 150px;
	}
	
	.brand-name{
		font-size: 0.8rem;
		color: #757575;
		font-weight: bold;
	  }
	   
	.rating{
		font-size:0.8rem;
	}
	
	.bi-star-fill{
		color:#ff6500;
	}


	.dropdown-toggle{
		color: #ff6500;
	    background-color: white;
	    border-color: #ff6500;
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
<body>

<div class="container-fluid">

	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/myShoppingTabs.jsp"/>
	
    <div class="row pt-3 border-bottom" id="userInfoBox"
      style="background-color: white;">
      <div class="col">
         <div class="card mb-3 border-0">
            <div class="row g-0">
               <div class="col-4 p-2">
                  <c:choose>
                     <c:when test="${!empty customerInfo.customer_profile_image }">
                        <img
                           src="/uploadFiles/customerIntro/${customerInfo.customer_profile_image }"
                           class="img-fluid rounded-circle">
                     </c:when>
                     <c:otherwise>
                        <img class="img-fluid rounded-circle"
                           src="../resources/img/unprofile.gif">
                     </c:otherwise>
                  </c:choose>
               </div>
               <div class="col-8 pt-3 ps-3">
                  <div class="row">
                     <div class="col fw-bold"
                        style="font-size: 1.1rem; color: #404040">${customerInfo.customer_nick }</div>
                  </div>
                  <div class="row">
                     <div class="col" style="font-size: 0.9rem; color: #757575">
                        <span onclick="followList()"> 팔로워 </span> <span
                           onclick="followList()" id="follow" style="font-weight: bold">
                           ${data.followerCount } </span> <span onclick="followingList()">
                           팔로잉 </span> <span onclick="followingList()" id="following"
                           style="font-weight: bold"> ${data.followingCount } </span>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <c:choose>
                           <c:when test="${!empty followVo}">
                              <button
                                 onclick="doFollw(this,${data.userInfo.customer_no})"
                                 id="followBtn" type="button" class="btn py-1"
                                 style="width: 50%; background-color: white; color: #ff6500; border-color: #ff6500">팔로잉</button>
                           </c:when>
                           <c:otherwise>
                              <button
                                 onclick="doFollw(this,${data.userInfo.customer_no})"
                                 id="followBtn" type="button" class="btn py-1"
                                 style="width: 50%; background-color: #ff6500; color: white; border-color: #ff6500">팔로우</button>
                           </c:otherwise>

                        </c:choose>


                     </div>
                  </div>
               </div>
            </div>
            <div class="row pt-2">
               <div class="col" style="font-size: 0.9rem; color: #404040">
                  ${data.userInfo.customer_intro }</div>
            </div>
         </div>
      </div>
   </div>


      
      <div class="row">
        <div class="col">
          
          <div class="row py-3">
          
          	<div class="col">상품스크랩 <span style="color:#757575">${fn:length(productScrapDataList) }</span></div>
          	<div class="col">
          	 <button class="btn dropdown-toggle py-0" type="button"  data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom"  aria-controls="offcanvasBottom" aria-expanded="false">카테고리</button>
	          	<div class="offcanvas offcanvas-bottom" style="height:auto;" tabindex="-1" id="offcanvasBottom">
				  <div class="offcanvas-header">
				    <h5 class="offcanvas-title" id="offcanvasBottomLabel">카테고리</h5>
				    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				  </div>
				  <div class="offcanvas-body">
				     <ul class="list-group list-group-flush">
	                 	<c:forEach items="${productCategory1List }" var="cat1">
	                    <li class="list-group-item list-group-item-action" data-bs-toggle="offcanvas"  data-bs-target="#cat2" aria-controls="offcanvasBottom">
	                    ${cat1.product_category1_name}</li>
	                 	</c:forEach>
	                 </ul>
				  </div>
				</div>
          	</div>
          </div>
          
          
          <div class="row row-cols-2 g-2">
          	<c:forEach items="${productScrapDataList }" var="data">
	            <article class="col mb-2" onclick="location.href='../product/productDetailPage?product_no=${data.productVo.product_no}'">
	              <div class="row mb-2">
	                <div class="col" style="position:relative">
	                  <i class="text-opacity-50 bi bi-bookmark-fill" style="position: absolute; bottom: 0%; right: 8%; font-size: 1.6rem;color:#ff6500;"></i>
	                  <img class="img-fluid rounded" src="../../uploadFiles/titleImage/${data.productTitleImageVo.title_image_link }" alt="">
	                </div>
	              </div>
	              <div class="row">
	                <div class="col brand-name">${data.vendorVo.vendor_brand_name }</div>
	              </div>
	              <div class="row">
	                <div class="col product-name">${data.productVo.product_name }</div>
	              </div>
	              <div class="row">
	                <div class="col fw-bold money">${data.productVo.product_price }</div>
	              </div>
	              <div class="row">
	                <div class="col rating">
	                  <i class="bi bi-star-fill"></i>
	                  <span>3.7</span>
	                  <span>(123)</span>
	                </div>
	              </div>
           		 </article>
          	</c:forEach>
          </div>
        </div>

      </div>


    </div>



<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>