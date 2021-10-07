<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WORD UPDATE</title>
</head>
<body>
	<h1>[ WORD UPDATE ]</h1>
	<form action = "/word/updateWord" method = "post">
	<table>
		<tr>
			<td>LANGUAGE</td>
			<td>
			<select id = "language" name = "language">
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
			<td><input type = "text" id="word" name = "word" value = "${word.word }"></td>
		</tr>
		<tr>
			<td>MEANING</td>
			<td>
				<input type ="text" id="word_kor" name="word_kor" value = "${word.word_kor }">
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
	<input type = "hidden" name ="id" value ="${word.id }">
	<input type = "hidden" name="currentPage" value = "${currentPage }">
	<input type = "hidden" name ="word_order" value = "${word.word_order }">
	<input type= "submit" value = "UPDATE">
	</form>
</body>
</html>