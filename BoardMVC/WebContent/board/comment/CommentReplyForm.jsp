<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 답변</title>
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
	margin: 0 auto 0 auto;
	text-align: center;
}

#commentReplyForm {
	text-align: center;
}
</style>

<script type="text/javascript">
	var httpRequest = null;

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

	function checkValue() {
		var form = document.forms[0];

		var comment_num = "${comment.comment_num}";
		var comment_board = "${comment.comment_board}";
		var comment_id = "${sessionScope.sessionID}";
		var comment_content = form.comment_content.value

		if (!comment_content) {
			alert("내용을 입력하세요");
			return false;
		} else {
			var param = "comment_num=" + comment_num + "&comment_board="
					+ comment_board + "&comment_id=" + comment_id
					+ "&comment_content=" + comment_content;

			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "CommentReplyAction.co", true);
			httpRequest.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
		}
	}

	function checkFunc() {
		if (httpRequest.readyState == 4) {
			var resultText = httpRequest.responseText;
			if (resultText == 1) {
				if (opener != null) {
					window.opener.document.location.reload();
					opener.replyForm = null;
					self.close();
				}
			}
		}
	}
</script>

</head>
<body>
	<div class="page-wrap" id="root">
		<div class="wil-content">
			<section class="awe-section">
			<div class="container">
				<br> <b><font size="5" color="gray">댓글 답변</font></b>
				<hr size="1" width="550">
				<br>

				<div id="commentReplyForm">
					<form name="replyInfo" target="parentForm">
						<textarea rows="7" cols="70" name="comment_content"></textarea>
						<br> <br> <input type="button" value="등록"
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