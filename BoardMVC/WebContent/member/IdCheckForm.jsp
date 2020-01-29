
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
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
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: hidden;
}
</style>

<script type="text/javascript">
	
		var httpRequest = null;
		
		// httpRequest 객체 생성
		function getXMLHttpRequest(){
			var httpRequest = null;
		
			if(window.ActiveXObject){
				try{
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
				} catch(e) {
					try{
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e2) { httpRequest = null; }
				}
			}
			else if(window.XMLHttpRequest){
				httpRequest = new window.XMLHttpRequest();
			}
			return httpRequest;	
		}
		
		
		// 회원가입창의 아이디 입력란의 값을 가져온다.
		function pValue(){
			document.getElementById("userId").value = opener.document.userInfo.id.value;
		}
		
		// 아이디 중복체크
		function idCheck(){

			var id = document.getElementById("userId").value;

			if (!id) {
				alert("아이디를 입력하지 않았습니다.");
				return false;
			} 
			else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
				alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
				return false;
			}
			else
			{
				var param="id="+id
				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = callback;
				httpRequest.open("POST", "MemberIdCheckAction.do", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
				httpRequest.send(param);
			}
		}
		
		function callback(){
			if(httpRequest.readyState == 4){
				// 결과값을 가져온다.
				var resultText = httpRequest.responseText;
				if(resultText == 0){
					alert("사용할수없는 아이디입니다.");
					document.getElementById("cancelBtn").style.visibility='visible';
					document.getElementById("useBtn").style.visibility='hidden';
					document.getElementById("msg").innerHTML ="";
				} 
				else if(resultText == 1){ 
					document.getElementById("cancelBtn").style.visibility='hidden';
					document.getElementById("useBtn").style.visibility='visible';
					document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
				}
			}
		}
		
		// 사용하기 클릭 시 부모창으로 값 전달 
		function sendCheckValue(){
			// 중복체크 결과인 idCheck 값을 전달한다.
			opener.document.userInfo.idDuplication.value ="idCheck";
			// 회원가입 화면의 ID입력란에 값을 전달
			opener.document.userInfo.id.value = document.getElementById("userId").value;
			
			if (opener != null) {
            	opener.chkForm = null;
            	self.close();
			}	
		}	
	</script>

</head>
<body onload="pValue()">
	<div class="page-wrap" id="root">
		<div class="wil-content">
			<section class="awe-section">
				<div class="container">
					<b><font size="6" color="gray">아이디 중복확인</font></b><br> <br> <br>
					<div id="chk">
						<form id="checkForm">
							<div class="form-item">
								<input class="form-control" type="text" name="idinput"
									id="userId">
							</div>
							<div class="form-item">
								<input type="button" value="중복확인"
									onclick="idCheck()" class="md-btn md-btn--primary md-btn--block">
							</div>
						</form>
						<div id="msg"></div>
						<br>
						<div class="form-item form-item--half">
							<input id="cancelBtn" type="button" value="취소"
								onclick="window.close()"
								class="md-btn md-btn--success md-btn--lg"> <input
								id="useBtn" type="button" value="사용하기"
								onclick="sendCheckValue()"
								class="md-btn md-btn--success md-btn--lg">
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 
	<div id="wrap">
		<br> <b><font size="5" color="gray">아이디 중복 확인</font></b>
		<hr size="1" width="490">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idinput" id="userId"> <input
					type="button" value="중복확인" onclick="idCheck()" class="btn btn-sm">
			</form>
			<div id="msg"></div>
			<br> <input id="cancelBtn" type="button" value="취소"
				onclick="window.close()" class="btn btn-warning"> <input
				id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()"
				class="btn btn-success">
		</div>
	</div>
 -->
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