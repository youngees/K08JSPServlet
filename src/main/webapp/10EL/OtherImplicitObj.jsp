<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿠키 유틸리티 클래스를 사용해서 유효기간이 10초인 쿠키를 생성
CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 그 외 내장 객체</title>
</head>
<body>
	<h3>쿠키값 읽기</h3>
	<!--  
		EL로 읽을경우 cookie.쿠키명.value의 형태로 사용한다. 
		단, 쿠키는 생성직후에는 값을 읽을 수 없다.
	-->
	<li>ELCookie값 : ${cookie.ELCookie.value}</li>
	
	<h3>HTTP 헤더 읽기</h3>
	<!-- 여러가지 요청헤더값을 읽을 수 있다. -->
	<ul>
		<li>host : ${header.host }</li>
		<!--
			user-agent와 같이 속성명에 -(하이픈)이 포함된 경우에는 .으로
			출력할 수 없다. 이때는 반드시 [(대괄호)를 사용해야 한다.
			"header.user-agent"이와같이 쓰면 값이 제대로 출력되지 않는다. 
		-->
		<li>user-agent : ${header['user-agent'] }</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	
	<h3>컨텍스트 초기화 매개변수 읽기</h3>
	<!-- web.xml에 기술된 내용을 확인 -->
	<li>OracleDriver : ${initParam.OracleDriver }</li>
	
	<!-- 이클립스 환경에서는 "프로젝트명/"와 같이 출력된다. -->
	<h3>컨텍스트 루트 경로 읽기</h3>
	<li>${pageContext.request.contextPath }</li>
</body>
</html>