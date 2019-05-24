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

</script>
<script>
function alertSuccess(){
	alert("Inserting Success!");
	window.document.location.href="actuator-control.jsp?Page=1";
}
function alertFailed(){
	alert("Inserting Failed! Invalid input, probably bacause primary key is already exists!!!");
	window.document.location.href="actuator-control.jsp?Page=1";
}
</script>
<title>Insert title here</title>
</head>
<body>
<%
 if(session.getAttribute("user") == null) {
	response.sendRedirect("index.jsp");
} 

int ActID = Integer.parseInt(request.getParameter("ActID"));
/* int ActState = Integer.parseInt(request.getParameter("ActState")); */
String ActName = request.getParameter("ActName");
Actuator e = new Actuator(ActID, ActName, 2);

if(ActuatorDAO.insertActuator(e)) %> <script type="text/javascript"> alertSuccess();</script>
<% else %> <script type="text/javascript">alertFailed();</script>

</body>
</html>