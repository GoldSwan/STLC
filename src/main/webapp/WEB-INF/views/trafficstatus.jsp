<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	var jqueryObj = $;
	var sectionId = ${id}
	
	var auto_refresh = setInterval(function testajax() {
		jqueryObj.ajax({
			type : 'GET',
			url : '/STLC/ajaxtrafficstatus.do/' + sectionId,
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
		
		if (trafficDatas[0] != undefined) {
			$trafficremaintime.text(trafficDatas[0].remaintime +" / "+ trafficDatas[0].totaltime + "초");
		}

		if (trafficDatas[1] != undefined) {
			$timeLabel0.text(trafficDatas[1].timeLabel);
			$dirLabel0.text(trafficDatas[1].dirLabel);
			$trafficlight0.attr('src', trafficDatas[1].light);
			$trafficimage0.attr('src', trafficDatas[1].imgPath);
		} else {
			$trafficlight0.attr('src', "<c:url value='/resources/images/light-default.png' />");
			$trafficimage0.attr('src', "<c:url value='/resources/images/loading.gif' />");
		}
		
		if (trafficDatas[2] != undefined) {
			$timeLabel1.text(trafficDatas[2].timeLabel);
			$dirLabel1.text(trafficDatas[2].dirLabel);
			$trafficlight1.attr('src', trafficDatas[2].light);
			$trafficimage1.attr('src', trafficDatas[2].imgPath);
		} else {
			$trafficlight1.attr('src', "<c:url value='/resources/images/light-default.png' />");
			$trafficimage1.attr('src', "<c:url value='/resources/images/loading.gif' />");
		}
		
		if (trafficDatas[3] != undefined) {
			$timeLabel2.text(trafficDatas[3].timeLabel);
			$dirLabel2.text(trafficDatas[3].dirLabel);
			$trafficlight2.attr('src', trafficDatas[3].light);
			$trafficimage2.attr('src', trafficDatas[3].imgPath);
		} else {
			$trafficlight2.attr('src', "<c:url value='/resources/images/light-default.png' />");
			$trafficimage2.attr('src', "<c:url value='/resources/images/loading.gif' />");
		}
		
		if (trafficDatas[4] != undefined) {
			$timeLabel3.text(trafficDatas[4].timeLabel);
			$dirLabel3.text(trafficDatas[4].dirLabel);
			$trafficlight3.attr('src', trafficDatas[4].light);
			$trafficimage3.attr('src', trafficDatas[4].imgPath);
		} else {
			$trafficlight3.attr('src', "<c:url value='/resources/images/light-default.png' />");
			$trafficimage3.attr('src', "<c:url value='/resources/images/loading.gif' />");
		}
	}

	var followCursor = (function() {
		var trafficimg = document.createElement('img');
		trafficimg.style.position = 'fixed';
		trafficimg.style.zIndex = '10';

		return {
			init : function(img) {
				trafficimg.src = img.src;

				img.parentElement.appendChild(trafficimg);

				if (trafficimg.clientWidth <= img.clientWidth)
					img.parentElement.removeChild(trafficimg);
			},

			run : function(event) {
				if (trafficimg.clientWidth > window.innerWidth) {
					var mul = trafficimg.clientWidth / window.innerWidth;
					trafficimg.clientWidth = window.innerWidth;
					trafficimg.clientHeight = window.innerHeight * mul;
				}

				var left = event.x - trafficimg.clientWidth / 2;
				var rDiff = event.x + trafficimg.clientWidth / 2 - window.innerWidth;
				if (left < 0)
					left = 0;
				else if (rDiff > 0)
					left -= rDiff;

				var top;
				if (window.innerHeight < event.y + trafficimg.clientHeight)
					top = event.y - 20 - trafficimg.clientHeight;
				else
					top = event.y + 20;

				trafficimg.style.left = left + 'px';
				trafficimg.style.top = top + 'px';
			},

			stop : function(img) {
				img.parentElement.removeChild(trafficimg);
			}
		};
	}());

	function showBigImage(img) {
		followCursor.init(img);
	}

	function moveBigImage(event) {
		followCursor.run(event);
	}

	function hideBigImage(img) {
		followCursor.stop(img);
	}
</script>
<div id="t" class="bg"
	style="text-align: center; font-size: 18px;">

	<div class="row">
		<div class="col-md-1"></div>
	
		<!-- ---------------------------------------west------------------------------------ -->
		<div class="col-md-3" style="height: 100%; margin: auto">
			<div class="traffic">
				<img id="trafficlight1" class="container-fluid" src="<c:url value="/resources/images/light-default.png" />">
				<img id="trafficimage1" class="container-fluid traffic-image" src="<c:url value="/resources/images/loading.gif" />"
					 onmouseover="showBigImage(this)" onmousemove="moveBigImage(event)" onmouseout="hideBigImage(this)">
				<div class="traffic-label">
					<div style="border: 1px solid red; border-radius: 5px">
						<div id=timeLabel1>WEST</div>
						<div id=dirLabel1>info</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-3">
			<!-- ---------------------------------------north------------------------------------ -->
			<div class="traffic">
				<img id="trafficlight3" class="container-fluid" src="<c:url value="/resources/images/light-default.png" />">
				<img id="trafficimage3" class="container-fluid traffic-image" src="<c:url value="/resources/images/loading.gif" />"
					 onmouseover="showBigImage(this)" onmousemove="moveBigImage(event)" onmouseout="hideBigImage(this)">
				<div class="traffic-label">
					<div style="border: 1px solid red; border-radius: 5px">
						<div id=timeLabel3>NORTH</div>
						<div id=dirLabel3>info</div>
					</div>
				</div>
			</div>

			<!-- ---------------------------------------remain time------------------------------------ -->
			
			<div class="container-fluid" style="font-family: 'Malgun Gothic'; font-size: 18px; text-align: center; border-radius: 25px; background-color: black; color: white; padding: 5px">
				<div><b>남은 시간</b></div>
				<div id="trafficremaintime">0 / 20 <b>초</b></div>
			</div>

			<!-- ---------------------------------------south------------------------------------ -->
			<div class="traffic">
				<img id="trafficlight2" class="container-fluid" src="<c:url value="/resources/images/light-default.png" />">
				<img id="trafficimage2" class="container-fluid traffic-image" src="<c:url value="/resources/images/loading.gif" />"
					 onmouseover="showBigImage(this)" onmousemove="moveBigImage(event)" onmouseout="hideBigImage(this)">
				<div class="traffic-label">
					<div style="border: 1px solid red; border-radius: 5px">
						<div id=timeLabel2>SOUTH</div>
						<div id=dirLabel2>info</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ----------------------------------east------------------------------------- -->
		<div class="col-md-3" style="height: 100%; margin: auto">
			<div class="traffic">
				<img id="trafficlight0" class="container-fluid" src="<c:url value="/resources/images/light-default.png" />">
				<img id="trafficimage0" class="container-fluid traffic-image" src="<c:url value="/resources/images/loading.gif" />"
					 onmouseover="showBigImage(this)" onmousemove="moveBigImage(event)" onmouseout="hideBigImage(this)">
				<div class="traffic-label">
					<div style="border: 1px solid red; border-radius: 5px">
						<div id=timeLabel0>EAST</div>
						<div id=dirLabel0>info</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-1"></div>
		<!-- -------------------------------------------------------------------------------- -->
	</div>
</div>