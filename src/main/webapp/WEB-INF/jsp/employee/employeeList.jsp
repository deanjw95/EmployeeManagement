<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Spring Form 태그 라이브러리 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>CUSTOMER LIST</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link href="css/list.css" rel="stylesheet" type="text/css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="js/autoAdd.js" type="text/javascript"></script>
	<script src="js/autoRefresh.js" type="text/javascript"></script>
</head>

<!-- 사원정보 목록 출력 -->

<body>


	<div id="base" class="container shadow">

		<nav id="nav" class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">사원 관리</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">사원 리스트</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#contact">Contact</a></li>
				</ul>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="panel panel-default shadow">
					<div id="panel-head" class="panel-heading">
						<h3 class="panel-title">Employee Graph</h3>
					</div>
					<div class="panel-body">
						<div id="donutchart"></div>

					</div>
				</div>
			</div>

			<div class="col-lg-6 mb-4">
				<!-- commandName = modelAttribute -->
				<div class="panel panel-default shadow">
					<div id="panel-head" class="panel-heading">
						<h3 class="panel-title">Employee Table</h3>
					</div>
					<div class="panel-body">
						<div class="list">
							<table class="table table-striped" id="tbl">
								<colgroup>
									<col style="width: 20%" />
									<col style="width: 20%" />
									<col style="width: 20%" />
									<col style="width:;" />
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>부서</th>
										<th>이름</th>
										<th>주소</th>
									</tr>
								</thead>
								<tbody>
									<!-- 클래스에 저장된 변수 값을 매핑하여 출력 -->
									<tr>

									</tr>
								</tbody>
							</table>

							<button type="button" class="btn btn-primary shadow" id="btn"
								onclick="location.href='employeeAdd.do'">사원추가</button>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>



	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>