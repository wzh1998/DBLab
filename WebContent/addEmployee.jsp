<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />
<link rel="stylesheet" href="css/loginstyle.css">
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
<title>Add Employee</title>
</head>
<body>
<br />
<%
if(session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
}
%>

<h1 style="font-size:200% " align="center"><font face="verdana" >COMP2004J Employee System -Adding</font></h1>

<div class="login-page">
  <div class="form">
	<form class="login-form" method="post" action="confirmAdding.jsp">
	
      	Employee No:<input type="text" name="newempno" />
		Name:<input type="text"  name="newname"/>
		Job:<input type="text"  name="newjob"/>
		Salary:<input type="text" name="newsalary"/>
		Department No:<input type="text" name="newdeptno">
		<button>Confirm ADDING</button> 
	</form>
  </div>
</div>



</body>
</html>