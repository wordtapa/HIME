<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WORD UPDATE</title>
		<script type="text/javascript" src = "/resources/js/updateword.js"></script>
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
			input {
				width:200px;
				height:20px;
				font-size:15px;
			}
		</style>
	</head>
	<body>
		<h1>[ WORD UPDATE ]</h1>
		<form action = "/word/updateWord" method = "post" onsubmit ="return formCheck_1();">
			<table>
				<tr>
					<td>LANGUAGE</td>
					<td>
					<select id = "language" name = "language" style="width:208px; height:25px; font-size:15px;">
						<c:if test = "${word.language == '영어' }">
							<option value = "영어" selected="selected">영어</option>
							<option value = "일본어">일본어</option>
						</c:if>	
						<c:if test = "${word.language == '일본어' }">
							<option value = "영어">영어</option>
							<option value = "일본어"  selected="selected">일본어</option>
						</c:if>	
					</select>
					</td>
				</tr>
				<tr>
					<td>WORD</td>
					<td><input type = "text" id="word" name = "word" value = "${word.word }" placeholder="You have to fill it out"></td>
				</tr>
				<tr>
					<td>MEANING</td>
					<td>
						<input type ="text" id="word_kor" name="word_kor" value = "${word.word_kor }" placeholder="You have to fill it out">
					</td>
				</tr>
				<tr>
					<td>SENTENCE</td>
					<td>
						<input type ="text" id="word_sentence" name="word_sentence" value = "${word.word_sentence }">
					</td>	
				</tr>
				<tr>
					<td>EXPLAIN</td>
					<td>
						<input type ="text" id="word_explain" name="word_explain" value = "${word.word_explain }">
					</td>		
				</tr>
			</table>
			<br>
			<div class = "J_BTN">
				<input type = "hidden" name ="id" value ="${word.id }">
				<input type = "hidden" name="currentPage" value = "${currentPage }">
				<input type = "hidden" name ="word_order" value = "${word.word_order }">
				<input type= "submit" value = "UPDATE" style="width:200px; height:30px; font-size:15px;">
			</div>
		</form>
	</body>
</html>