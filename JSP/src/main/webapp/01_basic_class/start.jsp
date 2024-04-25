<%@ page
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! String name; %>

<% name ="안녕하세요"; 

	String msg = "맛점합시다";

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	인사말 : <%= name %><hr/>
	짝궁님 : <%= msg %>
	
	<!-- HTML 주석 -->
	<% // 자바주석 %>
	<% /* 자바주석 */ %>
	<%-- jsp 주석 --%>
	
</body>
</html>