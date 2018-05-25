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
			url : '/STLC/ajaxtrafficstatus.do/' + ${id},
			dataType : "json",
			success : function(resData) {
				createImages(resData);
				//alert('ajax 통신성공');
			},
			error : function() {
				//alert('ajax 통신에러');
			}
		});
	}, 100); // 새로고침 시간 1000ms
	function createImages(resData) {
		var $trafficremaintime = $("#trafficremaintime");
		var $traffictotaltime = $("#traffictotaltime");
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
		var trafficData4 = trafficDatas[4];

		$trafficremaintime.text("다음 신호까지 남은 시간 " + trafficData0.remaintime +" / "+ trafficData0.totaltime + "초");

		$trafficinfo3.text(trafficData1.label);
		$trafficlight3.attr('src', trafficData1.light);
		$trafficimage3.attr('src', trafficData1.imgPath);
		
		$trafficinfo0.text(trafficData2.label);
		$trafficlight0.attr('src', trafficData2.light);
		$trafficimage0.attr('src', trafficData2.imgPath);
		
		$trafficinfo1.text(trafficData3.label);
		$trafficlight1.attr('src', trafficData3.light);
		$trafficimage1.attr('src', trafficData3.imgPath);

		$trafficinfo2.text(trafficData4.label);
		$trafficlight2.attr('src', trafficData4.light);
		$trafficimage2.attr('src', trafficData4.imgPath);
	}
</script>
<div id="t" class="jumbotron"
	style="text-align: center; font-size: 18px;">

	<div class="row">
<!-- ---------------------------------------north------------------------------------ -->		
		<div class="col-md-4">
		</div>

		<div class="col-md-4">
			<img id="trafficlight3" class="container-fluid" align="center" height="60">
			<img id="trafficimage3" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=trafficinfo3>NORTH</p>
		</div>

		<div class="col-md-4">
		</div>
<!-- ----------------------------------east,west------------------------------------- -->
		<div class="col-md-4">
			<img id="trafficlight1" class="container-fluid" align="center" height="60">
			<img id="trafficimage1" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=trafficinfo1>WEST</p>
		</div>

		<div class="col-md-4" vertical-align="middle">
				<br><br><br><br><br>
				<p id="trafficremaintime" class="container-fluid" vertical-align="middle">traffic remain time</p>
		</div>

		<div class="col-md-4">
			<img id="trafficlight0" class="container-fluid" align="center" height="60">
			<img id="trafficimage0" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=trafficinfo0>EAST</p>
		</div>
<!-- ---------------------------------------south------------------------------------ -->
		<div class="col-md-4">
		</div>

		<div class="col-md-4">
			<img id="trafficlight2" class="container-fluid" align="center" height="60">
			<img id="trafficimage2" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=trafficinfo2>SOUTH</p>
		</div>

		<div class="col-md-4">
		</div>
<!-- -------------------------------------------------------------------------------- -->
	</div>
</div>