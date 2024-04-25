<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.Comment" %> 
<%@ page import="mybatis.guest.service.CommentService" %>

<%
	request.setCharacterEncoding("utf-8");
%>

 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>   
 
 
<%
	CommentService.getInstance().modifyComment(comment);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
입력되었는지 확인합시다.<br/>
<a href="listComment.jsp">목록보기</a>

</body>
</html>