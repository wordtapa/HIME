<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
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
	if(data=="yes"){
		alert("You can use this ID");
	}else{
		alert("You can't use this ID");
	}
}
</script>
<script type="text/javascript" src="/resources/js/userJoin.js"></script>
</head>
<body>
	<h1>Join</h1>
			<form action="/member/join" method ="post" onsubmit="return formCheck();">
			<table>
				<tr>
					<th>
						ID
					</th>
					<td>
						<input type ="text" id ="id" name = "id">
						<input type="button" value="IDCheck" onclick="idCheck();">
					</td>
					
				</tr>
				<tr>
					<th>
						PW
					</th>
					<td>
						<input type ="password" id ="password" name = "password">
					</td>
				</tr>
				<tr>
					<th>
						Name
					</th>
					<td>
						<input type = "text" id ="name" name="name">
					</td>
				</tr>
				<tr>
					<td>
						<input type = "submit" value = "submit">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
