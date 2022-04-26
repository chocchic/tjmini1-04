<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select by Star</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>
<h1 align="center">별점순 추천</h1>
<c:forEach var="list" items="${recommList}">
	<tr> 
		<td><img src="/resources/save/${list.thumb}" width="200"></td>
	</tr>	
	<tr>
		<td>${list.pname}</td>
	</tr>
</c:forEach>
</body>
</html>