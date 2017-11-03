<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

	#header_3 {
		background-color: #E3E36A;
		height: 5px;
	}

	body, div {
		margin: 0px;
		padding: 0px;

	}
	
	h3 {
		margin: 0px;
	}
	
	img {
		width:250px;
		height:250px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	img:HOVER {
		opacity: 0.5;
    	filter: alpha(opacity=50);	
	}
	
	a {
		text-decoration: none;
	}
	.pdt_item {
		position: relative;
		float: left; /* 밑으로 줄줄이 나오는걸 옆으로 따닥따닥 붙인다 */
		margin: 0px 10px;
		padding-top: 5px;
		width:260px;
		height: 255px;
		text-align: center;
	}
	
	.pdt_item:HOVER {
		background-color: black;	
	}
	.item_list{
		clear: both; /* 한개끝나면 밑으로 내려와서 다시 시작한다 */
	}
	
	.wrap_info {
		display: none;
	}

	.pdt_item:HOVER .wrap_info{
		position: absolute;
    	top: 70%;
   		left: 50%;
		display: block;
		width: 150px;
		height: 40px;
		background-color: white;
		
	}
	
	span {
		color: black;
		text-align: center;
		font-size: 20px;
		font-family: 'Nanum Pen Script', serif;
	}
	
/* 	#div_main {
		background-image: url("img/US4.png");
		background-size: 100% 100%; 
		width: 100%;
		height: 100%;
	} */

	

</style>
<script type="text/javascript">
	window.onload = function() {
		var code = ${code};
		if(code == "1") {
		alert("수정되었습니다");
 		}
	};
</script> 
</head>
<body>
<!-- include -->
<%@ include file="homenav.jsp" %>
<div id = "header_3"> </div>
<br>
<div class="item_list">
	열심히 하세요 화이팅!
	<h3>Best Item</h3>
	<hr>
	<C:forEach items="${bestlist}" var="bPDto">
	<div class="pdt_item">
	<a href="detail.jsp?img = ${bPDto.p_img} &name = ${bPDto.p_name} &price = ${bPDto.p_price2}">
		<img alt="베스트상품" src="img/${bPDto.p_img}">
		<div class="wrap_info">
			<span>${bPDto.p_name}</span><br>
			<span>
				<fmt:setLocale value="ko_kr"/> <!-- ko_kr, en_us, ja_jp 어느나라껄로 할꺼냐 라고 지정해주는것-->
				<fmt:formatNumber value="${bPDto.p_price2}" type="currency"/>
			</span>
		</div>
	</a>
	</div>
	</C:forEach>
</div>

<div class="item_list">

	<h3>New Item</h3>
	<hr>
	<C:forEach items="${newlist}" var="nPDto">
	<div class="pdt_item">
	<a href="">
		<img alt="신상품" src="img/${nPDto.p_img}">
		<div class="wrap_info">
			<span>${nPDto.p_name}</span><br>	
			<span>
				<fmt:setLocale value="ko_kr"/>
				<fmt:formatNumber value="${nPDto.p_price2}" type="currency"/>
			</span>	
		</div>
	</a>
	</div>
</C:forEach>
</div>
</body>
</html>