<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 다음 우편주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<h1>회원가입</h1>
<form action="memberIns.do" method="post">
	아이디 : <input type="text" id="userId" name="userId" required/> <input type="button" id="idDup" value="중복확인"/> <br />
	<div id="idChk">소문자와 숫자를 포함하여 5~10 글자 이내로 입력해주세요.</div>
	비밀번호 : <input type="password" id="userPw" name="userPw" required/><br />
	<div id="pwChk">소문자와 숫자를 포함하여 5~10글자 이내로 입력해주세요.</div>
	비밀번호 확인 : <input type="password" id="checkPw" name="checkPw" required/><br />
	<div id="chkMsg">비밀번호가 일치합니다.</div>
	<div id="failMsg">비밀번호가 일치하지 않습니다.</div>
	이름 : <input type="text" name="userName" required/><br />
	휴대폰 : <input type="text" id="userPhone" name="userPhone" placeholder="예) 01012345678" required/><br />
	<div id="phoneChk">하이픈(-)제외 숫자 11자리 입력 ex)01012345678</div>
	이메일 : <input type="email" name="userEmail" required/> <br />
	
	주소 : 
		<input type="text" id="sample4_postcode" placeholder="우편번호" readonly required>
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required><br>
		<input type="text" id="sample4_roadAddress" name="userAddress" placeholder="도로명주소" readonly required>
		<input type="text" id="sample4_jibunAddress" name="userAddress" placeholder="지번주소" readonly required>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" name="userAddress" placeholder="상세주소" required>
		<input type="text" id="sample4_extraAddress" name="userAddress" placeholder="참고항목" readonly><br>

	생년월일 : <input type="text" id="userBirth" name="userBirth" placeholder="예) 19990101" required/><br />
	<div id="birthChk">생년월일 8자리 입력 ex)19990101</div>
	<input type="submit" value="회원가입" />
</form>
<a href="index.do">메인페이지</a>

<!-- 우편번호 api 적용 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<script>
	//아이디 중복 체크
	$(function(){
		$('#idDup').on('click', function(){
			var idStr = $('#userId').val();
			$.ajax({
				url: 'idCheck.do',
				data: {'userId' : idStr},
				dataType: 'json',
				success: function(data){
					if(data.idDup=='dup'){
						alert('중복된 아이디입니다.');
					}else{
						alert('사용 가능한 아이디입니다.');
					}
				},
				error: function(data){
					alert('전송 오류');
				}
			});
		});
	});
	
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
	
	//아이디 정규식
	$(function(){
		$('#idChk').hide();
		$('input[name=userId]').keyup(function(){
			var userId = $('#userId').val();
			if(/^[a-z][a-z0-9]{4,9}$/.test(userId)){
				$('#idChk').hide();
			}else{
				$('#idChk').show();
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
	
	//생년월일 정규식
	$(function(){
		$('#birthChk').hide();
		$('input[name=userBirth]').keyup(function(){
			var userBirth = $('#userBirth').val();
			if(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/.test(userBirth))
				$('#birthChk').hide();
			else
				$('#birthChk').show();
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