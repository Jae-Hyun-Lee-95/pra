<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/info.css" type="text/css" media="screen" /> 

</head>
<body>

<form action='InfoSave.jsp' method='post'>
	<fieldset>
	<h1>회원가입서 작성하기</h1>
	<div>
	<label for='id'>아이디</label>
	<input id='id' name='id' type='text' placeholder='5자~10자 영어와 숫자조합'>
	<input type='button' class='btn1' value='중복확인'><br/>
	</div>
	
	<div>
	<label for='pass'>비밀번호</label>
	<input id='pass' name='pass' type='text' placeholder='4자이상 영어와 숫자조합'><br/>
	</div>
	
	<div>
	<label for='passcheck'>비밀번호확인</label>
	<input id='passcheck' name='passcheck' type='text' ><br/>
	</div>
	
	<div>
	<label for='name'>이름</label>
	<input id='name' name='name' type='text' placeholder='한글 5자 이내' ><br/>
	</div>
	
	<div>
	<label for='tel'>전화번호</label>
	<input id='tel' name='tel' class='tel' type='text' placeholder='-없이 숫자조합' ><br/>
	</div>
	
	<div>
	<label for='address'>주소</label>
	<input id='address' name='address' class='addr' type='text' placeholder='20자 이내' ><br/>
	</div>
	
	
	
	<div>
	<input type='submit' value='회원가입'>
	<input type='button' class='btn2' value='취소'>
	</div>
	
	
	



	</fieldset>
</form>

</body>
</html>