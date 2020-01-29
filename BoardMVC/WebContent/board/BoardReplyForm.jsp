<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="awe-section">
	<div class="container">
		<div class="page-title pb-40">
			<h2 class="page-title__title">Board</h2>
			<p class="page-title__text">write your opinion</p>
			<div class="page-title__divider"></div>
		</div>
	</div>
</section>

<section class="awe-section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">

				<div class="table-responsive">
					<form method="post" action="BoardReplyAction.bo?page=${pageNum}"
						name="boardForm">
						<input type="hidden" name="board_id"
							value="${sessionScope.sessionID}"> <input type="hidden"
							name="board_num" value="${board.board_num}" /> <input
							type="hidden" name="board_re_ref" value="${board.board_re_ref}" />

						<table class="table">
							<tbody>
								<tr>
									<td id="title">작성자</td>
									<td>${sessionScope.sessionID}</td>
								</tr>
								<tr>
									<td id="title">제 목</td>
									<td><input name="board_subject" type="text" size="70"
										maxlength="100" value="" /></td>
								</tr>
								<tr>
									<td id="title">내 용</td>
									<td><textarea name="board_content" cols="72" rows="18"></textarea>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<div style="float: right;">
											<input type="submit" value="등록"
												class="md-btn md-btn--primary md-btn--sm"> <input
												type="button" value="목록" onclick="javascript:history.go(-1)"
												class="md-btn md-btn--primary md-btn--sm">
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>