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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="css/view.css" rel="stylesheet" type="text/css">
</head>

<!-- 사원정보 목록 출력 -->
<script>
        function init(code){
                var form  = document.hmsForm;
                selectBox(form.dept, code);
        }

        function selectBox(sel, val){
                var selOptions = sel.options;
                var size = selOptions.length;
                for(var i = 0; i<size; i++){
                        if(selOptions[i].value == val){
                                selOptions[i].selected = true;
                                break;
                        }
                }
        }
 </script>
<body onload="javascript:init(${employeeinfo.dept})">
	<!-- 사원정보 상세보기 출력 -->
	<div class="container">
		<div class="panel panel-default shadow">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block center-block">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					</div>
					<div class="col-lg-7">
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col style="width: 30%" />
									<col style="width:;" />
								</colgroup>
								<tbody>
									<tr>
										<th>사원번호</th>
										<td>${employeeinfo.id}</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>${employeeinfo.name}</td>
									</tr>
									<tr>
										<th>부서</th>
										<td><select name="dept" disabled>
												<option value="01">기획팀</option>
												<option value="02">영업팀</option>
												<option value="03">개발팀</option>
										</select></td>
									</tr>
									<tr>
										<th>나이</th>
										<td>${employeeinfo.age}</td>
									</tr>
									<tr>
										<th>전화번호</th>
										<td>${employeeinfo.phone}</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${employeeinfo.email}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>${employeeinfo.addr}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<button type="button" class="btn btn-primary shadow" id="btn"
							onclick="location.href='employeeList.do'">목록</button>
						<button type="button" class="btn btn-primary shadow" id="btn"
							onclick="location.href='employeeModify.do?id=${employeeinfo.id}'">수정</button>
						<button type="button" class="btn btn-primary shadow" id="btn"
							onclick="location.href='employeeRemove.do?id=${employeeinfo.id}'">삭제</button>
					</div>

				</div>
			</div>
		</div>

	</div>



	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>