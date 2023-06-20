<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../6세션/IsLogin.jsp" %>
<%

	String title = request.getParameter("title"); // write.jsp의 input nmae속성
	String content = request.getParameter("content");

	String id = session.getAttribute("UserId").toString();
	
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	
	NewBoardDao dao = new NewBoardDao();
	int res = dao.insert(board);
	
	if(res>0){
		JSFunction.alertLocation("게시글이 등록 되었습니다.", "List.jsp", out);
	} else{
		JSFunction.alertBack("게시글 등록이 실패하였습니다.", out);
	}
	
		
			
	
%>


</body>
</html>