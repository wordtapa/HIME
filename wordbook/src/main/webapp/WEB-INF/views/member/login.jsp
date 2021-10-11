<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LOGIN</title>
		<style type="text/css">
			.Btn {
				text-align: center;
			}
			img {
				width: 100%;
				height : auto;
			}
			table {
				margin-left:auto; 
		   		margin-right:auto;
				border-spacing: 20px 10px;
		 		border-collapse: separate;
			}
				
			.Btn>input{
				transition-duration: 0.4s;
				background-color: #ffe6cc;
				color: black; 
				border-radius: 6px;
				border: 1px solid #FFB6C1;
			}
			
			.Btn>input:hover{
				background-color: white;
				border: 1px solid #FFB6C1;
			}
			input {
				width:200px;
				height:30px;
				font-size:15px;
			}
			
		</style>
		<script type="text/javascript" src = "/resources/js/memberlogin.js"></script>
	</head>
	
	<body>
		<img src="/resources/image/banner.png">
			<br>
			<br>
		<form action="/member/login" method = "post" onsubmit = "return formCheck_3();">
			<table>
				<tr>
					<th>ID</th>
					<td>
						<input type = "text" id = "id" name = "id" placeholder="ID" >
					</td>
				</tr>
				<tr>
					<th>PASSWORD</th>
					<td>
						<input type = "password" id = "password" name = "password" placeholder="PASSWORD">
					</td>
				</tr>
			</table>
			<br>
			<div class ="Btn">
				<input type ="submit" value ="LOGIN" style="width:200px; height:30px; font-size:15px;">
			</div>
		</form>
	</body>
</html>