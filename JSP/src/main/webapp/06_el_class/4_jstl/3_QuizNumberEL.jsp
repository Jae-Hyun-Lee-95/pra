<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!-- 0. JSTL 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<title> 1~100까지 중 숫자 맞추기 </title>
</head>
<body>

<!-- 1. 이전화면 값 얻어와 guess 변수에 지정 -->
<c:set var='guess' value='${param.guess }'></c:set>

<!-- 2. 그 값이 없다면 임의의 수를 만들어 세션에 지정 -->
<c:if test="${ empty guess }">
	자 게임을 시작합니다.<br/>
	<%
		int ranNum =(int)(Math.random()*100)+1;
		session.setAttribute("answer", ranNum);
	%>
</c:if>


<!-- 3. 세션의 값을 가져와 answer 변수에 지정 -->
<c:set var='answer' value='${ sessionScope.answer }' />

<!-- 4. guess의 변수에 값이 있다면 -->
<!--  (1) guess와 answer값이 같다면 맞춰다고 출력 -->
<!--  (2) 다르다면 guess값이 answer값보다 크면 크다고 출력 작으면 작다고 출력 -->

	
		
	
	<c:if test="${ not(empty guess) }">
		<c:choose>
			<c:when test="${ guess gt answer }"> down</c:when>
			<c:when test="${ guess lt answer }"> up</c:when>
			<c:otherwise>정답입니다.</c:otherwise>
		</c:choose>
	</c:if>
	
	

			
	
	




	<hr><hr>
	1부터 100까지 수 중에서 하나를 잘 찍으시오~!! <br/>
	
	<form method='get'>
			어떤 수일까요?
			<input type='text' name='guess'>
			<input type='submit' value="Submit">
	</form>
</body>
</html>