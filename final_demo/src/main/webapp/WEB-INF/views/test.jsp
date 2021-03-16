<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 네이버 스마트 에디터 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/smarteditor2/js/HuskyEZCreator.js " charset="utf-8"></script>
</head>
<body>
<textarea class="form-control" rows="20" name="bo_content" id="bo_content"></textarea>

<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
  oAppRef : oEditors,
  elPlaceHolder : "bo_content",
  sSkinURI : "<%=request.getContextPath() %>/resources/smarteditor2/SmartEditor2Skin.html",
  fCreator : "createSEditor2"
});
</script>
</body>
</html>
