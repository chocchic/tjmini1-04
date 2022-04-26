<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WritingReviewPage</title>
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br/>
<h1 align="center">후기 작성</h1>


<form action = "/review/write" method="post" enctype="multipart/form-data">
        <table>
          <colgroup>
                <col width="15%" >
                <col width="*" >
            </colgroup>
            
                <tr>
                    <th>제목</th>
                    <td><input width = "100%" type="text"  name="rtitle" class="wdp_90" /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="100" rows="20" id="CONTENTS" name="rcnt" title="내용"></textarea></td>
                </tr>
           
        </table>
        <div align = "center" id="fileDiv">
            <p>
                <input type="file" name="img"/>
            </p> 
        </div>
		 
		         
		<div align="center">
		pnum <input type="text" name="pnum"> <!-- 나중에 컨텐트 페이지에 있을거....그때는 밸류에 담아주고 밸류에 값을 넣고 타입을 히든으로 변  -->
		mnum <input type="text" name="mnum"> <!-- 컨트롤러에서 찾을거..찾아서채워줌..나중에 이 태그는 없어진다.. principal이 내부에서 계속 들고있으니까 컨트롤러에서채워준 -->
		
		별점 
		<select name="rstar">
			<option value=0.0>0.0</option>
			<option value=0.5>0.5</option>
			<option value=1.0>1.0</option>
			<option value=1.5>1.5</option>
			<option value=2.0>2.0</option>
			<option value=2.5>2.5</option>
			<option value=3.0>3.0</option>
			<option value=3.5>3.5</option>
			<option value=4.0>4.0</option>
			<option value=4.5>4.5</option>
			<option value=5.0>5.0</option>
		</select><br/>

		<input type="button" value="취소" onclick="window.location='/review/list'">
		<input type="submit" value="저장">
		</div>
    </form>
    

</body>
</html>