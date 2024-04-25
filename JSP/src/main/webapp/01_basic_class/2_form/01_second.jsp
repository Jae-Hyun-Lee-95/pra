<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 혹시 한글이 깨지면
	//request.setCharacterEncoding("UTF-8");
	
	String user = request.getParameter("User"); // 데이터값 받아오기(주소)
	String pass = request.getParameter("Pass");
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 : <%= user %>님 <br/>
	입력한 패스워드 : <%= pass %>님
</body>
</html>