<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shoplogin.jsp</title>
<style type="text/css">
	body {
		margin: 0px;
		padding: 0px;
	}


	#header_3 {
		background-color: #FFEEE4;
		height: 5px;
	}
	
	#member {
		margin: 0 auto;
		width: 350px;
		height: 70px;
		text-align: center;
		padding: 10px 15px;
	}
	
	#member_n {
		line-height: 65px;
		font-size: 20px;
		overflow: hidden;
	}
	
	#content_layout {
		width: 550px;
		height: 400px;
		padding: 20px 0px;
		margin: 0px auto;
		border: 2px solid #a3c9c7;
		border-radius: 10px;
	}
	
	#div_in {
		width: 500px;
		height: 300px;
		margin: 25px auto;
	}
	
	.div_input {
		background-color: white;
		border: 1px solid #dadada;
		margin: 10px auto;
		margin-bottom: 14px;
		padding: 5px;
		width: 318px;
		height: 25px;
	}
	
	.input_login {
		border-width: 0px;
		width: 320px;
		height: 16px;
		padding: 7px 0px 6px 0px;
	}
	
	#btn_login {
		width: 350px;
		height: 59px;
		text-decoration: none;
		background-color: #a3c9c7;
		display: block;
		color: white;
		font-size: 22px;
		text-align: center;
		line-height: 61px;
		margin: 0px auto;
		margin-top:15px;
		border-radius: 10px;
	}
	.remember {
		padding-left: 70px;
		margin-top: 15px;
	}
	
	.login-help {
		width: 300px;
		bottom: 20px;
		border-top: 1px solid #cfcfcf;
		font-size: 14px;
	}
	
	a {
		text-decoration: none;
		color: black;`
	}
	
	.right {
		margin-left: 200px;
	}
	
	.signup {
		width: 480px;
		height: 20px;
		padding: 0px 10px;
		font-size: 15px;
	}
	
	.right {
		float: right;
	}
	
	hr {
		border: thin solid #EAEAEA;
	}
	
	.signup a:HOVER {
		text-decoration: underline;
	}
	
	#frm_login {
		height: 300px;
		width: 500px;
	}
	
	#span_no {
		display: none;
		text-align: center;
		font-size: 12px;
	}
	
	.span_ck {
		font-size: 12px;
		display: none;
		color: red;
	}



</style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#uid").focus(function(){
			$("#shop_id").css("border", "1px solid #47C83E");
			$("#span_id").css("display", "none");
		});
		
		$("#uid").blur(function(){
			$("#shop_id").css("border", "1px solid #dadada");
			if($("#uid").val() == ""){
				$("#span_id").css("display", "block");		
			} else if($("#uid").val() != "") {
				$("#span_id").css("display", "none");
			}
		});
		
		$("#upw").focus(function(){
			$("#shop_pw").css("border", "1px solid #47C83E");
			$("#span_pw").css("display", "none");
		});
		
		$("#upw").blur(function(){
			$("#shop_pw").css("border", "1px solid #dadada");
			if($("#upw").val() == ""){
				$("#span_pw").css("display", "block");		
			} else if($("#upw").val() != "") {
				$("#span_pw").css("display", "none");
			}
		});
	});


	$(document).on("click", "#btn_login", function() {
		var
		form = $("#frm_login"),
		uid = $("#uid"),
		upw = $("#upw");
		
		var id = $.trim(uid.val());
		if(id == "") {
			uid.focus ();
			$("#span_id").css("display", "block");
			return false;
		}
		
		var pw = $.trim(upw.val());
		if(pw == "") {
			upw.focus ();
			$("#span_pw").css("display", "block");
			return false;
		}
		
		form.submit();
	});


</script>
<script type="text/javascript">
	window.onload = function() {
		var code = ${code};
		if(code == "2") {
/* 			document.getElementByld("span_no").style.display="block";
 */
 			$("#span_no").css("display","block").css("color", "red");
 		} 
	};
</script> 
</head>
<body>
<!-- include -->
<%@ include file="homenav.jsp" %>

	<div id = "header_3">
	</div>
	
	<div id="member">
		<span id="member_n"><strong>로그인</strong></span>
	</div>
	
	<div id="content_layout">
		<div id="div_in">
			<form action="LoginAction" method="POST" id="frm_login" name="frm_login">
			<div class="div_input" id="shop_id">
				<input type="text" placeholder = "아이디" class="input_login" id="uid" name="uid" size="25" maxlength="20">
				<span id="span_id" class="span_ck">아이디를 입력하세요</span>
			</div>
			
			<div class="div_input" id="shop_pw">
				<input type="password" placeholder="비밀번호" class="input_login" id="upw" name="upw" size="25" maxlength="20">
				<span id="span_pw" class="span_ck">비밀번호를 입력하세요</span>
			</div>
				<span id = "span_no">아이디 또는 비밀번호를 확인하세요 <br>
									ID가 없거나 PW를 잘못입력하셨습니다</span>
	
			<div class="remember">
				<input type="checkbox" name="remember" value="true"> <!-- value는 값을 넣어놓을수있다 -->
				<label class="label" for="remember">아이디계정 저장</label>
			</div>
			
			<div><a href="#" id="btn_login">로그인</a></div>
			</form>
			
			<hr>
			<div class="signup">
				<a href="shopcontract.jsp" class="underline">회원가입</a>
			<span class="right">
				<a href="#" class="underline">ID 찾기</a>&nbsp |
				<a href="#" class="underline">PW 찾기</a>
			</span>
			</div>
			
		</div>
	
	</div>

</body>
</html>
