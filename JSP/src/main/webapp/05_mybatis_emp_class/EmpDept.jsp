<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="emp_mybatis.*, java.util.*" %>  
    
<%
EmpService service = EmpService.getInstance();
List<HashMap> list = service.selectEmpDept();%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h2>사원정보</h2>
<!--  출력 -->
<table border='1'>
<tr><td>사번</td><td>사원명</td><td>업무</td>
	<td>부서명</td><td>위치</td>
</tr>


	<% for(HashMap vo : list) { %>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr> 
	<%} %>
</table>

</body>
</html>