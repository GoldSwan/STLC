<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<c:if test="${pageContext.request.userPrincipal.name != null }">
		<div class="float-right" style="margin: 0 0 0 0; width: 80px">
			<a class="logout" href="javascript:document.getElementById('logout').submit()"
				style="text-decoration: none;"><b>로그아웃</b></a>
		</div>
	</c:if>

	<h2 style="text-align: center">
		<a href="<c:url value="/" />" style="text-decoration: none">
			<b style="color: #fdd835">Situation-cognitive Traffic Light Controller</b>
			<br>
			<b style="color: white">상황인지 신호 제어기</b>
		</a>
	</h2>

	<hr>

	<div class="row" align="right">
		<div class="col-md-2"><b>팀명</b> KKCC</div>
		<div class="col-md-5"><b>팀원</b> 조성윤 김민우 김수완 채준범</div>
		<div class="col-md-4"><b>지도교수</b> 김성동 교수님</div>
	</div>
</header>

<div class="dropdown">
	<div class="btn dropdown-toggle" data-toggle="dropdown"
	 style="display: block; width: 100%; padding: 10px;
	 		 background-color: #fdd835; font-size: 25px"><b>교차로 선택</b>
	</div>
	<div class="dropdown-menu" style="width: 100%; margin: auto;">
		<div style="width: 145px; margin: 0 auto;">
			<a class="dropdown-item" href="<c:url value="/trafficstatus/0" />">한성대 사거리</a>
			<a class="dropdown-item" href="<c:url value="/trafficstatus/1" />">미아 삼거리</a>
		</div>
		<hr style="width: 95%; align: center">
		<div style="width: 150px; margin: 0 auto;">
			<a class="dropdown-item" href="<c:url value="/messageTest" />">메세지 테스트</a>
		</div>
	</div>
</div>

<form id="logout" action="<c:url value="/logout" />" method="post">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }" />
</form>