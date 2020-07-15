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
<link href="css/add.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- 사원정보 입력 폼 출력 -->
	<!-- Model 클래스와 @Attribute로 바인딩을 위한 매핑을 정의하고 submit 시의 action 정의 -->
	<div class="container">
		<div class="panel panel-default shadow">
			<div id="panel-head" class="panel-heading">Employee Add</div>
			<div class="panel-body">
				<form:form commandName="employee" action="employeeAdd.do">
					<div id="wrap">
						<table class="tbl_View">
							<colgroup>
								<col style="width: 30%" />
								<col style="width:;" />
							</colgroup>
							<tbody>
								<tr>
									<th>사원번호</th>
									<!-- 입력은 spring의 form:input 태그 활용 -->
									<td><form:input path="id" type="text" size="63" class="form-control" maxlength="20" /></td>
								</tr>
								<tr>
									<th>부서</th>
									<td><form:select path="dept" class="form-control">
											<form:option selected="selected" value="">상위부서를 선택하세요.</form:option>
											<form:option value="01">기획팀</form:option>
											<form:option value="02">영업팀</form:option>
											<form:option value="03">개발팀</form:option>
										</form:select></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><form:input path="name" type="text" size="63" class="form-control" width="50%"
											maxlength="20" /></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><form:input path="age" type="text" size="63" class="form-control"
											maxlength="20" /></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><form:input path="phone" type="text" size="63" class="form-control"
											maxlength="20" /></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><form:input path="email" type="email" size="63" class="form-control"
											maxlength="30" /></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><form:input path="addr" type="text" size="63" class="form-control"
											maxlength="20" /></td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-primary shadow" id="btn" onclick="location.href='employeeList.do'">목록</button>
						<button type="submit" class="btn btn-primary shadow" id="btn">저장</button> 
					</div>
				</form:form>
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