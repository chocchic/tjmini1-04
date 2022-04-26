<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Writing QnA Page</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/>
<h1 align="center">문의 답변 작성</h1>


<form action = "/adminQna/write" method="post">
<table>
	<colgroup>
		<col width="15%" >
		<col width="*" >
    </colgroup>
            
	<tr>
		<td>내용</td>
		
		<td><textarea cols="50" rows="20" name="qreply"></textarea></td>
	</tr>
<tr align="center">
	<td colspan=2>
		<input type="hidden" name="qnum" value="${qna.qnum}"/>
		<input type="button" value="취소" onclick="window.location='/adminQna/content?qnum=${qna.qnum}'"/> 
		<input type="submit" value="저장"/>
	</td>
</tr>
	
</table>

</form>
</body>
</html>