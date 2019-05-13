<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/loginstyle.css">
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />
<link rel="stylesheet" href="css/buttonstyle.css">
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js" tppabs="js/verificationNumbers.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
});
</script>
<title>Update Employee</title>
</head>
<body>
<br />
<h1 style="font-size:200% " align="center"><font face="verdana" >COMP2004J Employee System -Updating</font></h1>

<%

if(session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
}

int empno = Integer.parseInt(request.getParameter("empno"));
String empname = request.getParameter("empname");
String job = request.getParameter("job");
float salary = Float.parseFloat(request.getParameter("salary"));
int deptno = Integer.parseInt(request.getParameter("deptno"));

%>


<div class="login-page">
  <div class="form">
	<form class="login-form" method="post" action="confirmUpdate.jsp">
		Employee No: <input type="text" value="<%=empno %>" name="empno" readonly="true" />
		Name:<input type="text" value="<%=empname%>" name="newname"/>
		Job:<input type="text" value="<%=job%>" name="newjob"/>
		Salary:<input type="text" value="<%=salary%>" name="newsalary"/>
		Department No:<input type="text" value="<%=deptno%>" name="newdeptno"/>
		<button>Confirm UPDATE</button> 
	</form>
  </div>
</div>

</body>
</html>