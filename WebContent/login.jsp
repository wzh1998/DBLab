<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.UserDAO" %>
<%@ page import="ie.ucd.comp2004J.User" %>
    
    
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

out.print(username);
out.print(password);

User u = UserDAO.login(username, password);

if(u==null){
	//response.sendRedirect("index.jsp");
}
else{
	session.setAttribute("user", u);
	response.sendRedirect("employeeList.jsp?Page=1");
	
	//User u2 = (User)session.getAttribute("user");
}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
function alertFailed(){
	alert("Wrong Password or Username, Please Try Again!");
	window.document.location.href="index.jsp";
}
</script>

<title>Whoops! </title>
</head>
<body>
<script type="text/javascript">alertFailed();</script>
</body>
</html>