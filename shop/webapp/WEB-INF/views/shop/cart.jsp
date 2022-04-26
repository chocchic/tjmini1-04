<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <link rel="stylesheet" href="/resources/css/modal.css"> 
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" integrity="sha384-ejwKkLla8gPP8t2u0eQyL0Q/4ItcnyveF505U0NIobD/SMsNyXrLti6CWaD0L52l" crossorigin="anonymous">
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
	          <li class="nav-item"><a href="/shop/main" class="nav-link">Home</a></li>
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
	         	<li class="nav-item cta cta-colored">
	         		<a href="/shop/cart" class="nav-link"><span class="icon-shopping_cart"></span>
	         		<%--사용자 정보로 카트에 몇개 들어있는지 던져줄수 있게하기 --%></a>
	         	</li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	<div class="hero-wrap hero-bread" style="background-image: url('/resources/images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">My Cart</h1>
          </div>
        </div>
      </div>
    </div>
    
    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>&nbsp;</th>
						        <th>&nbsp;</th>
						        <th>상품이름</th>
						        <th>가격</th>
						        <th>수량</th>
						        <th>유통기한</th>
						        <th>세일</th>
						        <th>상품 총 금액</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:set var = "subtotal" value = "0" />
						    <c:forEach var="c" items="${cart}" varStatus="status">
						      <tr class="text-center">
						        <td class="product-remove"><a href="${c.pnum}" id="removeBtn"><span class="ion-ios-close"></span></a></td>
						        <td class="image-prod"><div class="img" style="background-image:url(/resources/imgs/${c.thumb}.jpg);"></div></td>
						        <td class="product-name">
						        	<h3>${c.pname}</h3>
						        	<p>채식 단계 : ${c.pdiet}<br/>
						        		포함 영양소 : <c:if test="${c.pnutr1} != null">${c.pnutr1}</c:if>
						        		<c:if test="${c.pnutr2} != null">&nbsp;${c.pnutr2}</c:if>
						        		<c:if test="${c.pnutr3} != null">&nbsp;${c.pnutr3}</c:if>
						        	</p>
						        </td>
						        <td class="price">${c.pprice}</td>
						        <td class="quantity">
							        <div class="input-group col-md-6 d-flex mb-3">
						             	<span class="input-group-btn mr-2">
						                	<button type="button" name="${status.index}" class="quantity-left-minus btn"  data-type="minus">
						                   <i class="ion-ios-remove"></i>
						                	</button>
						            		</span>
						            		<input type="text" id="quantity" name="quantity" class="form-control input-number" value="${c.pcount}" min="1" max="${c.pstock}" readonly>
						             	<span class="input-group-btn ml-2">
						                	<button type="button" name="${status.index}" class="quantity-right-plus btn" data-type="plus">
						                     <i class="ion-ios-add"></i>
						                 </button>
						             	</span>
						          	</div>
						       	 </td>
					          	<td class="exdate">${c.pexdate}</td>
					          	<td class="is_sale"> <c:if test="${c.is_sale=='Y'}"><i class="bi bi-check-square"></i></c:if>
													<c:if test="${c.is_sale=='N'}"><i class="bi bi-square"></i></c:if>
					          	</td>
						        <td class="total">
						        <fmt:parseNumber var="i" integerOnly="true" type="number" value="${c.pcount}" />
						        <fmt:parseNumber var="s" integerOnly="true" type="number" value="${subtotal}"/>
						        <fmt:parseNumber var="per" integerOnly="true" type="number" value="${member.per}"/>
							        <c:if test="${c.is_sale=='Y'}">
							        	<fmt:parseNumber var="p" integerOnly="true" type="number" value="${c.pprice*9/10}" />
							        	<fmt:parseNumber var="ss" integerOnly="true" type="number" value="${i*p}"/>
							        	<span class="price-sale">
							        		<input type="text" readonly name="subtotal" value="<fmt:formatNumber value="${ss}" type="currency"/>">
							        	</span>
							        </c:if>
				                    <c:if test="${c.is_sale=='N'}">
				                    	<fmt:parseNumber var="p" integerOnly="true" type="number" value="${c.pprice}" />
				                    	<fmt:parseNumber var="ss" integerOnly="true" type="number" value="${i*p}"/>
				                    	<input type="text" readonly name="subtotal" value="<fmt:formatNumber value="${ss}" type="currency"/>">
				                    </c:if>
				                    <c:set var="subtotal" value="${s+ss}"></c:set>
			                    </td>
						      </tr>
							</c:forEach>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
    		
    		<div class="row justify-content-end">
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
	    			<div class="cart-total mb-3">
	    				<h3>Coupon List</h3>
	    				<p>사용하실 쿠폰을 선택후 적용을 눌러주세요. 중복적용은 불가능합니다.</p>
			           	<lable><input type="radio" name="cp" id="null" value="0" checked> 미선택</lable>
				           <c:forEach var="item" items="${coupon}">
				          	<br/>
				          	<fmt:parseNumber var="i_c" integerOnly="true" type="number" value="${item.cpwon}"/>
				           	<lable><input type="radio" name="cp" id="${item.cpnum}" value="${i_c}"/>
				           	${item.cpname} : <fmt:formatNumber value="${i_c}" type="currency"/>
				           	</lable> 
				          </c:forEach>
		             </div>
    			</div>
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>주소 확인</h3>
    					<p>기본으로 등록되어 있는 주소입니다 바꾸고 싶으시면 버튼을 눌러주세요</p>
  					<div class="form-group">
	              	<label>수취인 이름</label>
	                <input type="text" name="chname" class="form-control text-left px-3" placeholder="${member.mname}">
	              </div>
	              <div class="form-group">
	              	<label>수취인 전화번호</label>
	                <input type="text" name="chtel" class="form-control text-left px-3" placeholder="${member.mtel}">
	              </div>	
	              <div class="form-group">
	              	<label>우편번호</label>
	                <input type="text" id="chpost" class="form-control text-left px-3" placeholder="${member.mpnum}">
	              </div>
	              <div class="form-group">
	              	<label>상세 주소</label>
	                <input type="text" id="chaddr" class="form-control text-left px-3" placeholder="${member.maddr}">
	              </div>
	  			</div>
    				<p><a id="modalBtn" class="btn btn-primary py-3 px-4">다른 주소 찾기</a></p>
    			</div>
    			
    			<%--등록되어있는 다른 주소 찾기 modal--%>
    			<div id="modal" class="modal-overlay hide" >
			        <div class="modal-window">
			            <div class="title">
			                <h2>등록되어 있는 다른 주소</h2>
			            </div>
			            <div class="close-area">창 닫기 X</div>
			            <div class="content">
			            	
			            	<label><input type="radio" checked name="ad" id="0" value=/><p>기본주소</p>수취인 이름 : ${member.mname}<br/>수취인 번호 : ${member.mtel }<br/>우편번호 : ${member.mpnum}<br/>상세 주소 : ${member.maddr}</label>
			              	<c:forEach var="a" items="${addrs}" varStatus="stauts">
			              		<input type="radio" name="ad" id="${status.index}+1"/><p>주소 별칭 : ${a.alias}</p>수취인 이름 : ${a.rep}<br/>수취인 번호 : ${a.reptel }<br/>우편번호 : ${a.pnum}<br/>상세 주소 : ${a.addr}</label>
			              	</c:forEach>
			            </div>
			        </div>
			    </div>
    			
    			<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<h3>Cart Totals</h3>
    					<p class="d-flex">
    						<span>Subtotal</span>
    						<input type="text" name="sub" readonly class="form-control text-left px-3" 
    						value="${subtotal}">
    					</p>
    					<p class="d-flex">
    						<span>Delivery</span><span>기본 3000</span>
    						<p>정가 5만원 이상 구매시 무료 배송!</p>
    					</p>
    					<p class="d-flex">
    						<span>Coupon</span>
    						<input type="text" name="appcp" readonly class="form-control text-left px-3" 
    						value="0">
    					</p>
    					<hr>
    					<p class="d-flex total-price">
    						<span>Total</span>
    						<p>회원 할인과 쿠폰 / 배송료가 적용된 금액입니다.</p>
    						<c:if test="${subtotal ge 50000}"> 
    						<input type="text" name="tot" readonly class="form-control text-left px-3" 
    						value="${subtotal*(100-member.per)/100}">
    						</c:if>
    						<c:if test="${subtotal lt 50000}">
    						<input type="text" name="tot" readonly class="form-control text-left px-3" 
    						value="${subtotal*(100-member.per)/100 + 3000}">
    						</c:if>
    					</p>
    				</div>
    				<p><a id="coutBtn" class="btn btn-primary py-3 px-4">결제하기</a></p>
    			</div>
    			</div>
    	</div>
		</section>
    
		<%-- 결제 상세로 보내줄 애들 --%>
    	<form action="/shop/order" method="get" id="orderForm">
			<input type="hidden" name="cpnum" value="0" />
			<input type="hidden" name="is_default" value="Y"/>
			<input type="hidden" name="alias" value=""/>
			<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
		</form>
		
		<form action="/shop/deletecart" method="get" id="prForm">
			<input type="hidden" name="pnum" value="" />
		</form>
		
		<form action="/shop/updatecart" method="get" id="updateForm">
			<input type="hidden" name="pnum" value="0" />
			<input type="hidden" name="quantity" value="0" />
		</form>
		<!-- loader -->
	  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
