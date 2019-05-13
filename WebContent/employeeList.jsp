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
<script>
function alertNull(){
	alert("This is already The last Page!");
	/* var addr = "employeeList.jsp?Page=";
	var pagen = page-1;
	addr = addr + pagen.toString();  */
	window.document.location.href="employeeList.jsp?Page=1";
}
</script>
<title>Employee List</title>


</head>
<body>

<%
User u = (User)session.getAttribute("user");

if(u==null){
	response.sendRedirect("index.jsp");
}

int Page = Integer.parseInt(request.getParameter("Page"));
List<Employee> employees = EmployeeDAO.getAllEmployees(Page);
%>


<br />
<br />
<h1 style="font-size:250% " align="center"><font face="verdana" >View/Edit Employee</font></h1>
<br />
<br />

<div class="container">
	
<table border="1" align=center valign=middle>
<tr>
<td class="test1" style="background-color: White; valign:middle">
<h1 style="font-size:170% " ><font face="verdana" >
<%
if(employees.isEmpty()) {%> <script type="text/javascript">alertNull();</script> 
<%}
for(Employee e : employees){
%>
	

<a href="updateEmployee.jsp?empno=<%=e.getEmpno()%>&empname=<%=e.getName() %>&job=<%=e.getJob() %>&salary=<%=e.getSalary() %>&deptno=<%=e.getDeptno() %>"><button class="rkmd-btn btn-yellow ripple-effect">update</button></a>
<a href="confirmDeleting.jsp?empno=<%=e.getEmpno()%>"><button class="rkmd-btn btn-red ripple-effect">delete</button></a>
<!-- <div class="justify"> -->
<%=e.toString()%> 
<!-- <span></span></div> -->

<br/>

<%
}
%>

</font>
</h1>
</td>
</tr>
</table>

<br />
<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
 	<a href = "employeeList.jsp?Page=1" ><button class="rkmd-btn btn-lightBlue" ">FirstPage</button></a>  
    <%if(Page>1) { %>
    <a href = "employeeList.jsp?Page=<%=Page-1%>" ><button class="rkmd-btn btn-lightBlue" ">Previous</button></a>  
    <%} %>
    <a href = "employeeList.jsp?Page=<%=Page+1%>" ><button class="rkmd-btn btn-lightBlue" ">Next</button></a>  
    
    <button class="rkmd-btn btn-flat" disabled>Current Page:<%=Page%> Total Page:<%=EmployeeDAO.getPageNum() %></button>
	
	<a href = "addEmployee.jsp"><button class="rkmd-btn btn-deepPurple ripple-effect">Add Employee</button></a>
</div>

</body>
</html>