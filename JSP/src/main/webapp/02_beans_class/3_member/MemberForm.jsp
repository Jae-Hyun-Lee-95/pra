<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</style>
<script type="text/javascript">

$(function(){
	// '중복확인' 버튼이 클릭했을 때
	$('#btnIdCheck').click(function(){
		var idInput = $('input[name="id"]').val();
		// 옛날방식
		//window.open('CheckId.jsp?userId='+ idInput,"창이름", "width=200, height=150");
		
		// [ Ajax 방식 ]
		var param = { 'userId' : idInput };
		$.ajax({
			type : 'post',
			url  : 'CheckId.jsp',
			data : param,
			success : function(result){
				if(result.trim() == 'true' ){
					$('#result').text('이미 아이디가 존재합니다');
				}else{
					$('#result').text('사용이 가능한 아이디 입니다.');
				}
			},
			error : function(err){
				alert('서버전송실패');
				console.log(err);
			}
		});
		
	});
})

</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr >
				<td width="100" >
				<font color="blue">아이디</font>
				</td>
				<td width="200" >
				<input type="text" name="id" >
				<input type="button" value="중복확인" id='btnIdCheck'>
				<!-- 결과출력 -->
				<span id='result' ></span>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호학인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" value="회원가입">
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    