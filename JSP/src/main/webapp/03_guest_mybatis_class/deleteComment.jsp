<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="mybatis.guest.service.CommentService" %> 
<%
	int cNo = Integer.parseInt( request.getParameter("cNo"));

	CommentService service = CommentService.getInstance();
	service.deleteComment(cNo);
	
	response.sendRedirect("listComment.jsp");
	
%>
    