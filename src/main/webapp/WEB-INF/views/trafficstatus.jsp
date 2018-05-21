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
		var $trafficimage0 = $("#trafficimage0");
		var $trafficimage1 = $("#trafficimage1");
		var $trafficimage2 = $("#trafficimage2");
		var $trafficimage3 = $("#trafficimage3");
		var $trafficinfo0 = $("#trafficinfo0");
		var $trafficinfo1 = $("#trafficinfo1");
		var $trafficinfo2 = $("#trafficinfo2");
		var $trafficinfo3 = $("#trafficinfo3");
		var $trafficlight0 = $("#trafficlight0");
		var $trafficlight1 = $("#trafficlight1");
		var $trafficlight2 = $("#trafficlight2");
		var $trafficlight3 = $("#trafficlight3");

		var trafficDatas = resData.items;
		var trafficData0 = trafficDatas[0];
		var trafficData1 = trafficDatas[1];
		var trafficData2 = trafficDatas[2];
		var trafficData3 = trafficDatas[3];

		$trafficinfo0.text(trafficData0.label);
		$trafficlight0.attr('src', trafficData0.light);
		$trafficimage0.attr('src', trafficData0.imgPath);
		console.log($trafficimage0.attr('src'));
		
		$trafficinfo1.text(trafficData1.label);
		$trafficlight1.attr('src', trafficData1.light);
		$trafficimage1.attr('src', trafficData1.imgPath);
		console.log($trafficimage1.attr('src'));

		$trafficinfo2.text(trafficData2.label);
		$trafficlight2.attr('src', trafficData2.light);
		$trafficimage2.attr('src', trafficData2.imgPath);
		console.log($trafficimage2.attr('src'));

		$trafficinfo3.text(trafficData3.label);
		$trafficlight3.attr('src', trafficData3.light);
		$trafficimage3.attr('src', trafficData3.imgPath);
		console.log($trafficimage3.attr('src'));
	}
</script>

<div id="t" class="jumbotron"
	style="text-align: center; font-size: 18px;">

	<div class="row">
		<div class="col-md-6">
			<img id="trafficimage0" class="container-fluid" src="<c:url value="/resources/images/loading.gif" />" style="float:right;">
			<p id=trafficinfo0></p>
			<img id="trafficlight0" class="container-fluid" align="center">
		</div>
		
		<div class="col-md-6">
			<img id="trafficimage1" class="container-fluid" src="<c:url value="/resources/images/loading.gif" />" style="float:right;">
			<p id=trafficinfo1></p>
			<img id="trafficlight1" class="container-fluid" align="center">
		</div>
		
		<div class="col-md-6">
			<img id="trafficimage2" class="container-fluid" src="<c:url value="/resources/images/loading.gif" />" style="float:right;">
			<p id=trafficinfo2></p>
			<img id="trafficlight2" class="container-fluid" align="center">
		</div>
		
		<div class="col-md-6">
			<img id="trafficimage3" class="container-fluid" src="<c:url value="/resources/images/loading.gif" />" style="float:right;">
			<p id=trafficinfo3></p>
			<img id="trafficlight3" class="container-fluid" align="center">
		</div>
	</div>

</div>