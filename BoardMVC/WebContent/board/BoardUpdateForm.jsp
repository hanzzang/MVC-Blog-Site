<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">
	function changeView() {
		location.href = 'BoardListAction.bo?page=${pageNum}';
	}
</script>


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
					<form method="post" action="BoardUpdateAction.bo?page=${pageNum}"
						name="boardForm" enctype="multipart/form-data">
						<input type="hidden" name="board_num" value="${board.board_num}" />
						<input type="hidden" name="existing_file"
							value="${board.board_file}" />
						<table class="table">
							<tbody>
								<tr>
									<td id="title">작성자</td>
									<td>${board.board_id}</td>
								</tr>
								<tr>
									<td id="title">제 목</td>
									<td><input name="board_subject" type="text" size="70"
										maxlength="100" value="${board.board_subject}" /></td>
								</tr>
								<tr>
									<td id="title">내 용</td>
									<td><textarea name="board_content" cols="72" rows="18">${board.board_content}</textarea>
									</td>
								</tr>
								<c:if test="${board.board_parent==0}">
									<tr>
										<td id="title">기존 파일</td>
										<td>&nbsp;&nbsp; ${board.board_file}</td>
									</tr>
									<tr>
										<td id="title">첨부파일</td>
										<td><input type="file" name="board_file" /></td>
									</tr>
								</c:if>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2"><div style="float: right;">
											<input type="submit" value="수정"
												class="md-btn md-btn--primary md-btn--sm"> <input
												type="button" value="목록" onclick="changeView()"
												class="md-btn md-btn--primary md-btn--sm">
										</div></td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>