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
	}, 1000); // 새로고침 시간 1000ms
	function createImages(resData) {
		var $trafficremaintime = $("#trafficremaintime");
		var $traffictotaltime = $("#traffictotaltime");
		var $trafficimage0 = $("#trafficimage0");
		var $trafficimage1 = $("#trafficimage1");
		var $trafficimage2 = $("#trafficimage2");
		var $trafficimage3 = $("#trafficimage3");
		var $timeLabel0 = $("#timeLabel0");
		var $timeLabel1 = $("#timeLabel1");
		var $timeLabel2 = $("#timeLabel2");
		var $timeLabel3 = $("#timeLabel3");
		var $dirLabel0 = $("#dirLabel0");
		var $dirLabel1 = $("#dirLabel1");
		var $dirLabel2 = $("#dirLabel2");
		var $dirLabel3 = $("#dirLabel3");
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
		$timeLabel3.text(trafficData1.timeLabel);
		$dirLabel3.text(trafficData1.dirLabel);
		$trafficlight3.attr('src', trafficData1.light);
		$trafficimage3.attr('src', trafficData1.imgPath);

		$timeLabel0.text(trafficData2.timeLabel);
		$dirLabel0.text(trafficData2.dirLabel);
		$trafficlight0.attr('src', trafficData2.light);
		$trafficimage0.attr('src', trafficData2.imgPath);
		
		$timeLabel1.text(trafficData3.timeLabel);
		$dirLabel1.text(trafficData3.dirLabel);
		$trafficlight1.attr('src', trafficData3.light);
		$trafficimage1.attr('src', trafficData3.imgPath);
		$timeLabel2.text(trafficData4.timeLabel);
		$dirLabel2.text(trafficData4.dirLabel);
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
			<p id=timeLabel3>NORTH</p>
			<p id=dirLabel3></p>
		</div>

		<div class="col-md-4">
		</div>
<!-- ----------------------------------east,west------------------------------------- -->
		<div class="col-md-4">
			<img id="trafficlight1" class="container-fluid" align="center" height="60">
			<img id="trafficimage1" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=timeLabel1>WEST</p>
			<p id=dirLabel1></p>
		</div>

		<div class="col-md-4" vertical-align="middle">
				<br><br><br><br>
				<p id="trafficremaintime" class="container-fluid" vertical-align="middle">traffic remain time</p>
		</div>

		<div class="col-md-4">
			<img id="trafficlight0" class="container-fluid" align="center" height="60">
			<img id="trafficimage0" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=timeLabel0>EAST</p>
			<p id=dirLabel0></p>
		</div>
<!-- ---------------------------------------south------------------------------------ -->
		<div class="col-md-4">
		</div>

		<div class="col-md-4">
			<img id="trafficlight2" class="container-fluid" align="center" height="60">
			<img id="trafficimage2" class="container-fluid"
				src="<c:url value="/resources/images/loading.gif" />"
				style="float: right;">
			<p id=timeLabel2>SOUTH</p>
			<p id=dirLabel2></p>
		</div>

		<div class="col-md-4">
		</div>
<!-- -------------------------------------------------------------------------------- -->
	</div>
</div>