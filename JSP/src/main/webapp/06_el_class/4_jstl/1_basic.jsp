<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1_basic.jsp</title>
</head>
<body>
<!-- String gender="male"; 아래 자바 코딩 -->
<c:set var='gender' value='male' />

<!-- 제어 흐름 -->
<c:if test="${ gender eq 'male' }">
	당신은 남자입니다. <br/>
</c:if>

<c:if test="${ gender eq 'female' }">
	당신은 여자입니다. <br/>
</c:if>

<c:set var='age' value='29' />
<c:choose>
	<c:when test="${age lt 10 }">어린이입니다.</c:when>
	<c:when test="${age ge 10 and age lt 20}">청소년입니다.</c:when>
	<c:otherwise>어른입니다.</c:otherwise>
</c:choose>

<c:set var='sum' value='0' />
<c:forEach var='i' begin='1' end='100'>
	<c:set var='sum' value='${ sum+i }' />
</c:forEach>
<hr/>
1~100까지의 합 : ${ sum }
<hr/>

<c:set var='sumEven' value='0' />
<c:forEach var='i' begin='1' end='100'>
	<c:if test="${i%2 eq 0 }">
	<c:set var='sumEven' value='${ sumEven+i }' />
	</c:if>
</c:forEach>

<c:set var='sumOdd' value='0' />
<c:forEach var='i' begin='1' end='100'>
	<c:if test="${i%2 eq 1 }">
	<c:set var='sumOdd' value='${ sumOdd+i }' />
	</c:if>
</c:forEach>


<hr/>
1~100까지의 짝수의 합 : ${ sumEven+i }
<hr/>
<hr/>
1~100까지의 홀수의 합 : ${ sumOdd+i }
<hr/>


</body>
</html>