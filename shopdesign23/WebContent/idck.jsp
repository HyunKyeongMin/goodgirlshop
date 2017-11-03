<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idck.jsp</title>
<style type="text/css">
	body {
		border: 4px solid skyblue;
	}


	.span_ck {
		display: none;
		font-size: 12px;
		color: red;
	}
	
	.span_ck2 {
		display: none;
		font-size: 12px;
		color: blue;
	}


</style>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function closeOk() {
		opener.document.frm_member.upw.focus();
		opener.document.frm_member.ckuid.value = "yes"; //중복 체크됬는지 확인하는 코드
		opener.document.frm_member.uid2.value = "${message}"; //중복 체크됬는지 확인하는 코드
		opener.document.frm_member.uid.value = "${message}"; //중복 체크됬는지 확인하는 코드 여긴 네임으로 한다
		self.close();
	}
	
	function closeNg() {
		opener.document.frm_member.uid.select(); //블럭되게 만드는 코드
		opener.document.frm_member.ckuid.value = "no";
		self.close();
	}
	
	$(document).on("click", "#idck_btn1", function(){
		if($("#ckid").val() == "") {
			$("#ckid").focus();
			$("#span_id").css("display", "block");
			return false;
		}
		
		$("#frm_idck2").submit();
	});


</script>
</head>
<body>
	<C:choose>
		<C:when test="${idCount == '0'}">
			<div></div>
			${message}은(는) 사용가능한 ID입니다.
			<button onclick = "closeOk()">확인</button>
		</C:when>
		<C:otherwise>
			${message}은(는) 중복된 ID입니다.<br>
			다른 아이디를 입력하세요.<br>
			<form action="IdckAction" id="frm_idck2" name="frm_idck2">
				<input class="member_box" type="text" class="input_login" id="ckid" name="ckid" size="20" maxlength="20" placeholder="ID">
				<input type="button" value="중복체크" class="button_b" id="idck_btn1">
								<br>(영문소문자/숫자, 4~16자)<br>
				 <span id="span_id" class="span_ck">아이디를 입력하세요</span>
				 <span id="span_id2" class="span_ck2">멋찐 아이디네요</span>
			</form>	 
			<button onclick = "closeNg()">확인</button>
		</C:otherwise>
	</C:choose>
</body>
</html>