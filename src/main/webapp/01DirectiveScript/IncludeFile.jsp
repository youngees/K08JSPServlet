<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalDateTime"%>
<%-- 
	포함되는 페이지를 만들때에도 반드시 page지시어는 있어야한다. 
	page지시어가 없는 jsp파일은 오류가 발생한다. 
--%>
<%
LocalDate today = LocalDate.now();
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>
