<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="jumbotron" style="text-align: center; font-size: 18px;">
	<form action="<c:url value="/upload?${_csrf.parameterName}=${_csrf.token}"/>" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 업로드 사진 선택 : <input type="file"name="file"> <input type="submit" value="Upload">
	</form>
</div>