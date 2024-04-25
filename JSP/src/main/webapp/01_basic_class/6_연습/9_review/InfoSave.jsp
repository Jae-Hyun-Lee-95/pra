<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "temp.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user = request.getParameter("id");
	String pass = request.getParameter("pass");
	String passCk = request.getParameter("passcheck");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String adress = request.getParameter("address");
	
	InfoVO vo = new InfoVO();
	vo.setId(user);
	vo.setPw(pass);
	vo.setPwCk(passCk);
	vo.setName(name);
	vo.setTel(tel);
	vo.setAddr(adress);
	
	InfoDao dao = InfoDao.getInstance();
	
	
%>

</body>
</html>