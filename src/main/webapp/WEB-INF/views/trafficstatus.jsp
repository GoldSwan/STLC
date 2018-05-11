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
				alert('ajax 통신에러');
			}
		});
	}, 1000); // 새로고침 시간 1000은 1초를 의미합니다.
	function createImages(resData) {
		
		var $trafficimage0 = $("#trafficimage0");
		var $trafficimage1 = $("#trafficimage1");
		var $trafficimage2 = $("#trafficimage2");
		var $trafficimage3 = $("#trafficimage3");
		var $trafficinfo0 = $("#trafficinfo0");
		var $trafficinfo1 = $("#trafficinfo1");
		var $trafficinfo2 = $("#trafficinfo2");
		var $trafficinfo3 = $("#trafficinfo3");
		var strDOM0 = "";
		var strDOM1 = "";
		var strDOM2 = "";
		var strDOM3 = "";
		
		var trafficDatas = resData.items;

		var trafficData0 = trafficDatas[0];
		var trafficData1 = trafficDatas[1];
		var trafficData2 = trafficDatas[2];
		var trafficData3 = trafficDatas[3];

		strDOM0 = trafficData0.url + "?" + new Date().getTime();
		strDOM1 = trafficData1.url + "?" + new Date().getTime();
		strDOM2 = trafficData2.url + "?" + new Date().getTime();
		strDOM3 = trafficData3.url + "?" + new Date().getTime();
		
		$trafficimage0.attr('src', strDOM0);
		$trafficinfo0.text(trafficData0.trafficInfo);
		$trafficimage1.attr('src', strDOM1);
		$trafficinfo1.text(trafficData1.trafficInfo);
		$trafficimage2.attr('src', strDOM2);
		$trafficinfo2.text(trafficData2.trafficInfo);
		$trafficimage3.attr('src', strDOM3);
		$trafficinfo3.text(trafficData3.trafficInfo);
		
		//이미지 url 확인
		var SRC0 = $trafficimage0.attr('src');
		var SRC1 = $trafficimage1.attr('src');
		var SRC2 = $trafficimage2.attr('src');
		var SRC3 = $trafficimage3.attr('src');
		console.log(SRC0);
		console.log(SRC1);
		console.log(SRC2);
		console.log(SRC3);
	}
</script>

<div id="t" class="jumbotron"
	style="text-align: center; font-size: 18px;">
		
	<table border="1" align="center">
		<tr>
			<td><img id="trafficimage0" src="/STLC/resources/files/traffic1_1.jpg" style="float:right;width:416px;height:416px"></td>
			<td><img id="trafficimage1" src="/STLC/resources/files/traffic2_1.jpg" style="float:right;width:416px;height:416px"></td>
			<br>
		</tr>
		<tr>
			<td><p id=trafficinfo0>hello I'm trafficInfo1</p></td>
			<td><p id=trafficinfo1>hello I'm trafficInfo2</p></td>
		</tr>
		<tr>
			<td><img id="trafficimage2" src="/STLC/resources/files/traffic3_1.jpg" style="float:left;width:416px;height:416px"></td>
			<td><img id="trafficimage3" src="/STLC/resources/files/traffic4_1.jpg" style="float:right;width:416px;height:416px"></td>
		</tr>
		<tr>
			<td><p id=trafficinfo2>hello I'm trafficInfo3</p></td>
			<td><p id=trafficinfo3>hello I'm trafficInfo4</p></td>
		</tr>
	</table>
	
</div>