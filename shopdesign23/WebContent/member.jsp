<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member.jsp</title>
<style type="text/css">
	body {
		margin: 0px;
		padding: 0px;
	}
	
	#header_2 {
		background-color: #d6ecfa;
		height: 5px;
	}
	
	#member {
		height: 70px;
		text-align: center;
	}
	
	#member_n {
		line-height: 65px;
		font-size: 20px;
	}
	
	table {
		border: 1px solid red;
		width: 100%;0
		border: 0;
		border-spacing: 0px;
	}
	
	tr {
		display: table-row;
		vertical-align: inherit;
		border-color: inherit;
	}
	
	th, td {
		border: 0px;
	 	margin: 0 4px 0 0;
	}
	
	#id_check {
		line-height: 22px;
	}
	
	
	.member_box{
		border: 0px;
		height: 22px;
		padding: 4px;
		border-bottom: 1px solid #d9d9d9;
		font-size: 12px;
		
	}
	
	th {
		text-align: right;
		padding: 10px 0 8px 20px;
		width: 200px;
		font-weightL bold;
		
	}
	
	hint {
	 	padding: 4px;
	 	
	 	
	}
	button {
		background-color: white;
		font-color: black;
	}
	
	div {
		display: block;
	}
	.button {
		text-align: center;
	}
	.button_b {
		vertical-align: middle;
	}
	
	.button_s {
		background-color : #D09E88;
		color: white;
		padding: 0px 5px;
		border: 3px solid #CFAA9E;
		text-decoration: none;
		display: inline-block;
		text-align: center;
		border-radius: 10px;
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script src="js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#uid").focus(function(){
			$("#span_id").css("display", "none");
		});
		$("#uid").blur(function(){
			if($("#uid").val() == ""){
				$("#span_id").css("display", "block");	
			} else if($("#uid").val() != ""){
				$("#span_id").css("display", "none");
			}
		});
		
 		$("#uid").blur(function(){
			if($("#ckuid") == "yes"){
				$("#span_id2").css("display", "block");
			}
		}); 
		
		$("#upw").focus(function(){
			$("#span_pw").css("display", "none");
		});
		$("#upw").blur(function(){
			if($("#upw").val() == ""){
				$("#span_pw").css("display", "block");	
			} else if($("#upw").val() != ""){
				$("#span_pw").css("display", "none");
			}
		});
		
		$("#urepw").focus(function(){
			$("#span_repw").css("display", "none");
		});
		$("#urepw").blur(function(){
			if($("#urepw").val() == ""){
				$("#span_repw").css("display", "block");	
			} else if($("#urepw").val() != ""){
				$("#span_repw").css("display", "none");
			}
		});
		
		$("#uname").focus(function(){
			$("#span_name").css("display", "none");
		});
		$("#uname").blur(function(){
			if($("#uname").val() == ""){
				$("#span_name").css("display", "block");	
			} else if($("#uname").val() != ""){
				$("#span_name").css("display", "none");
			}
		});
		
		$("#sample6_postcode").focus(function(){
			$("#span_zip").css("display", "none");
		});
		$("#sample6_postcode").blur(function(){
			if($("#sample6_postcode").val() == ""){
				$("#span_zip").css("display", "block");	
			} else if($("#sample6_postcode").val() != ""){
				$("#span_zip").css("display", "none");
			}
		});
		
		$("#sample6_address").focus(function(){
			$("#span_addr").css("display", "none");
		});
		$("#sample6_address").blur(function(){
			if($("#sample6_address").val() == ""){
				$("#span_addr").css("display", "block");	
			} else if($("#sample6_address").val() != ""){
				$("#span_addr").css("display", "none");
			}
		});
		
		$("#sample6_address2").focus(function(){
			$("#span_addr").css("display", "none");
		});
		$("#sample6_address2").blur(function(){
			if($("#sample6_address2").val() == ""){
				$("#span_addr").css("display", "block");	
			} else if($("#sample6_address2").val() != ""){
				$("#span_addr").css("display", "none");
			}
		});
		
		$("#uphone").focus(function(){
			$("#span_phone").css("display", "none");
		});
		$("#uphone").blur(function(){
			if($("#uphone").val() == ""){
				$("#span_phone").css("display", "block");	
			} else if($("#uphone").val() != ""){
				$("#span_phone").css("display", "none");
			}
		});
		
		$("#uemail").focus(function(){
			$("#span_email").css("display", "none");
		});
		$("#uemail").blur(function(){
			if($("#uemail").val() == ""){
				$("#span_email").css("display", "block");	
			} else if($("#uemail").val() != ""){
				$("#span_email").css("display", "none");
			}
		});
		
	});

	$(document).on("click", "#btn_member_a", function() {

		var re_id = /^[a-z0-9_-]{3,16}$/; // 아이디 검사식
		var re_pw = /^[a-z0-9_-]{6,18}$/; // 비밀번호 검사식
		var re_mail = /^([\w\.-]+)@([a-z\d\.-]+)\.([a-z\.]{2,6})$/; // 이메일 검사식
		var re_url = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/; // URL 검사식
		var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식
		
		var
		form = $("#frm_member"),
		uid = $("#uid"),
		upw = $("#upw"),
		urepw = $("#urepw"),
		uname = $("#uname"),
		sample6_postcode = $("#sample6_postcode"),
		sample6_address = $("#sample6_address"),
		sample6_address2 = $("#sample6_address2"),
		uphone = $("#uphone"),
		uemail = $("#uemail");
		
		var id = $.trim(uid.val());
		var pw = $.trim(upw.val());
		var repw = $.trim(urepw.val());
		var name = $.trim(uname.val());
		var zip = $.trim(sample6_postcode.val());
		var addr = $.trim(sample6_address.val());
		var addr2 = $.trim(sample6_address2.val());
		var phone = $.trim(uphone.val());
		var email = $.trim(uemail.val());
		
		if(id == "") {
			uid.focus();
			$("#span_id").css("display", "block");
			return false;
		} else if($("#ckuid").val() != "yes") {
			uid.focus();
			alert("ID 중복 체크를 하십시오");
			return false;
		} else if($("#uid2").val() != id ) {
			uid.focus();
			alert("ID 중복 체크를 하십시오");
			return false;
		}
		
		if(pw == "") {
			upw.focus ();
			$("#span_pw").css("display", "block");
			return false;
		}
		
		if(repw != pw) {
			urepw.focus ();
			$("#span_repw").css("display", "block");
			return false;
		}
		
		if(name == "") {
			uname.focus ();
			$("#span_name").css("display", "block");
			return false;
		}
		
		if(zip == "") {
			sample6_postcode.focus ();
			$("#span_zip").css("display", "block");
			return false;
		}
		
		if(addr == "") {
			sample6_address.focus ();
			$("#span_addr").css("display", "block");
			return false;
		}
		
		if(addr2 == "") {
			sample6_address2.focus ();
			$("#span_addr").css("display", "block");
			return false;
		}
		
		if(phone == "") {
			uphone.focus ();
			$("#span_phone").css("display", "block");
			return false;
		}else if(!re_tel.test(phone)) {
			uphone.focus();
			alert("맞게입력하시오 값을");
			return false;
		}
		
		if(email == "") {
			uemail.focus ();
			$("#span_email").css("display", "block");
			return false;
		}
		
/* 		if(phone == "") {
			uphone.focus();
			alert("nulll값");
			return false;
		}else if(!re_tel.test(phone)) {
			uphone.focus();
			alert("맞게입력하시오 값을");
			return false;
		} */
		
		form.submit();
		
	});
	
	$(document).on("click", "#idck_btn", function(){
		
		if($("#uid").val() == "") {
			$("#uid").focus();
			alert("값을 입력해주세요");
			return false;
		}
		
		//새창의 크기
		cw=550;
		ch=300;
		//스크린의 크기
		sw=screen.availWidth;
		sh=screen.availHeight;
		//열창의 포지션
		px=(sw-cw)/2;
		py=(sh-ch)/2;
		
		//검색할 ID값
		var id = $("#uid").val();
		alert("id값=" + id);
		
		var url = "IdckAction?ckid=" + id;
		window.open(url, "_blank_1",
					"toolbar=no, menubar=no, status=no, scrollbars=no, resizable=no, left=" + px + ",top=" + py + ",width=" + cw + ",height=" + ch);
		
		
	});

