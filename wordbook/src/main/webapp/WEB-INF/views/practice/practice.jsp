<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<style type="text/css">
				th {
					background-color: #B0E0E6;
		  			color: black;
		  			padding: 5px;
				}
				table {
					text-align : center;
					border-collapse: collapse;
				    margin-left: auto;
				    margin-right: auto;
				}
				.paging, h1 {
					text-align: center;
				}
				.paging>a {
					text-decoration: none;
				}
				td>input, td>button, .writeBtn>input {
					transition-duration: 0.4s;
					background-color: #ffe6cc;
					color: black; 
					border-radius: 6px;
					border: 1px solid #FFB6C1;
				}
				td>input:hover, td>button:hover, .writeBtn>input:hover {
					background-color: white;
					border: 1px solid #FFB6C1;
				}
			
			
				</style>
				
				<script type="text/javascript" src = "/resources/js/jquery-3.4.1.js"></script>
				<script type="text/javascript">
				
				var A = 'A';
				    
				function like_func(word_order, favorite){
				
					
					$.ajax({
						url:"/word/favorite",
						type : "post",
						data : {
							word_order : word_order,
							favorite : favorite
						}
					,success : function() {
						alert(word_order); 
			 		 	console.log("favorite: " + favorite);
		
		 				if(favorite == 'A' ) {
		 					$("#like_img"+word_order).DataTable({
		 						columnDefs: [
		 							{targets:word_order, visible:false}
		 						]
		 					
		 					})
						}else {
							$("#like_img"+word_order+">img").attr("src", "/resources/image/heart.png");
						} 
					},
						error : function(e) {
							console.log(e);
					}
					   });
					} 
					
			</script>
</head>
<body>
	<h1> [ ${id}'s WORD PRACTICE ] </h1>

	<c:if test="${empty wordList}">
			<table border ="1">
				<tr>
					<th>🤍</th>
					<th>LANGUAGE</th>
					<th>WORD</th>
					<th>KOREAN</th>
					<th>SENTENCE</th>
					<th>EXPLAIN</th>
					<th>CLICK!</th>
				</tr>
				<tr>
					<td colspan = "7">
						등록된 데이터가 없습니다.
					</td>
				</tr>
			</table>
		</c:if>	
		
		<c:if test="${not empty wordList }"> 
			
			<table border ="1">
				<tr>
					<th>🤍</th>
					<th>LANGUAGE</th>
					<th>WORD</th>
					<th>KOREAN</th>
					<th>SENTENCE</th>
					<th>EXPLAIN</th>
					<th>CLICK!</th>
				</tr>
				
				<c:forEach items ="${wordList }" var = "word">
				<tr>
					<td>💜
					<input type = "hidden" name = "word_order" value = "${word.WORD_ORDER }"></td>
					<c:if test="${word.LANGUAGE == '영어' }">
						<td>ENGLISH</td>
					</c:if>
					<c:if test="${word.LANGUAGE == '일본어' }">
						<td>JAPANESE</td>
					</c:if>
					<td>${word.WORD }</td>
					<td>${word.WORD_KOR }</td>
					<td>${word.WORD_SENTENCE }</td>
					<td>${word.WORD_EXPLAIN }</td>
					<c:if test = "${word.FAVORITE == 'A' }">
				        <td>
							<button type = "button" id = "like_img${word.WORD_ORDER }" class ="like_img">
							<img src="/resources/image/emptyheart.png" onclick="like_func(${word.WORD_ORDER},${word.FAVORITE});" height ="25" width ="25">
							</button>
						</td>
					</c:if>
				</tr>
				</c:forEach>	
			</table>
		</c:if>
	<div class = "paging"> 	
	<c:if test="${navi.currentGroup > 0 }"> <!-- 1~5페이지 화살표 기능 없애기 -->
		<a href="/word/paging1?currentPage=1&id=${id}">
			&lt;&lt;
		</a>&nbsp;
		<a href="/word/paging1?currentPage=${navi.startPageGroup - 1 }&id=${id}"> 
			&lt;
		</a>&nbsp;
		</c:if>
		
		<!-- 현재 그룹 내 모든 페이지 표시 -->
		<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="page">
			<c:if test ="${page == navi.currentPage }">
			<a href="/word/paging1?currentPage=${page }&id=${id}" style="font-weight:bold;color:#DC143C;"> <!-- 현재 보고있는 페이지 라면 링크 빨간색으로 굵게 처리해라 -->
				${page }
			</a>&nbsp;
			</c:if>	
			
			<c:if test ="${page != navi.currentPage }">
			<a href="/word/paging1?currentPage=${page }&id=${id}" style="color:#87CEEB;"> <!-- 현재 보고있는 페이지 라면 링크 빨간색으로 굵게 처리해라 -->
				${page }
			</a>&nbsp;
			</c:if>	
		</c:forEach>
		
		<!-- 다음 그룹 이동 기능 -->
		<c:if test="${navi.totalPageCount != navi.endPageGroup}"> <!-- 1~5페이지 화살표 기능 없애기 -->
		<a href="/word/paging1?currentPage=${navi.endPageGroup + 1 }&id=${id}">
			&gt;
		</a>
		<a href="/word/paging1?currentPage=${navi.totalPageCount }&id=${id}">
			&gt;&gt;
		</a>&nbsp;
		</c:if>
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>

</body>
</html>