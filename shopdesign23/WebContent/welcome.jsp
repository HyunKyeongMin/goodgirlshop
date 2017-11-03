<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Refresh" content="4; url=IndexAction"> <!-- 4초후에 인덱스로간다   -->
<title>welcome.jsp</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

	body {
		margin: 0px;
		padding: 0px;
		background-image: url("img/US.png") ;
		background-size: 1200px; 
		
	}
	
	#main_div {
		width: 450px;
		height: 600px;
		margin: 70px auto;
		background-color: white;
		border-radius: 10px;
		font-family: 'Nanum Pen Script', serif;
	}
	
	#welcome {
		width: 300px;
		height: 35px;
		margin: 0px auto;
		margin-top: 20px; 
	/* 	border: 1px solid blue; */
		font-size: 25px;
		font-family: 'Nanum Pen Script', serif;
		text-align: center;
		background-color: #F0E5DE;
	}
	
	#welcome_in {
		width: 400px;
		height: 200px;
		background-color: #D9D4CF;
		margin: 0px auto;
		margin-top: 15px; 
		border-radius: 10px;
	}
	
	.logo_span{
		color: black;
		font-size: 55px;
	}
	
	#logo>a {
		text-decoration: none;
		font-family: 'Nanum Pen Script', serif;
	}
	
	#mainlogo {
	/* 	border: 1px solid red; */
		width: 400px;
		text-align: center;
		margin: 0 auto;
		padding: 50px 20px;
		background-color: white;
	}
	
	.div_span {
		text-align: center;
		width: 200px;
		height: 30px;
		margin: 20px auto;
		padding-top: 15px;
		font-size: 30px;
		
	}
	
	.div_span2 {
		text-align: center;
		width: 350px;
		height: 30px;
		margin: 20px auto;
		font-size: 25px;
	}
	
	#div_span2 {
		font-size: 20px;
	}
	
	.div_span3 {
		text-align: center;
		width: 350px;
		height: 70px;
		margin: 35px auto;
	}
	
	#div_span3 {
		font-size: 25px;
	}
	
	#thanks {
		font-size: 30px;
	}


</style>
</head>
<body>
	<div id="main_div">
	<div id="logo">
		<a href ="IndexAction">
			<div id="mainlogo">
				<span class="logo_span">선 녀</span>
			</div>
		</a>	
	</div>
	<div id="welcome"><strong>- Welcome 환영합니다 -</strong></div>
		<div id = "welcome_in">
			
			<div class = "div_span"><span id = "span_id">${mname}님</span></div>
			<div class = "div_span2" id="div_span2"><span>가입축하 선물 3000p 가 정립되셨습니다</span></div>
			<div class = "div_span2" id="div_span3"><span>선녀에게 날개가 옷인듯,<br>
																당신의 날개가 되어, 항상 당신을 응원합니다.</span></div>
		</div>
			<div class = "div_span3">
			<span id="thanks">잠시 후에 메인 페이지로 이동합니다.<br>
					감사합니다 ^^</span>
			</div>
	</div>	
</body>
</html>