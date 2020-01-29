<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function goSearchIDForm() {
		location.href = "SearchIDForm.do";
	}

	function goSearchPWForm() {
		location.href = "SearchPWForm.do";
	}

	function goMainForm() {
		location.href = "MainForm.do";
	}

	function openSearchIDForm() {
		window.name = "parentForm";
		window
				.open("member/SearchIDForm.jsp", "아이디 찾기",
						"width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
	}

	function openSearchPWForm() {
		window.name = "parentForm";
		window
				.open("member/SearchPWForm.jsp", "비밀번호 찾기",
						"width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
	}
</script>

<!-- Section -->
<section class="awe-section">
	<div class="container">

		<!-- page-title -->
		<div class="page-title pb-40">
			<h2 class="page-title__title">Find a member</h2>
			<p class="page-title__text">find my account from your website</p>
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
				<input type="button" onclick="openSearchIDForm()" value="아이디 찾기" class="md-btn md-btn--success md-btn--block">
				<br><br>
				<input type="button" onclick="openSearchPWForm()" value="비밀번호 찾기" class="md-btn md-btn--info md-btn--block">
			</div>
		</div>
	</div>
</section>