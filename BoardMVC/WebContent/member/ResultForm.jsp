<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="msg" value="${sessionScope.msg}" scope="session" />
<c:set var="searchID" value="${sessionScope.searchID}" scope="session" />
<c:set var="searchPW_id" value="${sessionScope.searchPW_id}"
	scope="session" />

<section class="awe-section">
	<div class="container">
		<div class="page-title pb-40">
			<c:choose>
				<c:when test="${msg!=null && msg=='0'}">
					<h1 class="page-title__title">
						회원정보가 수정되었습니다.
						</h1>
				<c:remove var="msg" scope="session"></c:remove>
						<br> <br>
						<input type="button" value="메인으로" class="md-btn md-btn--primary md-btn--lg"
							onclick="javascript:window.location='MainForm.do'" />
					</c:when>
					<c:when test="${msg!=null && msg=='1'}">
						<h1 class="page-title__title">회원가입을 축하합니다.</h1>
						<c:remove var="msg" scope="session"></c:remove>
						<br>
						<br>
						<input type="button" value="메인으로" class="md-btn md-btn--primary md-btn--lg"
						onclick="javascript:window.location='MainForm.do'" />
					</c:when>
					<c:when test="${msg!=null && msg=='2'}">
						<h1 class="page-title__title">아이디는 ${searchID} 입니다.</h1>
						<c:remove var="searchID" scope="session"></c:remove>
						<br>
						<br>
						<input type="button" value="확인" class="md-btn md-btn--primary md-btn--lg"
						onclick="self.close()" />
					</c:when>
					<c:when test="${msg!=null && msg=='3'}">
						<h1 class="page-title__title">조회된 아이디가 없습니다.</h1>
						<c:remove var="searchID" scope="session"></c:remove>
						<br>
						<br>
						<input type="button" value="확인" class="md-btn md-btn--primary md-btn--lg"
						onclick="self.close()" />
					</c:when>
					<c:when test="${msg!=null && msg=='4'}">
						<h1 class="page-title__title">조회된 비밀번호가 없습니다.</h1>
						<c:remove var="searchPW_id" scope="session"></c:remove>
						<br>
						<br>
						<input type="button" value="확인" class="md-btn md-btn--primary md-btn--lg"
						onclick="self.close()" />
					</c:when>
					<c:when test="${msg!=null && msg=='4'}">
						<h1 class="page-title__title">완료되었습니다. 로그인을 해주세요.</h1>
						<c:remove var="searchPW_id" scope="session"></c:remove>
						<br>
						<br>
						<input type="button" value="확인" class="md-btn md-btn--primary md-btn--lg"
						onclick="self.close()" />
					</c:when>
					<c:otherwise>
						<h1 class="page-title__title">회원정보가 삭제되었습니다.</h1>
						<br>
						<br>
						<input type="button" value="메인으로" class="md-btn md-btn--primary md-btn--lg"
						onclick="javascript:window.location='MainForm.do'" />
					</c:otherwise>
				</c:choose>	
			<div class="page-title__divider"></div>
		</div>
	</div>
</section>