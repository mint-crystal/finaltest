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
	<c:choose>
		<c:when test="${result==1 }">
			<script>
				alert('회원가입 완료. 로그인해주세요.');
				location.href = 'index.do';
			</script>
		</c:when>	
		<c:otherwise>
			<script>
				alert('회원가입 실패');
				location.href = 'memberIns.do';
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>