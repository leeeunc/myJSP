<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	if("abc".equals(id) && "123".equals(pw)){
		out.print("로그인성공");
		response.sendRedirect("login.jsp?name=" + id);
	} else{
		out.print("로그인실패");
		response.sendRedirect("login.jsp?loginErr=Y");
	}
	
%>

</body>
</html>