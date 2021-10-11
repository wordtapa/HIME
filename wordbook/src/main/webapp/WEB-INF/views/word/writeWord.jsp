<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WORD WRITE</title>
		<script type="text/javascript" src = "/resources/js/writeword.js"></script>
		<style type="text/css">
			h1 {
				text-align: center;
				margin-top:100px;
			}
			table {
				margin-left:auto; 
		   		margin-right:auto;
		   		margin-top:40px;
				border-spacing: 60px 10px;
		 		border-collapse: separate;
			}
			input {
				width:200px;
				height:20px;
				font-size:15px;
			}
			div.J_BTN {
				margin: auto;
				width:200px;
			}
			.J_BTN>input{
				transition-duration: 0.4s;
				background-color: #ffe6cc;
				color: black; 
				border-radius: 6px;
				border: 1px solid #FFB6C1;
			}
			.J_BTN>input:hover {
				background-color: white;
				border: 1px solid #FFB6C1;
			}
		
		
		</style>
	</head>
	<body>
	
	<h1> [ WORD WRITE ]</h1>
		<form action="/word/writeWord" method = "post" onsubmit ="return formCheck();">
			<table>
				<tr>
					<td>LANGUAGE</td>
					<td>
						<select name = "language" style="width:208px; height:25px; font-size:15px;">
							<option value="영어">영어</option>
							<option value="일본어">일본어</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>WORD</td>
					<td>
						<input type ="text" id="word" name="word" placeholder="You have to fill it out">
					</td>
				</tr>
				<tr>
					<td>MEANING</td>
					<td>
						<input type ="text" id="word_kor" name="word_kor" placeholder="You have to fill it out">
					</td>
				</tr>
				<tr>
					<td>SENTENCE</td>
					<td>
						<input type ="text" id="word_sentence" name="word_sentence">
					</td>	
				</tr>
				<tr>
					<td>EXPLAIN</td>
					<td>
						<input type ="text" id="word_explain" name="word_explain">
					</td>
					
				</tr>
			</table>
			<br>
			<div class = "J_BTN">
				<input type="submit" value="ENTER" style="width:200px; height:30px; font-size:15px;">
				<input type = "hidden" name="currentPage" value = "${currentPage }">
				<input type="hidden" name="id" value="${sessionScope.id }">
			</div>
		</form>
	</body>
</html>
