<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function changeForm(val) {
		if (val == "0") {
			location.href = "MemberModifyFormAction.do";
		} else if (val == "1") {
			location.href = "DeleteForm.do";
		}
	}
</script>

<!-- Section -->
<section class="awe-section">
	<div class="container">

		<!-- page-title -->
		<div class="page-title pb-40">
			<h2 class="page-title__title">My Information</h2>
			<p class="page-title__text">Sed ante nisl, fermentum et facilisis
				in</p>
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
				<c:set var="member" value="${requestScope.memberInfo}" />

				<table class="table table-borderless">
					<tbody>
						<tr>
							<td id="title">아이디</td>
							<td>${member.id}</td>
						</tr>

						<tr>
							<td id="title">비밀번호</td>
							<td>${member.password}</td>
						</tr>

						<tr>
							<td id="title">이름</td>
							<td>${member.name}</td>
						</tr>

						<tr>
							<td id="title">성별</td>
							<td>${member.gender}</td>
						</tr>

						<tr>
							<td id="title">생일</td>
							<td>${member.birthyy}년&nbsp;${member.birthmm}월&nbsp;${member.birthdd}일</td>
						</tr>

						<tr>
							<td id="title">이메일</td>
							<td>${member.mail1}@${member.mail2}</td>
						</tr>

						<tr>
							<td id="title">휴대전화</td>
							<td>${member.phone}</td>
						</tr>
						<tr>
							<td id="title">주소</td>
							<td>${member.address}</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
							<div style="float:right;">
							
							<input type="button" value="회원정보 변경"
								onclick="changeForm(0)"
								class="md-btn md-btn--success md-btn--lg"><input type="button" value="회원탈퇴"
								onclick="changeForm(1)"
								class="md-btn md-btn--primary md-btn--lg"></div></td>
						</tr>
					</tfoot>
				</table>


				<br> <br> <br>
			</div>
		</div>
	</div>
</section>