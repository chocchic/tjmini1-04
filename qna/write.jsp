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
<h1 align="center">문의 작성</h1>


<form action = "/qna/write" method="post">
        <table>
          <colgroup>
                <col width="15%" >
                <col width="*" >
            </colgroup>
            
                <tr>
                    <th>제목</th>
                    <td><input width = "100%" type="text" name="qtitle"/></td>
                </tr>
                <tr>
                	<td>카테고리</td>
                	<td>
                	<select name="qcat">
						<option value='상품'>상품 문의</option>
                	</select></td>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="20" name="qcnt" title="내용"></textarea></td>
                </tr>
           
        </table>

		 
		         
		<div align="center">
		상품 번호 <input type="text" name="qpnum"> <!-- 나중에 컨텐트 페이지에 있을거....그때는 밸류에 담아주고 밸류에 값을 넣고 타입을 히든으로 변  -->
		작성자 <input type="text" name="qmnum"> <!-- 컨트롤러에서 찾을거..찾아서채워줌..나중에 이 태그는 없어진다.. principal이 내부에서 계속 들고있으니까 컨트롤러에서채워준 -->
		


		<input type="button" value="취소" onclick="window.location='/review/list'"> <!-- 취소하면 상품 상세 페이지로 보내주기..이은 다음 수정 -->
		<input type="submit" value="저장">
		</div>
    </form>
    

</body>
</html>




