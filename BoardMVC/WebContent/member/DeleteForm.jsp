<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function checkValue() {
		if (!document.deleteform.password.value) {
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>

<!-- Section -->
<section class="awe-section">
	<div class="container">

		<!-- page-title -->
		<div class="page-title pb-40">
			<h2 class="page-title__title">Withdrawal</h2>
			<p class="page-title__text">delete my account from your website</p>
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
				<form name="deleteform" method="post" action="MemberDeleteAction.do"
					onsubmit="return checkValue()">
					<table class="table table-borderless">
						<tbody>
							<tr>
								<td>Password</td>
								<td><input type="password" name="password" maxlength="50"></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><input type="submit"
									value="Request the member secession"
									class="md-btn md-btn--primary md-btn--block" /></td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>