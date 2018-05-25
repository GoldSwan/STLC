<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2 style="text-align: center; margin: 20px;">
	<a href="<c:url value="/" />" style="text-decoration: none; color: black;">
		<img id="logo" src="<c:url value="/resources/images/logo.jpg" />" style="float:right;width:100px;height:100px">
		<br>Situation-cognitive Traffic Light Controller<!-- 이미지 로고 -->
	</a>
</h2>

<!-- 로그아웃 -->
<c:if test="${pageContext.request.userPrincipal.name != null }">
	<div style="margin: 0 0 0 auto; width: 80px">
		<a href="javascript:document.getElementById('logout').submit()"
			style="text-decoration: none; color: black;">로그아웃</a>
	</div>
</c:if>
<form id="logout" action="<c:url value="/logout" />" method="post">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }" />
</form>

<div class="dropdown">
	<button type="button" class="btn btn-dark dropdown-toggle"
		data-toggle="dropdown" style="display: block; width: 100%; padding: 20px;">메뉴
	</button>
	<div class="dropdown-menu" style="width: 100%; margin: 0 auto;">
		<div style="width: 100px; margin: 0 auto;">
			<a class="dropdown-item" href="<c:url value="/trafficstatus/0" />">한성대 사거리</a>
			<a class="dropdown-item" href="<c:url value="/trafficstatus/1" />">미아 삼거리</a>
			<a class="dropdown-item" href="<c:url value="/messageTest" />">메세지 테스트</a>
		</div>
	</div>
</div>