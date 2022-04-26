<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/>
<h1 align="center">리뷰</h1>
<table>
	<tr>
		<td>글 번호</td>
		<td>${review.rnum}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${review.rtitle}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${review.mid}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="30" disabled>${review.rcnt}</textarea></td>
	</tr>
	
	<tr>
		<td>리뷰 이미지</td>
		<td>
	<c:choose>
		<c:when test="${review.iname == null || review.iname == ''}">
        리뷰 이미지가 없습니다.
    </c:when>
	 <c:otherwise >
		<img src="/resources/save/${review.iname}" width="200"> 
	</c:otherwise>
	</c:choose>

	</td>
	</tr>
	<tr>
		<td>별점</td>
		<td>${review.rstar}</td>
	</tr>
	
	
	
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${review.rdate}" pattern="yyyy-MM-dd HH:MM"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="window.location='/review/modify?rnum=${review.rnum}'">수정</button>
			<button onclick="window.location='/review/delete?rnum=${review.rnum}'">삭제</button>
			<button onclick="window.location='/review/list'">리스트</button>
			
		</td>
	</tr>


</table>
</body>
</html>