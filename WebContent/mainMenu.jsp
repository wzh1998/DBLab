<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.EmployeeDAO" %>
<%@ page import="ie.ucd.comp2004J.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="ie.ucd.comp2004J.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css" tppabs="css/style.css" />
<link rel="stylesheet" href="css/buttonstyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
td.test1 {padding: 1.5cm}
div.justify { text-align: justify; width:600px; font-size:20px; color=black; height:18px;}
div.justify > span { display: inline-block; padding-left: 100%; }
</style>
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

<title>Main Menu</title>


</head>
<body>

<%
User u = (User)session.getAttribute("user");

if(u==null){
	response.sendRedirect("index.jsp");
}
%>

<!-- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 -->	
<a href = "viewAlarm.jsp"><button class="rkmd-btn btn-deepPurple ripple-effect">View Alarm</button></a>
<a href = "viewBTLock.jsp"><button class="rkmd-btn btn-deepPurple ripple-effect">View Bluetooth Lock</button></a>
<a href = "viewCurtain.jsp"><button class="rkmd-btn btn-deepPurple ripple-effect">View Curtain</button></a>

</body>
</html>