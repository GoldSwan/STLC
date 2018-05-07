<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	var jqueryObj = $;
	var auto_refresh = setInterval(function testajax() {
		jqueryObj.ajax({
			type : 'GET',
			url : '/STLC/ajax4.do',
			dataType : "json",
			success : function(resData) {
				createImages(resData);
			},
			error : function() {
				alert('실패');
			}
		});
	}, 1000); // 새로고침 시간 1000은 1초를 의미합니다.
	function createImages(resData) {
		var trafficDatas = resData.items;
		var strDOM = "";
		var $trafficimage = $("#trafficimage");
		var $trafficinfo = $("#trafficinfo");

		var trafficData = trafficDatas[0];

		var strDOM = "";
		strDOM = trafficData.url + "?" + new Date().getTime();

		$trafficimage.attr('src', strDOM);
		$trafficinfo.text(trafficData.trafficInfo);
		//이미지 url 확인
		var SRC = $trafficimage.attr('src');
		console.log(SRC);
	}
</script>

<div id="t" class="jumbotron"
	style="text-align: center; font-size: 18px;">
	<img id="trafficimage" src="/STLC/resources/files/traffic4_1.jpg">
	<p>신호대기시간:</p><p id=trafficinfo>hello I'm trafficInfo</p>
</div>