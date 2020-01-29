<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function writeForm() {
		location.href = "BoardWriteForm.bo";
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
			<div class="col-lg-12 col-md-10 mx-auto">
				<div id="topForm">
					<div style="float: right;">
						<c:if test="${sessionScope.sessionID!=null}">
							<input type="button" value="글쓰기" onclick="writeForm()"
								class="md-btn md-btn--primary md-btn--lg">
							<br>
							<br>
						</c:if>
					</div>
				</div>

				<br>

				<div class="table-responsive">
					<div id="board">
						<table id="bList" class="table table-hover">
							<thead class="thead-dark">
								<tr heigh="30">
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="board" items="${requestScope.list}">
									<tr>
										<td>${board.board_num}</td>
										<td align="left"><c:if test="${board.board_re_lev > 1}">
												<c:forEach begin="1" end="${board.board_re_lev}">
												&nbsp;&nbsp; 
												</c:forEach>
												<img src="img/reply_icon.gif">
											</c:if> <a
											href="BoardDetailAction.bo?num=${board.board_num}&pageNum=${spage}">
												${board.board_subject} </a></td>
										<td>${board.board_id}</td>
										<td>${board.board_date}</td>
										<td>${board.board_count}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 페이징 부분 -->
				<br>
				<div id="pageForm">
					<c:if test="${startPage != 1}">
						<a href='BoardListAction.bo?page=${startPage-5}'>◀</a>
					</c:if>

					<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
						<c:if test="${pageNum == spage}">${pageNum}&nbsp;
					</c:if>
						<c:if test="${pageNum != spage}">
							<a href='BoardListAction.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
						</c:if>
					</c:forEach>

					<c:if test="${endPage != maxPage }">
						<a href='BoardListAction.bo?page=${endPage+1 }'>▶</a>
					</c:if>
				</div>

				<!--  검색 부분 -->
				<br>
				<div id="searchForm">
					<form>
						<div class="form-item form-item--sm">
							<select name="opt">
								<option value="0">제목</option>
								<option value="1">내용</option>
								<option value="2">제목+내용</option>
								<option value="3">글쓴이</option>
							</select>
						</div>
						<div class="form-item form-item--sm">
							<input type="text" size="20" name="condition" />
						</div>
						<div class="form-item form-item--sm">
							<input type="submit" value="검색"
								class="md-btn md-btn--primary md-btn--lg">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>