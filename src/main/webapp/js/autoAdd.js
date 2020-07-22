$(document).ready(function () {
	autoRefreshList();

	setInterval(function () {
		autoAddEmployee();
	}, 1000);
});

function jsonTest() {
	$.ajax({
		url: "test.do",
		type: "GET",
		success: function (data) {
			for (key in data) {
				console.log(data[key].id);
			}
		},
		error: function () {
			console.log("jsonTest err");
		}
	});
}

function autoRefreshList() {
	$.ajax({
		url: "autoRefreshList.do",
		type: "GET",
		success: function (data) {
			
			$("#tbl td").remove();
			for (key in data) {
				autoAddTableRow(data[key]);
			}
		},
		error: function () {
			console.log("jsonTest err");
		}
	});
}

function autoAddEmployee() {
	var employee = {
		id: "",
		name: "mancity",
		age: 26,
		dept: "01",
		phone: "010-1234-5678",
		email: "deanjw95@naver.com",
		addr: "경기도 과천시"
	}
	$.ajax({
		url: "autoAddEmployee.do",
		type: "POST",
		data: JSON.stringify(employee),
		contentType: "application/json; charset=utf-8;",
		dataType: "json",
		success: function (data) {
			autoRefreshList();
		},
		error: function () {
			alert("autoAddEmployee err");
		}
	});
}

function autoAddTableRow(data) {

	if (data.dept == "01")
		data.dept = "기획팀";
	else if (data.dept == '02')
		data.dept = "운영팀";
	else
		data.dept = "개발팀";

	$('#tbl').append(
		$('<tr>').append(
			$('<td>').append(
				// property와 attribute의 차이!!
				$('<a>').prop('href',
					'employeeView.do?id=' + data.id).append(
						data.id)
				// <a href="#" class="delete-link">Delete</a>
				// <a
				// href="employeeView.do?id=${employeeinfo.id}">${employeeinfo.id}</a>
			), $('<td>').append(data.dept),
			$('<td>').append(data.name), 
			$('<td>').append(data.addr)
		));
}