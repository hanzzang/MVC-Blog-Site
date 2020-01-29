<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header -->
<header class="header header--fixed">
	<div class="header__inner">
		<div class="header__logo">
			<a href="#" onclick="javascript:window.location='MainForm.do'"><img
				src="assets/img/logo.png" alt="" style="width: 122px;" /></a>
		</div>
		<div class="navbar-toggle" id="fs-button">
			<div class="navbar-icon">
				<span></span>
			</div>
		</div>
	</div>

	<div class="fullscreenmenu__module" trigger="#fs-button">
		<nav class="overlay-menu">
			<ul class="wil-menu-list">
				<li class="current-menu-item"><a href="#"
					onclick="javascript:window.location='MainForm.do'">Home</a></li>

				<c:if test="${sessionScope.sessionID==null}">
					<li><a href="#"
						onclick="javascript:window.location='LoginForm.do'">Login</a></li>
					<li><a href="#"
						onclick="javascript:window.location='JoinForm.do'">Join</a></li>
					<li><a href="#"
						onclick="javascript:window.location='SearchForm.do'">Search</a></li>
				</c:if>
				<c:if test="${sessionScope.sessionID!=null}">
					<li><a href="#"
						onclick="javascript:window.location='MemberLogoutAction.do'">Logout</a></li>
					<li><a href="#"
						onclick="javascript:window.location='MemberInfoAction.do'">MyInfo</a></li>
				</c:if>

				<li><a href="#"
					onclick="javascript:window.location='BoardListAction.bo'">Board</a></li>
				<li><a href="#"
					onclick="javascript:window.location='GuestbookListAction.ge'">Guest</a></li>

				<c:if test="${sessionScope.sessionID !=null && sessionScope.sessionID=='admin'}">
					<li><a href="#"
						onclick="javascript:window.location='MemberListAction.do'">Users</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</header>