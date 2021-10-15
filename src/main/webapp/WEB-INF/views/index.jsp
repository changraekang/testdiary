<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/ko.js"></script>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');
						var i = 0;
						while (i < 5 /*조건식*/) {
							console.log(i)
							i++; // 업데이트 코드
							var calendar = new FullCalendar.Calendar(
									calendarEl,
									{
										initialView : 'dayGridMonth',
										selectable : true,
										locale : 'ko',
										dateClick : function(info) {
											document.getElementById("date").value = info.dateStr;

											events: [ /* event data here */]
										},
										initialDate : '2021-10-12',
										/*  
										calendar.addEvent({
											title : i,
											start : '2021-10-06',
											end : '2021-10-07'
										})

										,
										 */
										dayMaxEventRows : true, // for all non-TimeGrid views
										dayMaxEventRows : 3, // adjust to 6 only for timeGridWeek/timeGridDay

										select : function(arg) {
											var title = prompt('Event Title:');
											if (title) {
												calendar.addEvent({
													title : title,
													start : arg.start,
													end : arg.end,
													allDay : arg.allDay
												})
											}
										},

										eventClick : function(arg) {
											if (confirm('Are you sure you want to delete this event?')) {
												arg.event.remove()
											}
										}

									});
						}

						calendar.render();
					});
</script>

<title>Insert title here</title>
</head>
<body>
	<h2>1달력12345</h2>
	<div id="calendar" style="float: left; width: 66%;"></div>

	<div id="diary" style="float: left; width: 33%;">
	<form action="/join" method="post">
		<div class="form-group">
			<input type="text" id="date" name="username" class="form-control"
				required="required" readonly="readonly">
		</div>
		<div class="form-group">
			<input type="text" name="username" class="form-control"
				placeholder="음식명을 입력해주세요" required="required" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="text" name="username" class="form-control"
				placeholder="kcal" required="required" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="text" name="username" class="form-control"
				placeholder="사진" required="required" maxlength="20">
		</div>
		
		<button type="submit" class="btn btn-primary">일기저장</button>
	</form>
	</div>
</body>
</html>