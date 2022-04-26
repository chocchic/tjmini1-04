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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
            <h1 class="mb-0 bread">Checkout</h1>
          </div>
        </div>
      </div>
    </div>
	
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
        	<div class="col-xl-5">
				<h3 class="mb-4 billing-heading">Shipping Details</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">Name</label>
	                  <input type="text" placeholder="${member.mname}" readonly>
	                </div>
	              </div>
	              <div class="w-100"></div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="phone">Phone</label>
	                  <input type="text" placeholder="${member.mtel}" readonly>
	                </div>
	             </div>
	             <div class="w-100"></div>
	             <div class="col-md-6">
		            	<div class="form-group">
		            		<label for="postcodezip">Post code</label>
	                  <input type="text"  placeholder="${member.mpnum}" readonly>
	                </div>
		            </div>
		            <div class="w-100"></div>
	            <div class="col-md-6">
		            	<div class="form-group">
	                	<label for="streetaddress">Detail Address</label>
	                  <input type="text" placeholder="${member.maddr}" readonly>
	                </div>
		        </div>
		     <div class="w-100"></div>
	          </div>
	         <!-- END -->
			</div>
         <div class="col-xl-5">
	          <div class="row mt-5 pt-3">
	          	<div class="col-md-12 d-flex mb-5">
	          		<div class="cart-detail cart-total p-3 p-md-4">
	          			<h1 class="billing-heading mb-4">Bill Total</h1>
	          			<p class="d-flex">
    						<span>Subtotal</span>
    						<span><fmt:formatNumber value="${total}" type="currency"/></span>
    					</p>
    					<p class="d-flex">
    						<span>Coupon Discount</span>
    						<span><fmt:formatNumber value="${coupon.cpwon}" type="currency"/></span>
    					</p>
    					<p class="d-flex">
    						<span>Membership Discount</span>
    						<span>${member.per}%</span>
    					</p>
    					<p class="d-flex">
    						<span>Total</span>
    						<span><fmt:formatNumber value="${total *(100-member.per)/100 - coupon.cpwon}" type="currency"/></span>
    					</p>
					</div>
	          	</div>
	          	<div class="col-md-12">
	          		<div class="cart-detail p-3 p-md-4">
	          			<h3 class="billing-heading mb-4">Payment Method</h3>
						<div class="form-group">
							<div class="col-md-12">
								<input type="button" id="kakaoPayBtn" value="KakaoPay">
							</div>
						</div>
					</div>
	          	</div>
	          </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->
</body>
<form action="/kakao/kakaoPay" method="get" id="kpForm">
	<input type="hidden" name="mnum" value="${member.mnum}"/>
	<input type="hidden" name="mname" value="${member.mname }"/> 
	<input type="hidden" name="maddr" value="${member.maddr}"/>
	<input type="hidden" name="mtel" value="${member.mtel}"/>
	<input type="hidden" name="mpnum" value="${member.mpnum }"/>
	<input type ="hidden" name="per" value="${member.per }"/>
	<input type="hidden" name="cpnum" value="0"/>
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
<script>
	$(document).ready(function(){	
		$("#kakaoPayBtn").click(function(){
			console.log("눌림!");
			$("#kpForm").submit();
		});
	});
</script>
</html>