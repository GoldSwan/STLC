<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="bg" style="text-align: center; font-size: 18px;">
	<form action="<c:url value="/upload/1"/>" method="post" enctype="multipart/form-data">
		업로드 사진 선택 :
		<input type="file" name="file">
		<input type="submit" value="업로드">
	</form>
</div>