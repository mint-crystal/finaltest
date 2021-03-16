<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>어른허브</h1>
<c:if test="${not empty member}">
	[ <b>${member.userId}</b> ]님 환영합니다.
	<a href="memberLogout.do">로그아웃</a> | 
	<a href="memberUpt.do">정보수정</a> | 
	<a href="memberDel.do?userId=${member.userId }">회원탈퇴</a>
</c:if>
<c:if test="${empty member}">
<a href="memberLogin.do">로그인</a> | 
<a href="memberIns.do">회원가입</a>
</c:if>
</body>
</html>