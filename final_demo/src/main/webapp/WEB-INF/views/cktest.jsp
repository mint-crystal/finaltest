<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<form action="cktest.do" method="post" enctype="multipart/form-data">
제목 : <input type="text" name="title" />
<textarea id="content" name="content"></textarea>
<input type="submit" value="등록" />
</form>

<script type="text/javascript">
CKEDITOR.replace('content',{filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'});

</script>
</body>
</html>