<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 탈퇴</h1>
<form action="memberDel.do" method="post">
	<input type="hidden" name="userId" value=${member.userId } />
	비밀번호 : <input type="password" name="userPw" />
	<input type="submit" value="탈퇴하기" />
</form>
<a href="index.do">메인페이지</a>
</body>
</html>