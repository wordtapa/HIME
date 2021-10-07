<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LOGIN</title>
		<script type="text/javascript" src = "/resources/js/member/memberlogin.js"></script>
	</head>
	<body>
		<h1> [ LOGIN ] </h1>
		
		<form action="/member/login" method = "post" onsubmit = "return formCheck2();">
			<table>
				<tr>
					<th>ID</th>
					<td>
						<input type = "text" id = "id" name = "id" >
					</td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td>
						<input type = "password" id = "password" name = "password" >
					</td>
				</tr>
			</table>
			<input type ="submit"  id = "button2" value ="LOGIN" >
			</form>
	</body>
</html>