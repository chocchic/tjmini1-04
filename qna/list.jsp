<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/>
<h1 align="center">문의 목록</h1>
<table>
	<tr>
		
	<tr> <!-- 위에 카테고리 안내 -->
		<td>No.</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>답변 여부</td>
	</tr>	


<c:forEach var="list" items="${list}">
	<tr> <!-- 글 리스트로 출력 -->
		<td>${list.qnum}</td>
		<td><a href="/qna/content?qnum=${list.qnum}">${list.qtitle}</a></td>
		<td><fmt:formatDate value="${list.rdate}" pattern="yyyy-MM-dd HH:MM"/></td>
		<td>
		<c:choose>
			<c:when test= "${list.is_replyed == 'y'}">답변 완료</c:when>
			<c:otherwise>답변 대기</c:otherwise>
		</c:choose>
		</td>
	</tr>	
</c:forEach>
</table>

<script>
	//글 작성후 list로 리다이렉트 되었을 때 alert 띄워주기
	let result="${result}";
	checkResult(result); 
	
	function checkResult(result){
		if(result === "delete success"){
			alert("삭제되었습니다.")
		}
		else if(result==="" ||history.state){
			return;
		}
	}
</script>


</body>
</html>