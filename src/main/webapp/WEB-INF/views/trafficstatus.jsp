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
		}
		
		if (trafficDatas[2] != undefined) {
			$timeLabel1.text(trafficDatas[2].timeLabel);
			$dirLabel1.text(trafficDatas[2].dirLabel);
			$trafficlight1.attr('src', trafficDatas[2].light);
			$trafficimage1.attr('src', trafficDatas[2].imgPath);
		}
		
		if (trafficDatas[3] != undefined) {
			$timeLabel2.text(trafficDatas[3].timeLabel);
			$dirLabel2.text(trafficDatas[3].dirLabel);
			$trafficlight2.attr('src', trafficDatas[3].light);
			$trafficimage2.attr('src', trafficDatas[3].imgPath);
		}
		
		if (trafficDatas[4] != undefined) {
			$timeLabel3.text(trafficDatas[4].timeLabel);
			$dirLabel3.text(trafficDatas[4].dirLabel);
			$trafficlight3.attr('src', trafficDatas[4].light);
			$trafficimage3.attr('src', trafficDatas[4].imgPath);
		}
	}

	var followCursor = (function() {
		var trafficimg = document.createElement('img');
		trafficimg.style.position = 'absolute';
		trafficimg.style.zIndex = '10';

		return {
			init : function(img) {
				trafficimg.src = img.src;
				img.parentElement.appendChild(trafficimg);
			},

			run : function(e) {
				var e = e || window.event;
				trafficimg.style.left = e.x + 'px';
				trafficimg.style.top = e.y + 'px';
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
		<!-- ---------------------------------------west------------------------------------ -->
		<div class="col-md-3" style="height: 100%; margin: auto">
			<div class="traffic">
				<img id="trafficlight1" class="container-fluid" src="<c:url value="/resources/images/light-green.png" />">
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
				<img id="trafficlight3" class="container-fluid" src="<c:url value="/resources/images/light-green.png" />">
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
				<img id="trafficlight2" class="container-fluid" src="<c:url value="/resources/images/light-green.png" />">
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
				<img id="trafficlight0" class="container-fluid" src="<c:url value="/resources/images/light-green.png" />">
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

		<!-- -------------------------------------------------------------------------------- -->
	</div>
</div>