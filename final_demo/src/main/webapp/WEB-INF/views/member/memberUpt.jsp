<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>회원 정보 수정</h1>
<form action="memberUpt.do" method="post">
	아이디 : <input type="text" name="userId" value="${member.userId }" readonly/><br />
	비밀번호 : <input type="password" id="userPw" name="userPw" required/><br />
	<div id="pwChk">소문자와 숫자를 포함하여 5~10글자 이내로 입력해주세요.</div>
	비밀번호 확인 : <input type="password" id="checkPw" name="checkPw" required/><br />
	<div id="chkMsg">비밀번호가 일치합니다.</div>
	<div id="failMsg">비밀번호가 일치하지 않습니다.</div>
	이름 : <input type="text" name="userName" value="${member.userName }" readonly><br />
	휴대폰 : <input type="text" id="userPhone" name="userPhone" placeholder="예) 01012345678" value="${member.userPhone}" required /><br />
	<div id="phoneChk">하이픈(-)제외 숫자 11자리 입력 ex)01012345678</div>
	이메일 : <input type="email" name="userEmail" value="${member.userEmail }" required /> <br />
	주소 : <input type="text" name="userAddress" value="${member.userAddress }" required/><br />
	생년월일 : <input type="text" id="userBirth" name="userBirth" value="${member.userBirth }" readonly/><br />
	<input type="submit" value="완료" />
</form>
<a href="index.do">메인페이지</a>

<script>
//비밀번호 확인 체크
$(function(){
	$('#chkMsg').hide();
	$('#failMsg').hide();
	$('input[name=checkPw]').keyup(function(){
		var pwd1 = $('#userPw').val();
		var pwd2 = $('#checkPw').val();
		if(pwd1 != "" || pwd2 != ""){
			if(pwd1 == pwd2){
				$('#chkMsg').show();
				$('#failMsg').hide();
			}else{
				$('#chkMsg').hide();
				$('#failMsg').show();
			}
		}
	});
});

//비밀번호 정규식
$(function(){
	$('#pwChk').hide();
	$('input[name=userPw]').keyup(function(){
		var userPw = $('#userPw').val();
		if(/^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/.test(userPw))
			$('#pwChk').hide();
		else
			$('#pwChk').show();
	});
});

//휴대폰번호 정규식
$(function(){
	$('#phoneChk').hide();
	$('input[name=userPhone]').keyup(function(){
		var userPhone = $('#userPhone').val();
		if(/(^02.{0}|^01.{1}|[0-9]{4})([0-9]+)([0-9]{7})/g.test(userPhone))
			$('#phoneChk').hide();
		else
			$('#phoneChk').show();
	});
});
</script>
</body>
</html>