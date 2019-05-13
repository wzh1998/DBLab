<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js" tppabs="js/verificationNumbers.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>
<script>
function alertSuccess(){
	alert("Updating Success!");
	window.document.location.href="employeeList.jsp?Page=1";
}
function alertFailed(){
	alert("Updating Failed! Invalid input is detected");
	window.document.location.href="employeeList.jsp?Page=1";
}
</script>
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
<%
if(session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
}

int empno = Integer.parseInt(request.getParameter("empno"));
String newname = request.getParameter("newname");
String newjob = request.getParameter("newjob");
float newsalary = Float.parseFloat(request.getParameter("newsalary"));
int newdeptno = Integer.parseInt(request.getParameter("newdeptno"));
Employee e = new Employee(empno, newname, newjob, newsalary, newdeptno);
if(EmployeeDAO.updateEmployee(e)) %> <script type="text/javascript"> alertSuccess();</script>
<% 
else %> <script type="text/javascript"> alertFailed();</script>



</body>
</html>