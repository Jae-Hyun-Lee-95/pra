<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String prjName="/JSP"; %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start.jsp</title>
</head>
<body>

<a href='simpleView.jsp'>기존방식(상대경로)</a><br/>
<a href='<%= prjName %>/07_mvc_class/1_mvcSimple/simpleView.jsp'>기존방식(절대경로)</a><br/>

<hr/>
<a href='/JSP/SimpleControl'>MVC패턴</a>
<a href='/JSP/SimpleControl?type=first'>MVC패턴2</a>

<hr/>
<a href='<%= prjName %>/ictedu.do'>MVC패턴3</a>

</body>
</html>