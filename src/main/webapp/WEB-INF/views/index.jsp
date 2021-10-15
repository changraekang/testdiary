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
	function loadFile(input) {
		var file = input.files[0]; //선택된 파일 가져오기
		/*  
		 */
		//미리 만들어 놓은 div에 text(파일 이름) 추가
		//새로운 이미지 div 추가
		//document.getElementById('image-upload').style.visibility = 'hidden';

		var newImage = document.createElement("img");
		newImage.setAttribute("class", 'img');

		//이미지 source 가져오기
		newImage.src = URL.createObjectURL(file);

		newImage.style.width = "70%";
		newImage.style.height = "70%";
		newImage.style.objectFit = "contain";

		//이미지를 image-show div에 추가
		var container = document.getElementById('image-show');
		$("#image-show").attr("src",newImage );
	};
</script>
<style>
#chooseFile {
	visibility: hidden;
}
</style>
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
			<div class="image-upload" id="image-upload">

				<div class="button">
					<label for="chooseFile"> 👉 CLICK HERE! 👈 </label>
				</div>
				<input type="file" id="chooseFile" name="chooseFile"
					accept="image/*" onchange="loadFile(this)">
			</div>
			<div class="image-show" id="image-show"></div>
			<button type="submit" class="btn btn-primary">일기저장</button>
		</form>



		<div class="container">
			<form method="post" enctype="multipart/form-data"></form>
		</div>
	</div>
</body>
</html>