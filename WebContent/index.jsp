<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<link rel="stylesheet" href="css/loginstyle.css">
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />

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
<title>Login</title>

</head>
<body>
<br />
<br />
<h1 style="font-size:250% " align="center"><font face="verdana" >Hello COMP2004J Employee System</font></h1>

<div class="login-page">
  <div class="form">
    <form class="login-form" method="post" action="login.jsp">
      <input type="text" placeholder="username" name="username"/>
      <input type="password" placeholder="password" name="password"/>
      <button>login</button>
    </form>
  </div>
</div>


</body>
</html>