var sectionApp = angular.module('sectionApp', []);

sectionApp.controller("sectionController", function($scope, $http) { // 생성자, DI

	/* INIT */
	$scope.initSections = function() {
		$scope.refreshSections();
		$scope.inputIsVisible = false;
	};

	/* Utils */
	$scope.showInput = function() {
		$scope.inputIsVisible = !$scope.inputIsVisible;
		if (!$scope.inputIsVisible)
			$scope.addSection($scope.sectionName);
	}
	
	$scope.hideInput = function() {
		$scope.inputIsVisible = false;
	}

	$scope.setCsrfToken = function() {
		var csrfToken = $("meta[name='_csrf']").attr("content");
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		$http.defaults.headers.common[csrfHeader] = csrfToken;
	};
	
	/* CRUDs */
	// CREATE
	$scope.addSection = function(sectionName) {
		if (sectionName == undefined) {
			alert("교차로 이름이 없습니다.");
			return;
		}
		
		$scope.setCsrfToken();
		
		$http.post('/STLC/api/sections', sectionName).then(
				function successCallback(response) {
					if (response.status === 200) {
						alert("교차로가 추가되었습니다.");
						$scope.refreshSections();
					}
					else if (response.status === 204)
						alert("교차로 추가 실패");
				}, function errorCallback() {
					alert("교차로 추가 실패 (연결이 끊어졌거나 세션이 만료되었습니다)")
				});
		$scope.sectionName = undefined;
	};
	
	// READ
	$scope.refreshSections = function() {
		$http.get('/STLC/api/sections').then(
				function successCallback(response) {
					$scope.sections = response.data;
				});
	};
	
	// UPDATE
	$scope.modifySection = function(sectionId, sectionName) {
		$scope.setCsrfToken();
		
		$http.put('/STLC/api/sections/' + sectionId + '/' + sectionName).then(
				function successCallback(response) {
					if (response.status === 200) {
						alert("교차로가 수정되었습니다.");
						$scope.refreshSections();
					}
					else if (response.status === 204)
						alert("교차로 수정 실패");
				}, function errorCallback() {
					alert("교차로 수정 실패 (연결이 끊어졌거나 세션이 만료되었습니다)")
				});
	};
	
	// DELETE
	$scope.clearSection = function() {
		$scope.setCsrfToken();

		$http.delete('/STLC/api/sections').then(
				function successCallback() {
					$scope.refreshSections();
				}, function errorCallback(response) {
					console.log(response.data);
				});
	};
	
	$scope.removeSection = function(sectionId) {
		var b = confirm("삭제하시겠습니까?");
		if (!b)
			return;
		
		$scope.setCsrfToken();

		$http.delete('/STLC/api/sections/' + sectionId).then(
				function successCallback() {
					$scope.refreshSections();
				}, function errorCallback(response) {
					console.log(response.data);
				});
	};

});