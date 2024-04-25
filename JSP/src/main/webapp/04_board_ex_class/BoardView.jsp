<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.service.*, board_ex.model.*" %>
<%
	// 게시글번호 넘겨받아
	String seq = request.getParameter("seq");
	// 서비스의 함수를 호출하여 해당 BoardVO를 넘겨받는다.
	ViewArticleService service = ViewArticleService.getInstance();
	BoardVO vo = service.getArticleById(seq);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 게시글 보기 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#replyBtn").click(function(){
		var seq = $('#seq').val();
		var user = $('#user').val();
		var reply = $('#reply').val();
		
		 var param = {
			seq : $('#seq').val(),
			user : $('#user').val(),
			reply : $('#reply').val()	
		} 
		
		 $.ajax({
			type : 'get'
			,url : 'ReplySave.jsp'
			,data : param
			,success : function(){
				$('#user').val('');
				$('#reply').val('');
				// 추후에 댓글목록보여주기
				 selectReply();
			}
		 	,error : function(){
		 		alert('댓글입력실패');
		 	} // end of ajax
				
		 }); // end of click(button)
		 
		 selectReply();
		 
		 // 댓글 목록가져오기
		 function selectReply(){
			 // ajax 처리
			 
		 }
		 

	})
})
</script>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= vo.getTitle() %></td>                                                                                               
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= vo.getWriter() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= vo.getRegdate() %></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%= vo.getContent() %></td>
	</tr>
	<tr>
		<td> 조회수 : </td>
		<td><%= vo.getCnt() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="BoardList.jsp"> 목록보기 </a>
			<a href="BoardModifyForm.jsp?seq=<%=vo.getSeq()%>"> 수정하기 </a>
			<a href="BoardDeleteForm.jsp?seq=<%=vo.getSeq()%>"> 삭제하기 </a>		
		</td>
	</tr>
	</table>
	
	<!-- 댓글추가 -->
	<form id='replyFrm' name='replyFrm'>
		<input type='hidden' name='seq' id='seq' value='<%=seq%>'>
		<input tyep='text' id='user' placeholder="유저아이디">
		<input type='text' id='reply' placeholder="댓글내용" >
		<input type='button' id='replyBtn' value='댓글추가'>
		<hr/>
	</form>
	
	<!-- 댓글목록 띄우기 -->
	<table border='1' id='replyList'>
		
		<tr>
			<td width='100' align="center">댓글 번호</td>
			<td width='100' align="center">게시글 번호</td>
			<td width='100' align="center">작성자</td>
			<td width='300' align="center">내용</td>
		</tr>
	</table>



</body>
</html>