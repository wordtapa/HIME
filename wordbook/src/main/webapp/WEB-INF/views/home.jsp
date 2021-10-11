<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>[WORDTAPA]</title>
	</head>
	<style type="text/css">

		img {
			width : 41%;
			height : auto;
			float: left;
		}
		.btn{ 
	      text-decoration: none;
	      font-size:2.5rem;
	      color:black;
	      padding:10px 20px 10px 20px;
	      margin: 20px;
	      display:inline-block;
	      border-radius: 10px;
	      transition:all 0.1s;
	      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
	      font-weight:lighter;
	      font-family: fantasy; 
	      letter-spacing: 5px;
	      word-spacing: 5px;
	    }
	    .btn.puple{
	      background-color: #FFF0F5;
	      border-bottom:5px solid #DDA0DD;
	    }
	    .btn.puple:hover {
	      border-bottom:2px solid #FFF0F5;
	    }
	    .btn.pink{
	      background-color: #ffe6cc;
	      border-bottom:5px solid pink;
	    }
	    .btn.pink:hover{
	      border-bottom:2px solid #ffe6cc;
	    }
	    .btn.blue{
	      background-color: #F0F8FF;
	      border-bottom:5px solid #6495ED;
	    }
	    .btn.blue:hover{
	      border-bottom:2px solid #F0F8FF;
	    }
        .btn:active{
          transform: translateY(3px);
	    }
	    ul>li {
			list-style: none;
			text-align: center;
			padding:10px;
			box-sizing : border-box;
			position: relative;
			top: 300px;
		}

	</style>
	
	<body>
	<div class ="image">
		<img src="/resources/image/My Post.png">
	</div>
		<c:if test="${empty sessionScope.id }">
			<ul>
				<li><a class="btn puple" href = "/member/join">JOIN</a></li>
				<li><a class="btn pink" href = "/member/login">LOGIN</a></li>
			</ul>
		</c:if>
		<c:if test="${not empty sessionScope.id }">
		<ul>
			<li><a class="btn puple" href = "/word/wordList?id=${id }&currentPage=1">WORD LIST</a></li>
			<li><a class="btn pink" href = "/word/practice?id=${id }">WORD PRACTICE</a></li>
			<li><a class="btn blue" href ="/member/logout">LOGOUT</a></li>
		</ul>
		</c:if>
	</body>
</html>