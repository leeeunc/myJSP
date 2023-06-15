<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Link.jsp" />

<%
	String num = request.getParameter("num");
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num);
%>
<h2>회원제 게시판 - 수정하기</h2>
<form action="EditProcess.jsp" method="post">
<input type="text" value="<%= num %>" name="num">

<table border="1px" width="90%">
	<tr>
		<td>제목</td>
		<td> <input type="text" value="<%=board.getTitle()%>" name="title" style="width:90%"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name ="content"  style ="width:90%; height:100%"><%=board.getContent() %></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
		<button type="submit">수정하기</button>
		<button type="reset">초기화</button>
		<button type="button" onclick="location.href='Board.jsp'">목록보기</button>
		</td>
	</tr>
	
	
</table>
</form>


</body>
</html>