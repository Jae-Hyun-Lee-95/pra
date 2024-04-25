<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="temp.*" %>

<%

// 1. 이전화면의 입력값을 얻어오기
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String deptno = request.getParameter("deptno");
	String job = request.getParameter("job");
	String sal = request.getParameter("sal");

// [확인] 콘솔(System.out.println)에 출력
	System.out.println(empno);
	System.out.println(ename);
	System.out.println(deptno);
	System.out.println(job);
	System.out.println(sal);
	
// 2. 입력값들을 EmpVO 에 멤버로 지정
	EmpVO vo = new EmpVO();
	vo.setEmpno(Integer.parseInt(empno));
	vo.setEname(ename);
	vo.setDeptno(Integer.parseInt(deptno));
	vo.setJob(job);
	vo.setSal(Integer.parseInt(sal));
	
	// 3. EmpDao에 insertEmp()로 2번 객체 전송
	//EmpDao dao = new EmpDao();	에러 이유 private으로 막혀있어서 객체를 불러오지 못함
	EmpDao dao = EmpDao.getInstance();
	dao.insertEmp(vo);


%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.
	 
	 <hr/>
	 
	 <a href='09_empSelect.jsp'>사원정보보기</a>
	 <hr/>
	 
</body>
</html>