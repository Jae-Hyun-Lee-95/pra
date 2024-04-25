<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='reply_ex.model.*' %>
<%@ page import='reply_ex.service.*' %>
    <!-- 0.한글처리 -->
    <%request.setCharacterEncoding("utf-8");%>
    
    <!-- 1. 이전화면에서 넘겨오는 값을 VO에 멤버변수 지정하기 -->
    
    <jsp:useBean id="vo" class='reply_ex.model.ReplyVO'>
    	<jsp:setProperty name='vo' property='*'></jsp:setProperty>
    </jsp:useBean>
    
    <!-- 2. 서비스단에 함수로 vo 객체 넘기기 -->
    <%
    ReplyInsertService.getInstance().write(vo);
    %>
    
<% // 확인
	System.out.println(vo.toString());
%>