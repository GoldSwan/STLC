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
			url : '/STLC/ajaxtrafficstatus.do',
			dataType : "json",
			success : function(resData) {
				createImages(resData);
				//alert('ajax 통신성공');
			},
			error : function() {
				//alert('ajax 통신에러');
			}
		});
	}, 1000); // 새로고침 시간 1000ms
	function createImages(resData) {
		var $images = $("#trafficimage");
		var $infos = $("#trafficinfo");
		var $lights = $("#trafficlight");
		
		var trafficDatas = resData.items;

		for (var i = 0; i < 4; i++) {
			$images[i].attr('src', trafficDatas[i].imgPath);
			$infos[i].text(trafficDatas[i].label);
			$lights[i].attr('src', trafficDatas[i].light);
			console.log($images[i].attr('src'));
		}
	}
</script>

<div id="t" class="jumbotron"
	style="text-align: center; font-size: 18px;">

	<div class="row">
		<c:forEach var='i' begin='0' end='3' step='1'>
			<div class="col-md-6">
				<img class="trafficimage container-fluid" src="/STLC/resources/images/loading.gif" style="float:right;">
				<p class=trafficinfo></p>
				<img class="trafficlight" style="float:right; width: 50; height: 50">
			</div>
		</c:forEach>
	</div>

</div>