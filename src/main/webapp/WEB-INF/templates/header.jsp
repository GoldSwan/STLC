<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h2 style="text-align: center; margin: 20px;">
	<a href="<c:url value="/" />" style="text-decoration: none; color: black;">
		Situation-cognitive Traffic Light Controller
	</a>
</h2>

<!-- 로그아웃 -->
<c:if test="${pageContext.request.userPrincipal.name != null }">
	<a href="javascript:document.getElementById('logout').submit()"
		style="display: block; text-align: right; margin: 10px 50px 20px 0px; text-decoration: none; color: black;">로그아웃</a>
</c:if>
<form id="logout" action="<c:url value="/logout" />" method="post">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }" />
</form>

<div class="dropdown">
	<button type="button" class="btn btn-dark dropdown-toggle"
		data-toggle="dropdown" style="display: block; width: 100%; padding: 20px;">메뉴
	</button>
	<div class="dropdown-menu">
		<a class="dropdown-item" href="<c:url value="/traffic1" />">신호등1</a>
		<a class="dropdown-item" href="<c:url value="/traffic2" />">신호등2</a>
		<a class="dropdown-item" href="<c:url value="/traffic3" />">신호등3</a>
		<a class="dropdown-item" href="<c:url value="/traffic4" />">신호등4</a>
		<a class="dropdown-item" href="<c:url value="/messageSetting" />">메세지 설정</a>
		<a class="dropdown-item" href="<c:url value="/searchdata" />">분석결과 업로드</a>	
	</div>
</div>