<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>[WORDTAPA]</title>
	</head>
	<body>
		<h1>  WORDTAPA  </h1>
	
	<c:if test="${empty sessionScope.id }">
		<ul>
			<li><a href = "/member/join">JOIN</a></li>
			<li><a href = "/member/login">LOGIN</a></li>
			
		</ul>
	</c:if>
	<c:if test="${not empty sessionScope.id }">
	<ul>
		<li><a href = "/word/wordList?id=${id }&currentPage=1"">WORD LIST</a></li>
		<li><a href = "/word/practice?id=${id }">WORD PRACTICE</a></li>
		<li><a href ="/member/logout">LOGOUT</a></li>
	</ul>
	</c:if>
	</body>
</html>