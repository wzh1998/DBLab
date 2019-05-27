<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ie.ucd.comp2004J.UserDAO" %>
<%@ page import="ie.ucd.comp2004J.User" %>
    
<script>
function alertFailed(){
	alert("Wrong Username or Password, Please Try Again!");
	window.document.location.href="index.jsp";
}
</script> 
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

out.print(username);
out.print(password);

User u = UserDAO.login(username, password);

if(u==null){
	
	
}
else{
	session.setAttribute("user", u);
	response.sendRedirect("Overview.jsp");

	//User u2 = (User)session.getAttribute("user");
}

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Whoops! </title>
</head>
<body>
<script type="text/javascript">alertFailed();</script>
<%-- <%response.sendRedirect("index.jsp"); %> --%>
</body>
</html>