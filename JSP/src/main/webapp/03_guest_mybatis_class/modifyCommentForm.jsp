<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.Comment" %> 
<%@ page import="mybatis.guest.service.CommentService" %> 
<%
	String cNo = request.getParameter("cNo");
	
	CommentService service = CommentService.getInstance();
	//Comment comment = service.getArticleByNo(cNo);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

메세지를 남겨주세요.
<form name="frm" action="insertCommentForm.jsp" >
<table>
	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3" value='<%=cNo%>'/></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15"/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>
</body>
</html>