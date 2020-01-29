
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkValue() {
		var form = document.userInfo;

		if (!form.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}

		if (!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (form.password.value != form.passwordcheck.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

		if (!form.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}

		if (!form.birthyy.value) {
			alert("년도를 입력하세요.");
			return false;
		}

		if (isNaN(form.birthyy.value)) {
			alert("년도는 숫자만 입력가능합니다.");
			return false;
		}

		if (form.birthmm.value == "00") {
			alert("월을 선택하세요.");
			return false;
		}

		if (!form.birthdd.value) {
			alert("날짜를 입력하세요.");
			return false;
		}

		if (isNaN(form.birthdd.value)) {
			alert("날짜는 숫자만 입력가능합니다.");
			return false;
		}

		if (!form.mail1.value) {
			alert("메일 주소를 입력하세요.");
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

		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
	}

	function goFirstForm() {
		location.href = "MainForm.do";
	}

	function openIdChk() {

		window.name = "parentForm";
		window.open("member/IdCheckForm.jsp", "chkForm",
				"width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
	}

	function inputIdChk() {
		document.userInfo.idDuplication.value = "idUncheck";
	}
</script>


<!-- Section -->
<section class="awe-section">
	<div class="container">

		<!-- page-title -->
		<div class="page-title pb-40">
			<h2 class="page-title__title">Join</h2>
			<p class="page-title__text">please sign up</p>
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
				<div class="table-responsive">
					<form method="post" action="MemberJoinAction.do" name="userInfo"
						onsubmit="return checkValue()">
						<table class="table table-borderless">
							<tr>
								<td id="title">아이디</td>
								<td><input type="text" name="id" maxlength="50"
									onkeydown="inputIdChk()"></td>
								<td><input type="button" value="중복확인" onclick="openIdChk()"
									class="md-btn md-btn--primary md-btn--lg"> <input
									type="hidden" name="idDuplication" value="idUncheck"></td>
							</tr>

							<tr>
								<td id="title">비밀번호</td>
								<td colspan="2"><input type="password" name="password"
									maxlength="50"></td>
							</tr>

							<tr>
								<td id="title">비밀번호 확인</td>
								<td colspan="2"><input type="password" name="passwordcheck"
									maxlength="50"></td>
							</tr>

							<tr>
								<td id="title">이름</td>
								<td colspan="2"><input type="text" name="name"
									maxlength="50"></td>
							</tr>

							<tr>
								<td id="title">성별</td>
								<td colspan="2"><input type="radio" name="gender" value="남"
									checked>남 <input type="radio" name="gender" value="여">여</td>
							</tr>

							<tr>
								<td id="title">생일</td>
								<td colspan="2"><input type="text" name="birthyy"
									maxlength="4" placeholder="년(4자)"><select
									name="birthmm">
										<option value="00">월</option>
										<option value="01">1</option>
										<option value="02">2</option>
										<option value="03">3</option>
										<option value="04">4</option>
										<option value="05">5</option>
										<option value="06">6</option>
										<option value="07">7</option>
										<option value="08">8</option>
										<option value="09">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select><input type="text" name="birthdd" maxlength="2" placeholder="일"></td>
							</tr>

							<tr>
								<td id="title">이메일</td>
								<td colspan="2"><input type="text" name="mail1"
									maxlength="50" placeholder="email" size="3"> <select
									name="mail2">
										<option>naver.com</option>
										<option>daum.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
								</select></td>
							</tr>

							<tr>
								<td id="title">휴대전화</td>
								<td colspan="2"><input type="text" name="phone" /></td>
							</tr>
							<tr>
								<td id="title">주소</td>
								<td colspan="2"><input type="text" size="50" name="address" /></td>
							</tr>
							<tr>
								<td colspan="3"><input type="submit" value="Join"
									class="md-btn md-btn--primary md-btn--block" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End / Section -->
<!-- 
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<div class="table-responsive">
				<form method="post" action="MemberJoinAction.do" name="userInfo" onsubmit="return checkValue()">
					<table class="table">
						<tr>
							<td id="title">아이디</td>
							<td><input type="text" name="id" maxlength="50" onkeydown="inputIdChk()"> 
							<input type="button" value="중복확인" onclick="openIdChk()" class="btn btn-sm"> 
							<input type="hidden" name="idDuplication" value="idUncheck"></td>
						</tr>

						<tr>
							<td id="title">비밀번호</td>
							<td><input type="password" name="password" maxlength="50">
							</td>
						</tr>

						<tr>
							<td id="title">비밀번호 확인</td>
							<td><input type="password" name="passwordcheck"
								maxlength="50"></td>
						</tr>

						<tr>
							<td id="title">이름</td>
							<td><input type="text" name="name" maxlength="50"></td>
						</tr>

						<tr>
							<td id="title">성별</td>
							<td><input type="radio" name="gender" value="남" checked>남
								<input type="radio" name="gender" value="여">여</td>
						</tr>

						<tr>
							<td id="title">생일</td>
							<td><input type="text" name="birthyy" maxlength="4"
								placeholder="년(4자)" size="6"> <select name="birthmm">
									<option value="00">월</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
								size="4"></td>
						</tr>

						<tr>
							<td id="title">이메일</td>
							<td><input type="text" name="mail1" maxlength="50">@
								<select name="mail2">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>nate.com</option>
							</select></td>
						</tr>

						<tr>
							<td id="title">휴대전화</td>
							<td><input type="text" name="phone" /></td>
						</tr>
						<tr>
							<td id="title">주소</td>
							<td><input type="text" size="50" name="address" /></td>
						</tr>
					</table>
					<br> <input type="submit" value="Join" class="btn btn-lg btn-primary btn-block" />
				</form>
			</div>
		</div>
	</div>
</div> -->