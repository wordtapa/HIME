<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WORD WRITE</title>
		<script type="text/javascript" src = "/resources/js/writeword.js"></script>
	</head>
	<body>
	
	<h1> [ WORD WRITE ]</h1>
		<form action="/word/writeWord" method = "post" onsubmit ="return formCheck();">
			<table>
				<tr>
					<td>LANGUAGE</td>
					<td>
						<select name = "language">
							<option value="영어">영어</option>
							<option value="일본어">일본어</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>WORD</td>
					<td>
						<input type ="text" id="word" name="word">
					</td>
				</tr>
				<tr>
					<td>MEANING</td>
					<td>
						<input type ="text" id="word_kor" name="word_kor">
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
			<input type="submit" value="ENTER">
			<input type = "hidden" name="currentPage" value = "${currentPage }">
			<input type="hidden" name="id" value="${sessionScope.id }">
		</form>
	</body>
</html>