</body>	
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
	<script type="text/javascript">
		$(document).ready(function(){
			var cartlist = new Array();
			var addrlist = new Array();
			
			<c:forEach items="${cart}" var="c" varStatus="status">
				cartlist[${status.index}]= new Array();
				cartlist[${status.index}].push("${c.pnum}");
				cartlist[${status.index}].push("${c.pstock}");
			</c:forEach>
			<c:forEach items="${addrs}" var="a" varStatus="status">
				addrlist.push("${a.alias}");
			</c:forEach>
		
			// 수량 -+ 버튼
			let upForm = $("#updateForm");
			$('.quantity-right-plus').click(function(e){
				let index = $(this).attr("name");
				let quantity = parseInt($("input[name='quantity']").eq(index).val());
				let stock = parseInt(cartlist[index][1]);
				e.preventDefault();
				quantity = quantity+1;
			    if(quantity < stock){
					upForm.find("input[name='quantity']").val(quantity);
					upForm.find("input[name='pnum']").val(parseInt(cartlist[index][0]));
					upForm.submit();
			    }else{
			    	alert("재고보다 많은 수량은 선택불가능합니다.");
			    }
			});
		     $('.quantity-left-minus').click(function(e){
		        e.preventDefault();
		        let index = $(this).attr("name");
				let quantity = parseInt($("input[name='quantity']").eq(index).val());
				quantity = quantity-1;
		        if(quantity>0){
		        	upForm.find("input[name='quantity']").val(quantity);
		        	upForm.find("input[name='pnum']").val(parseInt(cartlist[index][0]));
		        	upForm.submit();
		        }else{
			    	alert("최소 수량은 0 입니다.");
			    }
		    });
			// 주소 받는 모달 관련
			const modal = document.querySelector("#modal");
			
			// 모달 열기
			$("#modalBtn").click(function(){
				modal.classList.remove("hide");
			});
			
			// 바뀐 주소값 저장
			$("input[name='ad']").click(function(){
				let aidx = $(this).attr("id"); 
				if(aidx>1){
					orderForm.find("input[name='is_default']").val('Y');
					orderForm.find("input[name='alias']").val(addrlist[aidx-1]);
				}
			});
			$(".close-area").click(function(e){
				modal.classList.add("hide");
			});
			let orderForm = $("#orderForm");
			$("input[name='cp']").click(function(){
				let prevcp = $("input[name='appcp']").attr("value");
				let prevtot =$("input[name='tot']").attr("value");
				let newcp = $(this).attr("value");
				$("input[name='appcp']").val(newcp);
				$("input[name='tot']").val(prevtot+prevcp-newcp);
				orderForm.find("input[name='cpnum']").val($(this).attr("id"));
			});
			
			let prForm = $("#prForm");
			$("#removeBtn").click(function(e){
				e.preventDefault();
			    prForm.find("input[name='pnum']").val($(this).attr("href"));
			    prForm.submit();
			});
			
			$("#coutBtn").click(function(){
				orderForm.submit();
			});
		});
		
	</script>
	
</html>