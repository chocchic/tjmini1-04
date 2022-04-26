<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
    <title>VegeKit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/modal.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    
  </head>
<body>
	<!-- Start Main Top -->
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">VegeKit</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="/shop/list" class="nav-link">SHOP</a></li>
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" onclick="window.location='/common/login'">LOGIN</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form action="/logout" method="post" style="display: inline-block;">
						<li class="nav-item"><a class="nav-link" onclick="window.location='/common/main'">LOGOUT</a></li>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
						</sec:authorize>
				<li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
	         	<li class="nav-item cta cta-colored"><a href="/shop/cart" class="nav-link"><span class="icon-shopping_cart"></span></a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="shop/main">Home</a></span> <span class="mr-2"><a href="shop/list">Product</a></span> <span>Product Single</span></p>
            <h1 class="mb-0 bread">Product Single</h1>
          </div>
        </div>
      </div>
    </div>
    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="/resources/imgs/${shop.thumb}.jpg" class="image-popup"><img src="/resources/imgs/${shop.thumb}.jpg" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${shop.pname}</h3>
    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="review" class="mr-2">${shop.pstar}</a>
							</p>
							<p class="text-left mr-4">
								<a href="review" class="mr-2" style="color: #000;">NaN <span style="color: #bbb;">Rating</span></a>
							</p>
							<p class="text-left">
								<a href="review" class="mr-2" style="color: #000;">NaN <span style="color: #bbb;">Sold</span></a>
							</p>
							<p class="text-left">
								<a class="mr-2" style="color: #000;">${shop.pstock} <span style="color: #bbb;">Stock</span></a>
							</p>
						</div>
    				<div class="pricing">
						<p class="price">
							<c:if test="${shop.is_sale=='Y'}"> <span class="mr-2 price-dc"><fmt:formatNumber value="${shop.pprice}" type="currency"/></span><span class="price-sale"><fmt:formatNumber value="${shop.pprice*9/10}" type="currency"/></span></c:if>
                        	<c:if test="${shop.is_sale=='N'}"> <fmt:formatNumber value="${shop.pprice}" type="currency"/></c:if>
						</p>
					</div>
						<div class="row mt-4">
							<div class="col-md-6">
								<div class="form-group d-flex">
								<p>채식 단계 : ${cart.pdiet}<br/>
						        		포함 영양소 : <c:if test="${shop.pnutr1} != null">${shop.pnutr1}</c:if>
						        		<c:if test="${shop.pnutr2} != null">&nbsp;${shop.pnutr2}</c:if>
						        		<c:if test="${shop.pnutr3} != null">&nbsp;${shop.pnutr3}</c:if>
		              <div class="select-wrap">
	                 <%--  <div class="icon"><span class="ion-ios-arrow-down"></span></div>--%>
	                </div>
		            </div>
					</div>
							<div class="w-100"></div>
							<div class="input-group col-md-6 d-flex mb-3">
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="10">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
	                     <i class="ion-ios-add"></i>
	                 </button>
	             	</span>
	          	</div>
          	</div>
          	<p><a id="addCartBtn" class="btn btn-black py-3 px-5">Add to Cart</a></p>
          	<p><a id="SubBtn" class="btn btn-black py-3 px-5">Subscribe</a></p>
    		</div>
    		</div>
    	</div>
    </section>
    <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<li><a id="detailBtn" class="active">Detail</a></li>
    					<li><a id="reviewBtn">Review : ${reviewcount}</a></li>
    					<li><a id="qnaBtn">QnA : ${qnacount}</a></li>
    				</ul>
    			</div>
			</div>
	<div class="inner">
		
		<div class="reply_list_container">
		</div>
		
		<%-- #7. 댓글 페이지 번호 띄울 div 추가  --%>
		<div class="replyPaging">
		
		</div>
	</div>
	</div>
	</section>			
	<%-- 문의나 qna 작성하러 갔다와도 보고있던 상품으로 인도해줄 애들 --%>	
	<form action="#고치기" method="get" > 
		<input type="hidden" name="pnum" value="${shop.pnum}" />
	</form>
	
	
	
	<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	  <script src="/resources/js/jquery.min.js"></script>
	  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	  <script src="/resources/js/popper.min.js"></script>
	  <script src="/resources/js/bootstrap.min.js"></script>
	  <script src="/resources/js/jquery.easing.1.3.js"></script>
	  <script src="/resources/js/jquery.waypoints.min.js"></script>
	  <script src="/resources/js/jquery.stellar.min.js"></script>
	  <script src="/resources/js/owl.carousel.min.js"></script>
	  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
	  <script src="/resources/js/aos.js"></script>
	  <script src="/resources/js/jquery.animateNumber.min.js"></script>
	  <script src="/resources/js/bootstrap-datepicker.js"></script>
	  <script src="/resources/js/scrollax.min.js"></script>
	  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	  <script src="/resources/js/google-map.js"></script>
	  <script src="/resources/js/main.js"></script>
	  <script type="text/javascript" src="/resources/js/reply.js" ></script>
	<script type="text/javascript">
	$(document).ready(function(){
		// 숨김 폼태그 가져오기 
		let formObj = $("form"); 
		$("button.btn").click(function(e){
			e.preventDefault(); 
			let operation = $(this).data("oper");
			
			if(operation === 'delete'){
				formObj.attr("action", "/board/delete"); 
			}else if(operation === 'list'){
				formObj.attr("action", "/board/list"); 
			}
			
			formObj.submit(); // 이동 
			
		}); 
		
		
	// 수량 -+ 버튼
	var quantitiy=0;
	   $('.quantity-right-plus').click(function(e){
	        
	        // Stop acting like a button
	        e.preventDefault();
	        // Get the field name
	        var quantity = parseInt($('#quantity').val());
	        
	        // If is not undefined
	            
	            $('#quantity').val(quantity + 1);

	          
	            // Increment
	        
	    });

	     $('.quantity-left-minus').click(function(e){
	        // Stop acting like a button
	        e.preventDefault();
	        // Get the field name
	        var quantity = parseInt($('#quantity').val());
	        
	        // If is not undefined
	      
	            // Increment
	            if(quantity>0){
	            $('#quantity').val(quantity - 1);
	            }
	    });
	     
	  
	     let pnumVal = '<c:out value="${shop.pnum}" />';
	 	let list_container = $(".reply_list_container");
	 	
	 	function showImg(iname){
			list_container.empty();
	 		list_container.html("<div class='reply_li'><img src='/resources/imgs/"+iname+"'></div>");
	 		$(".replyPaging").empty();
	 	}

	 	//전체 리뷰 목록 가져와 뿌리기(댓글 페이지번호 주면서) 
	 	function showList(page,type){
	 		console.log("page : " + page); 
	 		console.log("type(0=상품 디테일, 1= reveiw,2=qna) : "+type);
	 		// 전체 댓글 가져오는 js 함수 호출 
	 		//replyService.getList({bno:bnoVal, page:page||1}, function(data){ // data = 서버에서 전달해준 댓글 리스트 
	 		// #6. callback 함수 매개변수 수정, 안쪽 코드 수정/추가 
	 		if(type==1){
	 			replyService.getReviewList({pnum:pnumVal, page:page||1}, function(replyCount, data){ // replyCount, data 매개변수 2개로 수정  
	 				// #6. 추가 
	 				console.log("replyCount : " + replyCount);
	 				console.log("data : " + data);
	 				if(data == null || data.length == 0){
	 					
	 					<%--<sec:authorize access="isAuthenticated()">
	 					<div class="reply_box">
	 						<textarea rows="3"></textarea>
	 						<input type="text" placeholder="작성자" value='<sec:authentication property="principal.mnum"/>' readonly="readonly"/>
	 						<button onclick="window.location='#고치기'">QnA 작성</button>
	 					</div>
	 				</sec:authorize>--%>
	 					list_container.html("<div class='reply_add'><button class='addBtn' id=1>리뷰 작성하기</button></div><div class='reply_li'>리뷰가 없습니다</div>");
	 					return; // 아래는 실행할 필요없으니 강제 종료 
	 				}
	 				console.log(data);
	 				let str = ""; // 화면에 띄울 댓글 tr묶음 html을 만들어서 저장해놓을 변수
	 				str += "<div class='reply_add'><button class='addBtn' id=1>리뷰 작성하기</button></div>";
	 				let len = data.length || 0; 
	 				// 댓글 목록 받아온 것 화면 띄우기위해 html 형태의 문자열로 구성 
	 				for(let i = 0; i < len; i++){
	 					str += "<div class='reply_li' data-rno='"+data[i].rnum+"' >";
	 					str += "<div class='replytitle'>"+data[i].rtitle+"</div>";
	 					str += "<div class='replyer'>"+data[i].mid+"</div>";
	 					str += "<div class='replyDate'>"+replyService.displayTimeFormat(data[i].rdate)+"</div>";
	 					str += "<div class='rstars'>"+data[i].rstar+"</div>";
	 					str += "<div class='reply_btns'>";
	 					str += "<button class='modifRBtn'>수정</button><button class='RemoveRBtn'>삭제</button></div></div></div>";
	 				}
	 				
	 				list_container.html(str); // list_container div 태그 안을 댓글목록만들어놓은 str로 변경 
	 				// #9. 댓글 페이징번호 띄우기 함수 호출 
	 				showReplyPaging(replyCount, type);
	 				
	 			});
	 		}// replyService.getList
	 		if(type==2){
	 			replyService.getQnaList({pnum:pnumVal, page:page||1}, function(replyCount, data){ // replyCount, data 매개변수 2개로 수정  
	 				// #6. 추가 
	 				console.log("replyCount : " + replyCount);
	 				console.log("data : " + data);

	 				if(data == null || data.length == 0){
	 					list_container.html("<div class='reply_add'><button class='addBtn' id=2>문의 작성하기</button></div><div class='reply_li'>문의가 없습니다</div>");
	 					return; // 아래는 실행할 필요없으니 강제 종료 
	 				}
	 				console.log(data);
	 				let str = ""; // 화면에 띄울 댓글 tr묶음 html을 만들어서 저장해놓을 변수 
	 				str += "<div class='reply_add'><button class='addBtn' id=2>문의 작성하기</button></div>";
	 				let len = data.length || 0; 
	 				// 댓글 목록 받아온 것 화면 띄우기위해 html 형태의 문자열로 구성 
	 				for(let i = 0; i < len; i++){
	 					str += "<div class='reply_li' data-rno='"+data[i].qnum+"' >";
	 					str += "<div class='replytitle'>"+data[i].qtitle+"</div>";
	 					str += "<div class='replyer'>"+data[i].mid+"</div>";
	 					str += "<div class='replyDate'>"+replyService.displayTimeFormat(data[i].rdate)+"</div>";
	 					if(data[i].is_replied =="Y"){
	 						str += "<div class='is_replyed'><img src='/resources/images/checkboximg.jpg'/></div>";
	 					}
	 					str += "<div class='reply_btns'>";
	 					str += "<button class='modifRBtn'>수정</button><button class='RemoveRBtn'>삭제</button></div></div></div>";
	 				}
	 				
	 				list_container.html(str); // list_container div 태그 안을 댓글목록만들어놓은 str로 변경 
	 				// #9. 댓글 페이징번호 띄우기 함수 호출 
	 				showReplyPaging(replyCount, type);
	 				
	 			});
	 		}
	 	}// showList

		// #8. 댓글 페이지 번호 출력 로직 추가 
		let pageNum = 1; 
		let replyPaging = $(".replyPaging");  // 댓글 페이지번호 띄울 div 태그 가져오기 
		function showReplyPaging(replyCount, type) {
				let endNum = Math.ceil(pageNum / 10.0) * 10;  // 마지막 페이지 번호 (일단 10개로 보이게) 
				let startNum = endNum - 9; 	// 시작 페이지 번호 
				let prev = startNum != 1;  	// 이전버튼  보일지 여부 
				let next = false; 			// 다음버튼 일단 false
				if(endNum * 10 >= replyCount) { // 페이지 번호 10개에 보여줘야되는 댓글수보다 전체 댓글 수가 적거나 같으면 
					endNum = Math.ceil(replyCount / 10.0); // 마지막 페이지 번호를 전체 나오는 페이지 수로 변경 
				}
				if(endNum * 10 < replyCount) { // 지금 보는 마지막 페이지번호에 보여줄 댓글수 보다 전체 댓글 수가많으면  
					next = true; //next 보여주기 값을 변경 
				}
				// 페이지 번호 띄워줄 html 구성 
				let str = "<div class='replyPaing_content'>";
				if(prev) {
					str += "<a id='"+type+"'class='paging_link' href='"+(startNum-1)+"'> prev </a> ";
				}
				for(let i = startNum; i <= endNum; i++){
					str += "<a id='"+type+"'class='paging_link' href='"+i+"'>&nbsp; "+i+" &nbsp;</a>";
				}
				if(next){
					str += " <a id='"+type+"'class='paging_link' href='"+(endNum+1)+"'> next </a></div>";
				}
				
				replyPaging.html(str);
				// => showList에 showReplyPaging() 호출 추가 
			} 
			
		// #10. 페이지 번호 이벤트 등록 
		replyPaging.on("click", "a.paging_link", function(e){
			e.preventDefault(); 	// a 태그의 default 기능(이동) 무시
			let pageLink = $(this).attr("href"); // 클릭한 a 태그의 href값 가져오기
			let type = $(this).attr("id");
			console.log(pageLink); 
			pageNum = pageLink; // 밖에 만들어놓은 현재 페이지 변수에 덮어쓰기
			showList(pageNum, type); 
		});
		
		$("#detailBtn").on("click",function(){
			let iname = '<c:out value="${shop.detail}"/>';
			showImg(iname);
		});
		$("#reviewBtn").on("click",function(){
			showList(1,1);
		});
		$("#qnaBtn").on("click",function(){
			showList(1,2);
		});
	}); 
	</script>
	
	

</body>
</html>