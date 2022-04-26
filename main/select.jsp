<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select test</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<!--  <link href="/resources/css/main.css" rel="stylesheet" type="text/css">-->
</head>
<body>
<h1 align="center">좋아요순 추천</h1>
<c:forEach var="select" items="${recommList}">
	<tr> 
		<td><img src="/resources/save/${select.thumb}" width="200"></td>
	</tr>	
	<tr>
		<td>좋아요: ${select.phearts}</td>
	<tr>
		<td>${select.pname}</td>
	</tr>
</c:forEach>

<!--  
<div class="ls_wrap">
	<div class="ls_div_subject" align="center">
		추천 상품
	</div>
	<div class="ls_div">
		<c:forEach items="${ls}" var="ls">
			<div class="ls_div_content_wrap">
				<div class="ls_div_content">
					<div class="image_wrap">
						<img src="/resources/save/${select.thumb}">
					</div>				
					<div class="ls_hearts">
						${ls.phearts}
					</div>
					<div class="ls_pname">
						${ls.pname}
					</div>							
				</div>
			</div>
									
		</c:forEach>					
		</div>
	</div>
	-->

</body>
</html>