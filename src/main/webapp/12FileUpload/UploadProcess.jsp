<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파일이 저장될 디렉토리의 물리적 경로 얻어오기
String saveDirectory = application.getRealPath("/Uploads");
//업로드 할 파일의 최대용량 설정(만약 파일이 2개라면 둘을 합친 용량으로 설정)
int maxPostSize = 1024 * 1000;
//인코딩 방식 설정
String encoding = "UTF-8";

try{
	/*
	앞에서 준비한 객체를 통해 MultipartRequest객체를 생성한다.
	객체가 생성됨과 동시에 첨부한 파일은 서버에 업로드 된다.
	만약 예외가 발생한다면 용량 초과가 대부분이다.
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	/*
	파일명이 한글인 경우 서버에서 문제를 일으키는 경우가 있으므로 
	영문과 숫자로 변경하는것이 좋다. 아래에서는 현재 날짜와 시간을 통해
	생성된 문자열을 파일명으로 설정한다.
	*/
	//mr객체를 통해 서버에 저장된 파일명을 가져온다.
	String fileName = mr.getFilesystemName("attachedFile");
	//파일명에서 .의 위치를 파악한 후 확장자를 따낸다.
	String ext = fileName.substring(fileName.lastIndexOf("."));
	//현재날짜와 시간 및 밀리세컨즈까지 이용해서 파일명으로 사용할 문자열을 만든다.
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	//확장자와 파일명을 합쳐서 저장할 파일명을 만들어준다.
	String newFileName = now + ext;
	
	//기존의 파일명을 새로운 파일명으로 변경한다.
	//File.separator은 /(슬러쉬)와 같은 역할을 함.
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	/* 파일을 제외한 나머지 폼값을 받는다. 이때 request객체를 통해 받는것이
		아니므로 주의해야 한다. */
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	//checkbox의 경우 여러개의 값이 전송되므로 문자열을 연결해준다.
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray == null) {
		cateBuf.append("선택 없음");
	}
	else {
		for(String s :cateArray) {
			cateBuf.append(s + ", ");
		}
	}
	
	//DTO객체 생성 및 폼값 설정
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	//DAO객체 생성 및 insert처리
	MyfileDAO dao = new MyfileDAO();
	dao.insertFile(dto);
	dao.close();
	
	//문제가 없다면 파일리스트로 이동한다.
	response.sendRedirect("FileList.jsp");
}
catch(Exception e) {
	e.printStackTrace();
	//예외가 발생하면 request영역에 메세지를 저장한 후 메인으로 포워드 한다.
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	
}
%>