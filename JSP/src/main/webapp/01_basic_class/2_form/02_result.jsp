<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!--  1) 이전 화면의 폼으로부터 사용자 입력값 얻어오기 -->   
 <%
 	String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String occupation = request.getParameter("occupation");
    String[] hobbys = request.getParameterValues("hobby");
    String hobby = "";
    if(hobbys != null){
    	for(String v : hobbys){
    		hobby += v + "/";
   	 }
    }
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  -->
이 름 : <%= name %><br/>
성 별 : <%= gender %><br/>
직 업 : <%= occupation %><br/>
취 미 : <%= hobby %><br/>
</body>
</html>