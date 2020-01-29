<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	// 줄바꿈 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<script type="text/javascript">
		// 입력값 체크
		function checkValue()
		{
			if(!document.guestbookInfo.guestbook_id.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_content.value){
				alert("내용을 입력하세요.");
				return false;
			}
		}
		
		// 답글창 open
		function openReplyForm(guestbook_no)
		{
			// window.name = "부모창 이름"; 
			window.name = "replyForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			window.open("GuestbookReplyFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"rForm", "width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
		}
		
		// 삭제창 open
		function openDelForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookDeleteFormAction.ge?num="+guestbook_no,
					"delForm", "width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
		}
		
		// 수정창 open
		function openUpdateForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookUpdateFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"updForm", "width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
		}

	</script>

<section class="awe-section">
	<div class="container">
		<div class="page-title pb-40">
			<h2 class="page-title__title">Guestbook</h2>
			<p class="page-title__text">say hello</p>
			<div class="page-title__divider"></div>
		</div>
	</div>
</section>

<section class="awe-section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="table-responsive">
					<form name="guestbookInfo" method="post"
						action="GuestbookWriteAction.ge" onsubmit="return checkValue()">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<td>이름 :</td>
									<c:if test="${sessionScope.sessionID!=null}">
										<td>${sessionScope.sessionID}<input type="hidden"
											name="guestbook_id" value="${sessionScope.sessionID}">
										</td>
									</c:if>
									<c:if test="${sessionScope.sessionID==null}">
										<td><input type="text" name="guestbook_id"></td>
									</c:if>
									<td>비밀번호 :</td>
									<td><input type="password" name="guestbook_password"></td>
								</tr>
								<tr>
									<td colspan="4"><textarea rows="7" cols="88"
											name="guestbook_content"></textarea></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="4"><input type="submit" value="등록"
										class="md-btn md-btn--primary md-btn--block"></td>
								</tr>
							</tfoot>
						</table>

						<br>
					</form>
				</div>

				<div id="listGuestForm">
					<form method="post" name="">
						<div class="table-responsive">
							<div id="comment">
								<table id="bList" class="table table-borderless">
									<tbody>
										<c:forEach var="guestbook" items="${requestScope.list}">
											<tr >
												<td>${guestbook.guestbook_no}</td>
												<td align="left"><c:if
														test="${guestbook.guestbook_level > 1}">
														<c:forEach begin="1" end="${guestbook.guestbook_level}">
												&nbsp;&nbsp; 
												</c:forEach>
														<img src="img/reply_icon.gif">
													</c:if>${guestbook.guestbook_id}</td>
												<td>${guestbook.guestbook_date}</td>
												<td><a href="#"
													onclick="openReplyForm(${guestbook.guestbook_no})">[답변]</a>&nbsp;
													<a href="#"
													onclick="openUpdateForm(${guestbook.guestbook_no})">[수정]</a>&nbsp;
													<a href="#"
													onclick="openDelForm(${guestbook.guestbook_no})">[삭제]</a></td>
											</tr>
											<tr>
												<td colspan="4"> ${fn:replace(guestbook.guestbook_content, cn, br)}
												<hr size="1">
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<%-- 
						<div id="comment">
							<c:forEach var="guestbook" items="${requestScope.list}">
								<hr size="1" width="700">
								<c:if test="${guestbook.guestbook_level > 1}">
									<c:forEach begin="1" end="${guestbook.guestbook_level}">
									&nbsp;&nbsp;
									</c:forEach>
									<img src="img/reply_icon.gif">
								</c:if>
								<label>${guestbook.guestbook_id}</label>&nbsp;&nbsp;&nbsp;
								<label>${guestbook.guestbook_date}&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<a href="#" onclick="openReplyForm(${guestbook.guestbook_no})">[답변]</a>&nbsp;
								<a href="#" onclick="openUpdateForm(${guestbook.guestbook_no})">[수정]</a>&nbsp;
								<a href="#" onclick="openDelForm(${guestbook.guestbook_no})">[삭제]</a>
								<br>
				 				${fn:replace(guestbook.guestbook_content, cn, br)} <br>
							</c:forEach>
							<hr size="1" width="700">
						</div>

 --%>
						<div id="pageForm">
							<c:if test="${startPage != 1}">
								<a href='GuestbookListAction.ge?page=${startPage-5}'>◀</a>
							</c:if>

							<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
								<c:if test="${pageNum == spage}">
						${pageNum}&nbsp;
					</c:if>
								<c:if test="${pageNum != spage}">
									<a href='GuestbookListAction.ge?page=${pageNum}'>${pageNum}&nbsp;</a>
								</c:if>
							</c:forEach>

							<c:if test="${endPage != maxPage }">
								<a href='GuestbookListAction.ge?page=${endPage+1 }'>▶</a>
							</c:if>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>