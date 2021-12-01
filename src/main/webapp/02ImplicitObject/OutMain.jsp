<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장객체 - out</title></head>
<body>
	<%
	//out객체를 통해 print()메서드를 호출하면 인자로 전달된 내용을 화면상에 출력할 수 있다.
	out.print("출력되지 않는 테스트"); 
	//버퍼에 저장된 내용을 삭제한다. 그러면 앞의 내용은 출력되지 않는다. 
	out.clearBuffer();
	
	out.print("<h2>out 내장 객체</h2>");
	//버퍼 크기 확인
	out.print("출력 버퍼의 크기 : "+ out.getBufferSize()+"<br>");
	out.print("남은 버퍼의 크기 : "+ out.getRemaining()+"<br>");
	
	//버퍼에 저장된 내용을 플러시(출력)한다. 
	out.flush();
	out.print("flush 후 버퍼의 크기 : "+ out.getRemaining()+"<br>");
	
	//다양한 타입의 값을 출력한다. 
	out.println(1);
	out.println(false);
	out.print('가');
	/*
	print()와 println()의 차이는 출력된 문자열 뒤에 \n을 하나 추가하는 정도이다.
	웹브라우저에서는 줄바꿈을 위해 <br>태그가 필요하므로 두 메서드의 차이는
	스페이스 한칸이 추가되는 정도이다.
	*/
	%>
</body>
</html>