</script>
</head>
<body>
<!-- include -->
<%@ include file="homenav.jsp" %>
	<div id = "header_2">
	</div>
	
	<div id="member">
		<span id="member_n"><strong>회원가입</strong></span>
	</div>
	<hr>
	<form action="NewMemberAction"  method="POST"  id="frm_member" name="frm_member">
	<div class="boardWrite">
	 	<table>
			<tr>
				<th>
					아이디
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="text" class="input_login" id="uid" name="uid" size="20" maxlength="20" placeholder="ID">
				<input type="button" value="ID중복체크" class="button_b" id="idck_btn">
				<input type = "hidden" id="ckuid" name="ckuid">
				<input type = "hidden" id="uid2" name="uid2">
				 (영문소문자/숫자, 4~16자)<br>
				 <span id="span_id" class="span_ck">아이디를 입력하세요</span>
				 <span id="span_id2" class="span_ck2">멋찐 아이디네요</span>
				</td>
			</tr>
			<br>
			
			<tr>
				<th>
					비밀번호
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="password" class="input_pw" id="upw" name="upw" size="20" maxlength="20" placeholder="PW">
					(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)<br>
					<span id="span_pw" class="span_ck">비밀번호를 입력하세요</span>
				</td>
			</tr>
			
			<tr>
				<th>
					비밀번호 확인
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="password" id="urepw" name="urepw" class="input_pw_check" size="20" maxlength="20" placeholder="PW2">
				<span id="span_repw" class="span_ck">동일한 비밀번호를 입력하세요</span>
				</td>
			</tr>
