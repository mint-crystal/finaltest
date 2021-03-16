<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
<form action="memberLogin.do" method="post">
	ID : <input type="text" name="userId" />
	PW : <input type="password" name="userPw" />
	<input type="submit" value="로그인" />
</form>
<a href="findId.do">아이디 찾기</a> | 
<a href="findPw.do">비밀번호 찾기</a>
</body>
</html>