<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>방명록 삭제</title>
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
	width: 550px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#deleteReplyForm {
	text-align: center;
}
</style>

<script type="text/javascript">
	var httpRequest = null;

	// httpRequest 객체 생성
	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	// 비밀번호 미입력시 경고창
	function checkValue() {

		var form = document.forms[0];
		var num = form.guestbook_no.value;
		var pw = form.guestbook_password.value;

		if (!form.guestbook_password.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		} else // 비밀번호 입력시 Ajax를 이용해 삭제시도
		{
			var param = "num=" + num + "&pw=" + pw;

			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "GuestbookDeleteAction.ge", true);
			httpRequest.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			httpRequest.send(param);
		}
	}

	function checkFunc() {
		if (httpRequest.readyState == 4) {
			// 결과값을 가져온다.
			var resultText = httpRequest.responseText;
			if (resultText == 0) {
				alert("비밀번호가 틀립니다.");
			} else { // 비밀번호 일치시 삭제후 창을 닫는다.
				if (opener != null) {
					// 방명록(부모창) 새로고침
					window.opener.document.location.reload();
					opener.delForm = null;
					self.close();
				}
			}
		}
	}
</script>

</head>
<body>
<body>
	<div class="page-wrap" id="root">
		<div class="wil-content">
			<section class="awe-section">
				<div class="container">
					<br> <b><font size="5" color="gray">삭제</font></b>
					<hr size="1" width="550">
					<br>

					<div id="deleteReplyForm">
						<form name="delGuestbook" target="parentForm">
							<input type="hidden" name="guestbook_no"
								value="${requestScope.guestbook_no}" /> 비밀번호 : <input
								type="password" name="guestbook_password" maxlength="50">
							<br> <br> <br> <input type="button" value="삭제"
								onclick="checkValue()" class="md-btn md-btn--primary md-btn--sm"> <input
								type="button" value="창닫기" onclick="window.close()"
								class="md-btn md-btn--primary md-btn--sm">
						</form>
					</div>
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