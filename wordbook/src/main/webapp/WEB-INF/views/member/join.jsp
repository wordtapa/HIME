<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Join</title>
		
		<style type="text/css">
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
			
			.J_BTN>input, #idc{
				transition-duration: 0.4s;
				background-color: #ffe6cc;
				color: black; 
				border-radius: 6px;
				border: 1px solid #FFB6C1;
			}
			.J_BTN>input:hover, #idc:hover{
				background-color: white;
				border: 1px solid #FFB6C1;
			}
			td>input {
				width:200px;
				height:25px;
				font-size:15px;
			}
			div.J_BTN {
				margin: auto;
				width:200px;
			}
			
		
		</style>
		
		<script type = "text/javascript" src="/resources/js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
		
			function idCheck(){
				var id = $("input:text").val();
			 	if(id.length < 3 || id.length > 10){
			 		alert("Please enter your ID in 3 to 10 letters");
			 	 	return;
			 	 }	
			 	
			 	$.ajax({                                 
			  		url : "/member/idCheck"
			  		, type: "post"
			  		, data: {
			  			id: id
			  		}
			  		,success: successFunc  //function(data) {console.log(data);}
			  		,error: function(e) {console.log(e);}
			  	});
			}
					
			function successFunc(data){
				if(data == "yes"){
					alert("You can use this ID");
				}else{
					alert("You can't use this ID");
				}
			}
		</script>
		<script type="text/javascript" src="/resources/js/userJoin.js"></script>
	</head>
	<body>
		<img src="/resources/image/joinus.png">
		<br>
		<br>
		<form action="/member/join" method ="post" onsubmit="return formCheck();">
			<table>
				<tr>
					<th>
						ID
					</th>
					<td>
						<input type ="text" id ="id" name = "id" placeholder="You have to fill it out">
						<input type="button" id="idc" value="IDCheck" onclick="idCheck();" style="height:30px;">
					</td>
				</tr>
				<tr>
					<th>
						PW
					</th>
					<td>
						<input type ="password" id ="password" name = "password" placeholder="You have to fill it out">
					</td>
				</tr>
				<tr>
					<th>
						Name
					</th>
					<td>
						<input type = "text" id ="name" name="name" placeholder="You have to fill it out">
					</td>
				</tr>
			</table>
			<div class = "J_BTN">
				<input type = "submit" value = "SUBMIT" style="width:200px; height:40px; font-size:15px;">
			</div>
		</form>
	</body>
</html>
