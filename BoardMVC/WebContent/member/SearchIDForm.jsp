<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 화면</title>
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- Fonts-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/fonts/fontawesome/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/fonts/pe-icon/pe-icon.css">
<!-- Vendors-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendors/bootstrap/grid.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendors/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendors/swiper/swiper.css">
<!-- App & fonts-->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700|Open+Sans:400,700">
<link rel="stylesheet" type="text/css" id="app-stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<style type="text/css">
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

th, td {
	margin-right: auto;
	padding: 15;
}
</style>

<script type="text/javascript">
	function checkValue() {
		var form = document.searchidform;

		if (!form.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!form.phone.value) {
			alert("전화번호를 입력하세요.");
			return false;
		}

		if (isNaN(form.phone.value)) {
			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
			return false;
		}
	}
</script>

</head>
<body>
	<div class="page-wrap" id="root">
		<!-- Content-->
		<div class="wil-content">

			<!-- Section -->
			<section class="awe-section">
				<div class="container">
					<b><font size="6" color="gray">아이디
							찾기</font></b> <br> <br> <br>

					<form name="searchidform" method="post"
						action="MemberSearchIDAction.do" onsubmit="return checkValue()">
						<div class="form-item form-item--half">
							<input class="form-control" type="text" name="name"
								placeholder="name" required autofocus />
						</div>
						<div class="form-item form-item--half">
							<input class="form-control" type="text" name="phone"
								placeholder="phone" required />
						</div>
						<div class="form-item">
							<input type="submit" value="찾기"
								class="md-btn md-btn--primary md-btn--lg" /> <input
								type="button" value="취소" onclick="self.close()"
								class="md-btn md-btn--primary md-btn--lg">
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/imagesloaded/imagesloaded.pkgd.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/isotope-layout/isotope.pkgd.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/jquery-one-page/jquery.nav.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/jquery.easing/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/jquery.matchHeight/jquery.matchHeight.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/magnific-popup/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/masonry-layout/masonry.pkgd.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/jquery.waypoints/jquery.waypoints.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/swiper/swiper.jquery.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/menu/menu.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/vendors/typed/typed.min.js"></script>
	<!-- App-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>