<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>homenav.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	body, ul {
		margin: 0px;
		padding: 0px;
	}
	
	#fixed {
	/* 	position:fixed; */
		width: 100%;
		height: 254px;
	}
	
	#header {
	 	background-image: url("img/US.png") ;
		background-size: 700px;  
		/* background-color: #D9D4CF; */
		height: 40px;
		width: 100%;
	}
	
	#header_ul {
		list-style-type: none;
	}
	
	.header_li {
		float: left;
		position: relative;
	}
	
	.header_li >a {
		padding: 12px 15px;
		color: white;
		text-decoration: none;
		font-size: 12px;
		line-height: 40px;
	}

	.header_li:HOVER {
		background-color: #f1bbba;
	}
	
	.header_li:HOVER #dropdown_m {
		display: block;
	}
	
	#header_inner{
		float: right;
		margin-right: 50px;
		height: 40px;
	}
	
	.header_a {
		color: white;
		text-decoration: none;
		
	}
	
	#bookmark {
		color: white;
		font-family: 'Nanum Pen Script', serif;
		line-height: 40px;
		font-size: 24px;
		margin-left: 70px;
		font-weight: bold;	
	}
	
	.book_a {
		color: white;
		text-decoration: none;
	}
	
 	#logo {
		background-image: url("img/US.png") ;
		background-size: 700px; 
	} 
	
	.logo_span{
		color: white;
		font-size: 55px;
	}
	
	#logo>a {
		text-decoration: none;
		font-family: 'Nanum Pen Script', serif;
	}
	
	#mainlogo {
	/* 	border: 1px solid red; */
		width: 250px;
		text-align: center;
		margin: 0 auto;
		padding: 35px 30px 65px 30px;
	}
	
	#nav{
		z-index:1;	
		height: 50px;
		background-color:white;
		/* border-bottom: 1px solid #dadada; */
		width: 100%;
	}
	
	#nav_inner {
		text-align: center;
	}
	
	#nav_ul {
		list-style-type: none;
		height: 40px;
		margin-left: 50px;
	}
	
	.nav_li {
		float: left;
		margin-right: 25px;
	}
	
	.nav_li >a {
		padding: 15px 15px;
		color: black;
		line-height: 50px;
	}
	
	.nav_li>a:HOVER {
		text-decoration: underline;
	}
	
	.nav_a {
		color: white;
		text-decoration: none;
	}
	
	.dropdown_a {
		display: block;
		color: white;
		text-decoration: none;
		font-size: 13px;
		padding: 10px 0px;
		text-align: center;
	}
	
	#dropdown_m {
		background-color: #f1bbba;
		padding: 5px; 
		display: none;
	
	}
	
	#dropdown_m >a {
		color: white;
		font-size: 12px;
		padding-bottom: 5px;
		text-decoration: none;
		display: block;
	}
	
	#dropdown_m >a:HOVER {
		text-decoration: underline;
	}
	
	#login_user {
		padding: 9px 5px;
		color: #9B8281;
	}
	
</style>
</head>
<body>
<div id="fixed">
	<div id="header">
		<span id="bookmark"><a href="#" class="book_a">+ 선 녀</a></span>
		<div id="header_inner">
		<ul id="header_ul">
			<C:choose> 
				<C:when test="${empty sessionScope.loginUser}">  
			<li class="header_li"><a href="shoplogin.jsp" class="header_a">로그인</a></li>
			<li class="header_li"><a href="shopcontract.jsp" class="header_a">회원가입</a></li>
				</C:when>
				<C:otherwise>
					<li class="header_li" id="login_user" name="login_user">${sessionScope.loginUser.shopname}(${sessionScope.loginUser.shopid})</li>
					<li class="header_li"><a href="LoginOutAction" class="header_a">로그아웃</a></li>
				</C:otherwise>
			</C:choose>
			<li class="header_li"><a href="#" class="header_a">마이페이지▼</a>
				<div id="dropdown_m">
					<a href="#" class="dropdown_a">주문/배송조회</a>
					<a href="#" class="dropdown_a">장바구니</a>
					<a href="#" class="dropdown_a">위시리스트</a>
					<a href="#" class="dropdown_a">쿠폰조회</a>
					<a href="MemberUpdate" class="dropdown_a">회원정보</a>
				</div>
			</li>
			<li class="header_li"><a href="#" class="header_a">고객센터</a></li>
		</ul>
		</div>
	</div>
	<div id="logo">
		<a href ="IndexAction">
			<div id="mainlogo">
				<span class="logo_span">선 녀</span>
			</div>
		</a>	
	</div>
	
	<div id="nav">
		<div id="nav_inner">
		<ul id="nav_ul">
			<li class="nav_li"><a href="#" class="nav_a">TOP</a></li>
			<li class="nav_li"><a href="#" class="nav_a">BLOUSE</a></li>
			<li class="nav_li"><a href="#" class="nav_a">DRESS</a></li>
			<li class="nav_li"><a href="#" class="nav_a">KNIT/CARDLGAN</a></li>
			<li class="nav_li"><a href="#" class="nav_a">OUTER</a></li>
			<li class="nav_li"><a href="#" class="nav_a">BOTTOM</a></li>
			<li class="nav_li"><a href="#" class="nav_a">SHOES/BAG</a></li>
			<li class="nav_li"><a href="#" class="nav_a">SCARF</a></li>
			<li class="nav_li"><a href="#" class="nav_a">ACC</a></li>
			<li class="nav_li"><a href="#" class="nav_a">SALE</a></li>
		</ul>
		</div>
		
	</div>
</div>
</body>
</html>