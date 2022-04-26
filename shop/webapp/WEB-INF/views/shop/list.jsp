<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" integrity="sha384-ejwKkLla8gPP8t2u0eQyL0Q/4ItcnyveF505U0NIobD/SMsNyXrLti6CWaD0L52l" crossorigin="anonymous">
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
						<li class="nav-item">
							<a class="nav-link" onclick="window.location='/common/main'">LOGOUT</a>
						</li>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</sec:authorize>
                <li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
	         	<li class="nav-item cta cta-colored">
	         		<a href="/shop/cart" class="nav-link"><span class="icon-shopping_cart"></span><%--사용자 정보로 카트에 몇개 들어있는지 던져줄수 있게하기 --%></a>
	         	</li>
	        </ul>
	      </div>
	    </div>
	  </nav>

	  <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6 d-flex align-items-center">
            <form action="/shop/list" class="subscribe-form">
              <div class="form-group d-flex">
                <input name="keyword" type="text" class="form-control" placeholder="Search here...">
                <input type="submit" value="Search" class="submit px-3">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
				<input type="hidden" name="listQty" value="${pageMaker.cri.listQty}" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category" id="dietlist">
						<li><a id="allBtn"
							<c:if test="${'all' eq pageMaker.cri.cate || '' eq pageMaker.cri.cate || null eq pageMaker.cri.cate}">class="active" </c:if>>
							All</a></li>
    					<li><a id="veganBtn"
    						<c:if test="${'vegan' eq pageMaker.cri.cate}">class="active" </c:if>
    						>Vegan</a></li>
    					<li><a id="lactoBtn"
    						<c:if test="${'lacto' eq pageMaker.cri.cate}">class="active" </c:if>
    					>Lacto</a></li>
    					<li><a id="ovoBtn"
    						<c:if test="${'lacto-ovo' eq pageMaker.cri.cate}">class="active" </c:if>
    					>Lacto-ovo</a></li>
    					<li><a id="pescoBtn"
    						<c:if test="${'pesco' eq pageMaker.cri.cate}">class="active" </c:if>
    					>Pesco</a></li>
    					<li><a id="polloBtn"
    						<c:if test="${'pollo' eq pageMaker.cri.cate}">class="active" </c:if>
    					>Pollo</a></li>
    				</ul>
    				<span>&nbsp;Sort by&nbsp;</span>
                   <select name="ord" id="sort">
					<option value="0" <c:if test="${0 eq pageMaker.cri.ord}">selected</c:if> >Newest</option>
					<option value="1" <c:if test="${1 eq pageMaker.cri.ord}">selected</c:if>>High Price</option>
					<option value="2" <c:if test="${2 eq pageMaker.cri.ord}">selected</c:if>>Low Price</option>
					<option value="3" <c:if test="${3 eq pageMaker.cri.ord}">selected</c:if>>Highest Star</option>
					</select>
    			</div>
    			
				<c:forEach var="shop" items="${list}">
					<div class="col-md-6 col-lg-3">
	    				<div class="product">
	    					<a class="move img-prod" href="${shop.pnum}"><img class="img-fluid" src="/resources/imgs/${shop.thumb}.jpg" alt="Colorlib Template">
	    						<c:if test="${shop.is_sale=='Y'}"><span class="status">10%</span></c:if>
	    					</a>
	    					<div class="text py-3 pb-4 px-3 text-center">
	    						<h3><a class="move" href="${shop.pnum}">${shop.pname}</a></h3>
	    						<div class="d-flex">
	    							<div class="pricing">
	    								<p class="price">
	    								<c:if test="${shop.is_sale=='Y'}"> <span class="mr-2 price-dc"><fmt:formatNumber value="${shop.pprice}" type="currency"/></span><span class="price-sale"><fmt:formatNumber value="${shop.pprice*9/10}" type="currency"/></span></c:if>
			                            <c:if test="${shop.is_sale=='N'}"> <fmt:formatNumber value="${shop.pprice}" type="currency"/></c:if>
			    						</p>
			    					</div>
		    					</div>
		    					<div class="bottom-area d-flex px-4">
		    						<div class="m-auto d-flex">
		    							<a href="${shop.pnum}" class="move add-to-cart d-flex justify-content-center align-items-center text-center">
		    								<span><i class="ion-ios-menu"></i></span>
		    							</a>
		    							<a href="${shop.pnum}" class="cartBtn buy-now d-flex justify-content-center align-items-center mx-1">
		    								<span><i class="ion-ios-cart"></i></span>
		    							</a>
		    							<a href="${shop.pnum}" class="heartBtn heart d-flex justify-content-center align-items-center ">
		    								<c:if test=""><span><i class="bi bi-bookmark-heart"></i></span></c:if>
		    								<i class="bi bi-bookmark-heart-fill"></i>
		    							</a>
		    							<a href="${shop.pnum}" class="subBtn buy-now d-flex justify-content-center align-items-center ">
		    								<span><i class="bi bi-calendar4-week"></i></span>
		    							</a>
	    							</div>
	    						</div>
	    					</div>
	    				</div>
	    			</div>
	       		</c:forEach>
           
     
		        
			</div>
			</div>
	   </section>
	<section>
	<div align="center">
				<%-- previous --%>
				<c:if test="${pageMaker.prev}">
					<a class="paging_btn" href="${pageMaker.startPage - 1}" style="color: #77878F">&lt; &nbsp;</a>
				</c:if>
			
				<%-- 페이지번호 --%>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" >
					 <a class="paging_btn" href="${num}" style="color: #77878F">&nbsp;${num}&nbsp;</a> 
				</c:forEach>
			
				<%-- next --%>
				<c:if test="${pageMaker.next}">
					<a class="paging_btn" href="${pageMaker.endPage + 1}" style="color: #77878F">&nbsp; &gt;</a>
				</c:if>
				</div>
	</section>
	
	
	<%-- 페이지 번호누를때 해당 페이지 요청해줄 숨김 폼태그 --%>
	<form action="/shop/list" method="get" id="pagingForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="listQty" value="${pageMaker.cri.listQty}" />
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}" />
		<input type="hidden" name="cate" value="${pageMaker.cri.cate}" />
		<input type="hidden" name="ord" value="${pageMaker.cri.ord}" />
		<%--<input type="hidden" name="nutr" value="${pageMaker.cri.nutr}" /> --%>
	</form>
	<br /><br /><br /><br />
	<form method="get" id="sthForm">
	</form>
	<script>
		$(document).ready(function(){		
			// 페이지번호 눌렀을때 이동 처리 
			// 숨김 폼태그 가져오기 
			let pagingForm = $("#pagingForm");
			
			$("a.paging_btn").click(function(e){
				e.preventDefault();  // a 태그의 이동하는 기본 기능 없애기
				console.log("a 클릭!!" + e); 
				// 폼태그에서 name속성이 pageNum인 input 태그를찾아 
				//	input tag의 값을 클릭한 a태그의 href 속성값으로 변경 
				// <input value=a의 href값 
				pagingForm.find("input[name='pageNum']").val($(this).attr("href")); 
				pagingForm.submit(); // submit 버튼 누른것과 동일한 효과.
				
			}); // paging_btn click
			
			
			// 전체글보기 버튼 이벤트 
			$("#allBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("all");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			
			// 비건 제품보기 버튼 이벤트 
			$("#veganBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("vegan");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			
			// 전체글보기 버튼 이벤트 
			$("#lactoBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("lacto");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			
			// lacto-ovo 제품만 보기 버튼 이벤트 
			$("#ovoBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("lacto-ovo");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			
			// pesco 제품만 보기 버튼 이벤트 
			$("#pescoBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("pesco");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			
			// pollo 제품만 보기 버튼 이벤트 
			$("#polloBtn").click(function(e){
				pagingForm.find("input[name='pageNum']").val("1"); 
				pagingForm.find("input[name='keyword']").val("");
				pagingForm.find("input[name='cate']").val("pollo");
				pagingForm.find("input[name='ord']").val("0");
				pagingForm.submit();  // 이동! 
			});
			$("#sort").on("change",function(){
				var o = $("#sort option:selected").val();
				pagingForm.find("input[name='ord']").val(o);	
				pagingForm.submit();
			});
			// 게시글 제목 클릭시, content 페이지로 이동 처리 
			$(".move").click(function(e){
				e.preventDefault(); 
				// 숨김 폼 태그에 bno input hidden으로 태그 추가 
				pagingForm.append("<input type='hidden' name='pnum' value='"+ $(this).attr("href") + "' />"); 
				// 폼의 action 속성값 (이동할 주소) content로 변경 
				pagingForm.attr("action", "/shop/content"); 
				pagingForm.submit();  // 서브밋! 이동!! 
			});
			
			let form = $("#sthForm");
			console.log("form : ",form);
			$(".cartBtn").click(function(e){
				e.preventDefault();
				var href = $(this).attr('href');
				form.attr("action", "/shop/addcart");
				form.append("<input type='hidden' name='pnum' value='"+ $(this).attr("href") + "' />");
			    form.submit();
			});
			console.log("heart btn : ",$("#heartBtn").attr('href'));
			$(".heartBtn").click(function(e){
				e.preventDefault();
				form.attr("action", "/shop/addheart");
			    form.append("<input type='hidden' name='pnum' value='"+ $(this).attr("href") + "' />"); 
			    form.submit();
			});
			
			 var resultMsg = '${result}' || '';
			if(resultMsg != '') {
			  	alert(resultMsg);
			}
		});// ready
		
	</script>

</body>
</html>