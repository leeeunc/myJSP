<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.sql.Connection"%>
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
	BoardDao dao = new BoardDao();

	String num = request.getParameter("num");
	out.print(num);
	
	int res =  dao.delete(num);
	
	if(res > 0){
		JSFunction.alertLocation("삭제가 완료되었습니다.", "Board.jsp", out);
	} else{
		JSFunction.alertBack("삭제가 실패했습니다.", out);
	}
	
	
	
%>
	
	

</body>
</html>