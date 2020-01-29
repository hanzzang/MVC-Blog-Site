<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jsp.member.model.MemberBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header class="masthead"
	style="background-image: url('img/about-bg.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>전체 회원 정보</h1>
					<span class="subheading">반갑습니다</span>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<table class="table">
				<tr align="center">
					<td id=title>아이디</td>
					<td id=title>비밀번호</td>
					<td id=title>이름</td>
					<td id=title>성별</td>
					<td id=title>생년월일</td>
					<td id=title>이메일</td>
					<td id=title>전화</td>
					<td id=title>주소</td>
					<td id=title>가입일</td>
				</tr>

				<c:set var="memberList" value="${requestScope.memberList}" />
				<c:forEach var="member" items="${memberList}">
					<tr>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
						<td>${member.gender}</td>
						<td>${member.birthyy}</td>
						<td>${member.mail1}</td>
						<td>${member.phone}</td>
						<td>${member.address}</td>
						<td>${member.reg}</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
</div>
