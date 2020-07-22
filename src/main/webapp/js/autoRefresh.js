
$(document).ready(function () {
	
	googleGraph(getDept(), getDeptNum());
	setInterval(function () {
		googleGraph(getDept(), getDeptNum());
	}, 1000);
});

function getDept() {

	var dept = "";
	
	$.ajax({
		url: "getDept.do",
		type: "GET",
		async: false,
		success: function (data) {
			for (key in data)
				if (data[key] == "01")
					data[key] = "기획팀";
				else if (data[key] == '02')
					data[key] = "운영팀";
				else
					data[key] = "개발팀";
			dept = data;
		},
		error: function () {
			alert("autoRefreshGraph err");
		}
	});
	return dept;
}

function getDeptNum() {
	var deptnum = "";

	$.ajax({
		url: "getDeptNum.do",
		type: "GET",
		async: false,
		success: function (data) {
			deptnum = data;
		},
		error: function () {
			alert("autoRefreshGraph err");
		}
	});

	return deptnum;
}

function googleGraph(dept, deptnum) {

	google.charts.load("current", { packages: ["corechart"] });
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', '부서');
		data.addColumn('number', '부서 비율');
		for (key in dept) {
			data.addRow([dept[key], deptnum[key]]);
		}

		var options = {
			title: '부서 비율',
			pieHole: 0.3,
		};

		var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
		chart.draw(data, options);
	}
}