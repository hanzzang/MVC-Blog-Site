<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function init() {
		setComboValue("${member.mail2}");
	}

	function setComboValue(val) {
		var selectMail = document.getElementById('mail2');
		for (i = 0, j = selectMail.length; i < j; i++) {
			if (selectMail.options[i].value == val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}

	function checkValue() {
		if (!document.userInfo.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>

<body onload="init()">

	<section class="awe-section">
		<div class="container">
			<div class="page-title pb-40">
				<h2 class="page-title__title">My Information</h2>
				<p class="page-title__text">Sed ante nisl, fermentum et
					facilisis in</p>
				<div class="page-title__divider"></div>
			</div>
		</div>
	</section>


	<section class="awe-section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<c:set var="member" value="${requestScope.memberInfo}" />

					<form method="post" action="MemberModifyAction.do" name="userInfo"
						onsubmit="return checkValue()">

						<table class="table table-borderless">
							<tbody>
								<tr>
									<td id="title">아이디</td>
									<td id="title">${member.id}</td>
								</tr>
								<tr>
									<td id="title">비밀번호</td>
									<td><input type="password" name="password" maxlength="50"
										value="${member.password}"></td>
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
									<td>${member.birthyy}년&nbsp;${member.birthmm}월&nbsp;${member.birthdd}일
									</td>
								</tr>

								<tr>
									<td id="title">이메일</td>
									<td><input type="text" name="mail1" maxlength="50"
										value="${member.mail1}"><select name="mail2"
										id="mail2">
											<option value="naver.com">naver.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
									</select></td>
								</tr>

								<tr>
									<td id="title">휴대전화</td>
									<td><input type="text" name="phone"
										value="${member.phone}" /></td>
								</tr>
								<tr>
									<td id="title">주소</td>
									<td><input type="text" size="50" name="address"
										value="${member.address}" /></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<div style="float: right;">
											<input type="button" value="취소"
												class="md-btn md-btn--primary md-btn--lg"
												onclick="javascript:window.location='MainForm.do'">
											<input type="submit" value="수정"
												class="md-btn md-btn--success md-btn--lg" />
										</div>
									</td>
								</tr>
							</tfoot>

						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>