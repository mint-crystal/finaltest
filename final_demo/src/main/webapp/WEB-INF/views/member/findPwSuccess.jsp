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
<h1>비밀번호 변경</h1>
<c:if test="${not empty userPw }">
<form action="changePw.do" method="post">
새 비밀번호 : <input type="text" name="userPw"><br/>
비밀번호 확인 : <input type="text" ><br/>
<input type="submit" value="비밀번호 변경">
</form>
</c:if>
<c:if test="${empty userPw }">
일치하는 회원 정보가 없습니다.
</c:if>
</body>
</html>