<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> [ WORD LIST ] </h1>
	
		<c:if test="${empty wordList}">
			<table border ="1">
				<tr>
					<th>번호</th>
					<th>언어</th>
					<th>단어</th>
					<th>뜻</th>
					<th>문장</th>
					<th>설명</th>
					<th>암기</th>
					<th></th>
				</tr>
				<tr>
					<td colspan = "8">
						등록된 데이터가 없습니다.
					</td>
				</tr>
			</table>
			</c:if>
			
		<c:if test="${not empty wordList }"> 
			<table border ="1">
				<tr>
					<th>번호</th>
					<th>언어</th>
					<th>단어</th>
					<th>뜻</th>
					<th>문장</th>
					<th>설명</th>
					<th>암기</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach items ="${wordList }" var = "word">
				<tr>
					<td>${word.WORD_ORDER }</td>
					<c:if test="${word.LANGUAGE == '영어' }">
						<td>영어</td>
					</c:if>
					<c:if test="${word.LANGUAGE == '일본어' }">
						<td>일본어</td>
					</c:if>
					<td>${word.WORD }</td>
					<td>${word.WORD_KOR }</td>
					<td>${word.WORD_SENTENCE }</td>
					<td>${word.WORD_EXPLAIN }</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
			

</body>
</html>