<!-- 			<tr>
				<th>
					비밀번호 확인 질문
					<img src="img/ico_required.gif">
				</th>
				
				<td>
				<select id="hint" name="hint">
					<option value="hint_01">자신의 보물 제1호는?</option>
					<option value="hint_02">기억에 남는 추억의 장소는?</option>
					<option value="hint_03">가장 좋아하는 음식</option>
					<option value="hint_04">가장 기억에 남는 책이름</option>
					<option value="hint_05">자신의 보물 제1호는?</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>
					비밀번호 확인 답변
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="text" class="input_q" size="50" maxlength="15" placeholder="비밀번호 확인 답변">
				</td>
			</tr> -->
			<tr>
				<th>
					이름
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="text" class="input_name" id="uname" name="uname"size="20" maxlength="20" placeholder="이름">	
				<span id="span_name" class="span_ck">이름을 입력하세요</span>
				</td>
			</tr>
				<tr>
				<th>
					주소
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input type="text" id="sample6_postcode" class="member_box" name="uzipcode" size="10" maxlength="10" placeholder="우편번호" readonly/>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="zip"><br>
				<span id="span_zip" class="span_ck">우편번호를 입력하세요</span>
				<input type="text" id="sample6_address" class="member_box" name="uaddr1" size="40" maxlength="35" placeholder="주소" readonly/>
				<input type="text" id="sample6_address2" class="member_box" name="uaddr2" size="40" maxlength="35" placeholder="상세주소">
				<span id="span_addr" class="span_ck">주소를 입력하세요</span>
				</td>
			</tr>	
			<tr>
				<th>
					휴대번호
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="text" class="input_phone" id="uphone" name="uphone" size="40" maxlength="15" placeholder="">
				<span id="span_phone" class="span_ck">휴대번호를 입력하세요</span>
				</td>
			</tr>	
			<tr>
				<th>
					이메일
					<img src="img/ico_required.gif">
				</th>
				<td>
				<input class="member_box" type="text" class="input_addr1" id="uemail" name="uemail" size="50" maxlength="30" placeholder="">
				<span id="span_email" class="span_ck">이메일을 입력하세요</span>
				</td>
			</tr>
				
		
	 	</table>
	</div>
	<br>
	<hr>
	<div class="button">
	<a href="#" id ="btn_member_a"><span class="button_s">회원가입</span></a>
	<a href="IndexAction" id ="button_cancle_a"><span class="button_s">취소</span></a>
	</div>
	</form>

</body>
</html>