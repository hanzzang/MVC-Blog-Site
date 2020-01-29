<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>


<script type="text/javascript">
		function changeBoardView(value)
		{
			if(value == 0)	
				location.href='BoardListAction.bo?page=${pageNum}';
			else if(value == 1)
				location.href='BoardReplyFormAction.bo?num=${board.board_num}&page=${pageNum}';
		}
		
		function doAction(value)
		{
			if(value == 0) 
				location.href="BoardUpdateFormAction.bo?num=${board.board_num}&page=${pageNum}";
			else if(value == 1) 
				location.href="BoardDeleteAction.bo?num=${board.board_num}";
		}
		
		var httpRequest = null;
		
		function getXMLHttpRequest(){
			var httpRequest = null;
		
			if(window.ActiveXObject){
				try{
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");	
				} catch(e) {
					try{
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e2) { httpRequest = null; }
				}
			}
			else if(window.XMLHttpRequest){
				httpRequest = new window.XMLHttpRequest();
			}
			return httpRequest;	
		}

		function writeCmt()
		{
			var form = document.getElementById("writeCommentForm");
			
			var board = form.comment_board.value
			var id = form.comment_id.value
			var content = form.comment_content.value;
			
			if(!content)
			{
				alert("내용을 입력하세요.");
				return false;
			}
			else
			{	
				var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
					
				httpRequest = getXMLHttpRequest();
				httpRequest.onreadystatechange = checkFunc;
				httpRequest.open("POST", "CommentWriteAction.co", true);	
				httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
				httpRequest.send(param);
			}
		}
		
		function checkFunc(){
			if(httpRequest.readyState == 4){
				var resultText = httpRequest.responseText;
				if(resultText == 1){ 
					document.location.reload(); 
				}
			}
		}
		
		function cmReplyOpen(comment_num){
			var userId = '${sessionScope.sessionID}';
			
			if(userId == "" || userId == null){
				alert("로그인후 사용가능합니다.");
				return false;
			}
			else{
				window.name = "parentForm";
				window.open("CommentReplyFormAction.co?num="+comment_num,
							"replyForm", "width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
			}
		}
		
		function cmDeleteOpen(comment_num){
			var msg = confirm("댓글을 삭제합니다.");	
			if(msg == true){ 
				deleteCmt(comment_num);
			}
			else{
				return false; 
			}
		}
	
		function deleteCmt(comment_num)
		{
			var param="comment_num="+comment_num;
			
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "CommentDeleteAction.co", true);	
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
			httpRequest.send(param);
		}
		
		function cmUpdateOpen(comment_num){
			window.name = "parentForm";
			window.open("CommentUpdateFormAction.co?num="+comment_num, "updateForm", "width=600, height=400, left=100, top=50, resizable = no, scrollbars = no");
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
					<div id="board">
						<table class="table">
							<tbody>
								<tr>
									<td id="title" style="width: 100;">작성일</td>
									<td>${board.board_date}</td>
								</tr>
								<tr>
									<td id="title" style="width: 100;">작성자</td>
									<td>${board.board_id}</td>
								</tr>
								<tr>
									<td id="title" style="width: 100;">제 목</td>
									<td>${board.board_subject}</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 350px;">
										${fn:replace(board.board_content, cn, br)}</td>
								</tr>
								<tr>
									<td id="title" style="width: 100;">첨부파일</td>
									<td><a
										href='FileDownloadAction.bo?file_name=${board.board_file}'>${board.board_file}</a>
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<div style="float: right">
											<c:if test="${sessionScope.sessionID !=null}">
												<c:if test="${sessionScope.sessionID == board.board_id}">
													<input type="button" value="수정" onclick="doAction(0)"
														class="md-btn md-btn--primary md-btn--sm">
													<input type="button" value="삭제" onclick="doAction(1)"
														class="md-btn md-btn--primary md-btn--sm">
												</c:if>
												<input type="button" value="답글" onclick="changeBoardView(1)"
													class="md-btn md-btn--primary md-btn--sm">
											</c:if>
											<input type="button" value="목록" onclick="changeBoardView(0)"
												class="md-btn md-btn--primary md-btn--sm">
										</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
				<br> <br>

				<div class="table-responsive">
					<div id="comment">
						<table border="1" bordercolor="lightgray">
							<c:if test="${requestScope.commentList != null}">
								<c:forEach var="comment" items="${requestScope.commentList}">
									<tr>
										<td width="150">
											<div>
												<c:if test="${comment.comment_level > 1}">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<img src="img/reply_icon.gif">
												</c:if>

												${comment.comment_id}<br> <font size="2"
													color="lightgray">${comment.comment_date}</font>
											</div>
										</td>
										<td width="550">
											<div class="text_wrapper">
												${fn:replace(comment.comment_content, cn, br)}</div>
										</td>
										<td width="100">
											<div id="btn">
												<a href="#" onclick="cmReplyOpen(${comment.comment_num})">[답변]</a><br>
												<c:if test="${comment.comment_id == sessionScope.sessionID}">
													<a href="#" onclick="cmUpdateOpen(${comment.comment_num})">[수정]</a>
													<br>
													<a href="#" onclick="cmDeleteOpen(${comment.comment_num})">[삭제]</a>
												</c:if>
											</div>
										</td>
									</tr>

								</c:forEach>
							</c:if>

							<c:if test="${sessionScope.sessionID !=null}">
								<tr bgcolor="#F5F5F5">
									<form id="writeCommentForm">
										<input type="hidden" name="comment_board"
											value="${board.board_num}"> <input type="hidden"
											name="comment_id" value="${sessionScope.sessionID}">
										<td width="120">
											<div>${sessionScope.sessionID}</div>
										</td>
										<td width="500">
											<div>
												<textarea name="comment_content" rows="4" cols="70"></textarea>
											</div>
										</td>
										<td width="180">
											<div id="btn">
												<p>
													<a href="#" onclick="writeCmt()">[댓글등록]</a>
												</p>
											</div>
										</td>
									</form>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>