<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 지시어를 통해 파일을 포함하게 되면 컴파일되지 않은 상태의
	코드가 그대로 포함된 후 컴파일이 진행된다. 따라서 아래에서 사용한
	변수들은 이미 해당 문서에 포함된 상태이므로 문제없이 실행된다.
--%>
<%@ include file = "IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<%
out.println("오늘날짜 : "+ today);
out.println("<br/>");
out.println("내일날짜 : "+ tomorrow);
%>
</body>
</html>