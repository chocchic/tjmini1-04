<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My QnA Content</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/>
<h1 align="center">나의 상품문의</h1>
<table width=350rpm>
	<tr>
		<td>문의 번호</td>
		<td>${qna.qnum}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${qna.qtitle}</td>
	</tr>
	<tr>
		<td>상품</td>
		<td>${qna.pname}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea rows="10" cols="30" disabled>${qna.qcnt}</textarea></td>
	</tr>
	
	<tr>
		<td>답변 여부</td>
		<td>
		<c:choose>
			<c:when test= "${qna.is_replyed eq'y'}">답변 완료</c:when>
			<c:otherwise>답변 대기</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${qna.rdate}" pattern="yyyy-MM-dd HH:MM"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="window.location='/qna/modify?qnum=${qna.qnum}'">수정</button>
			<button onclick="window.location='/qna/delete?qnum=${qna.qnum}'">삭제</button>
			<button onclick="window.location='/qna/list'">리스트</button> 
		</td>
	</tr>
</table>

<br/>
<br/>
<br/>


<table width=350rpm> 
	<tr>
		<td>답변</td>
	</tr>
	<c:choose>
		<c:when test= "${reply.qbno != null || reply.qbno != ''} "> 
		<tr>
			<td>
				${reply.qreply}
			</td>
		</tr>
		<tr>
			<td>
			<fmt:formatDate value="${reply.qrdate}" pattern="yyyy-MM-dd"/>
			</td>
		</tr></c:when>
		<c:otherwise>
		<tr>
			<td>
			등록된 답변이 없습니다. 
			</td>
		</tr>
		</c:otherwise>
		</c:choose>
</table>


</body>
</html>