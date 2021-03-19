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
<table>
	<tr>
		<th>제목</th>
	</tr>
	<c:forEach var="board" items="${boardList }">
	<tr><td><a href="boardDetail.do?num=${board.num}">${board.title}</a></td></tr>
	</c:forEach>
</table>
</body>
</html>