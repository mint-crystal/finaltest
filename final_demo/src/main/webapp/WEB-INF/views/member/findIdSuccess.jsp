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
<h1>아이디 찾기 결과</h1>
<c:if test="${not empty member }">
회원님의 아이디는 [ <b>${member}</b> ] 입니다.<br>
</c:if>
<c:if test="${empty member}">
일치하는 회원 정보가 없습니다.<br>
</c:if>

<a href="memberLogin.do">로그인하러 가기</a>
<a href="index.do">메인페이지</a>
</body>
</html>