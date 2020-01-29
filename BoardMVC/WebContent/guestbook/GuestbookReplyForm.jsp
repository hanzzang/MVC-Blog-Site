<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>방명록 답변</title>
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

#writeReplyForm {
	text-align: center;
}
</style>

<script type="text/javascript">
	function checkValue() {
		var form = document.forms[0];

		if (!form.guestbook_id.value) {
			alert("이름을 입력하세요.");
			return false;
		} else if (!form.guestbook_password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		} else if (!form.guestbook_content.value) {
			alert("내용을 입력하세요.");
			return false;
		} else {
			form.target = opener.name;
			form.method = "post";
			form.action = "GuestbookReplyAction.ge?page=${pageNum}";
			form.submit();

			if (opener != null) {
				opener.rForm = null;
				self.close();
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
					<br> <b><font size="5" color="gray">답글</font></b>
					<hr size="1" width="550">
					<br>

					<div class="table-responsive">
						<div id="writeReplyForm">
							<form name="replyInfo" target="replyForm">
								<!-- 부모 방명록의 정보를 같이 전송한다. -->
								<input type="hidden" name="guestbook_no"
									value="${guestbook.guestbook_no}" /> <input type="hidden"
									name="guestbook_group" value="${guestbook.guestbook_group}" />

								<table width="550">
									<tbody>
										<tr>
											<td>이름 :</td>
											<c:if test="${sessionScope.sessionID!=null}">
												<td>${sessionScope.sessionID}<input type="hidden"
													name="guestbook_id" value="${sessionScope.sessionID}">
												</td>
											</c:if>
											<c:if test="${sessionScope.sessionID==null}">
												<td><input type="text" name="guestbook_id"></td>
											</c:if>

											<td>비밀번호 :</td>
											<td><input type="password" name="guestbook_password"></td>
										</tr>
										<tr>
											<td colspan="4">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="4"><textarea rows="7" cols="70"
													name="guestbook_content"></textarea></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="4"><div style="float: right;">
													<input type="button" value="등록" id="replyInsert"
														onclick="checkValue()"
														class="md-btn md-btn--primary md-btn--sm"> <input
														type="button" value="창닫기" onclick="window.close()"
														class="md-btn md-btn--primary md-btn--sm">
												</div></td>
										</tr>
									</tfoot>
								</table>
							</form>
						</div>
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