<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	function goFirstForm() {
		location.href = "MainForm.do";
	}
</script>
<!-- Section -->
<section class="awe-section">
	<div class="container">

		<!-- page-title -->
		<div class="page-title pb-40">
			<h2 class="page-title__title">Login</h2>
			<p class="page-title__text">please sign in</p>
			<div class="page-title__divider"></div>
		</div>
		<!-- End / page-title -->

	</div>
</section>
<!-- End / Section -->
<!-- Section -->
<section class="awe-section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="form-wrapper">
					<form class="form-signin" name="loginInfo" method="post"
						action="MemberLoginAction.do" onsubmit="return checkValue()">
						<div class="form-item form-item--half">
							<input class="form-control" type="text" name="id"
								placeholder="Id" required autofocus />
						</div>
						<div class="form-item form-item--half">
							<input class="form-control" type="password" name="password"
								placeholder="Password" required />
						</div>
						<div class="form-item">
							<button class="md-btn md-btn--primary md-btn--block" type="submit"
								>Sign in</button>
						</div>
					</form>
					<c:set var="failMessage" value="${requestScope.fail}" />
					<c:if test="${failMessage!=null}">
						<c:choose>
							<c:when test="${failMessage=='0'}">
								<br>
								<font color='red' size='5'>비밀번호를 확인해 주세요.</font>
							</c:when>
							<c:otherwise>
								<br>
								<font color='red' size='5'>아이디를 확인해 주세요.</font>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End / Section -->
<%-- 
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<form class="form-signin" name="loginInfo" method="post"
				action="MemberLoginAction.do" onsubmit="return checkValue()">
				<label for="inputId" class="sr-only">Id</label> <input type="text"
					name="id" class="form-control" placeholder="Id" required autofocus>
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" name="password" class="form-control"
					placeholder="Password" required>
				<div class="checkbox">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
					in</button>
			</form>

			<c:set var="failMessage" value="${requestScope.fail}" />
			<c:if test="${failMessage!=null}">
				<c:choose>
					<c:when test="${failMessage=='0'}">
						<br>
						<font color='red' size='5'>비밀번호를 확인해 주세요.</font>
					</c:when>
					<c:otherwise>
						<br>
						<font color='red' size='5'>아이디를 확인해 주세요.</font>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>


	</div>
</div> --%>