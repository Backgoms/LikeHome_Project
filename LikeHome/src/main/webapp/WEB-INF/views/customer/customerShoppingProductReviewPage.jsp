<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
}


.btn-check:active+.btn, .btn-check:checked+.btn, .btn.active, .btn.show, .btn:active{
 background-color: #ff6500;
}

</style>

</head>
<body>
<div class="container-fluid">

	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp"/>
	<jsp:include page="/WEB-INF/views/common/myShoppingTabs.jsp"/>

	<div class="row">
		<div class="col">
			<h5>마이페이지 - 나의 쇼핑 - 리뷰관리 페이지 입니다</h5>
		</div>
	</div>
</div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>