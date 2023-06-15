
<%@page import="common.JSFunction"%>
<%@page import="java.awt.Button"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
BoardDao dao = new BoardDao();

dao.updateVisitCount(request.getParameter("num"));

Board board = dao.selectOne(request.getParameter("num"));



if(board == null ){
	
	 JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
	 
		return;
}
%>
<script>

	function deletePost(){
		var res = confirm("삭제 하겠습니까?");
		if(res){
			location.href="DeleteProcess.jsp?num=<%= board.getNum()%>"
		}
		
	}
	
</script>
</head>
<body>

<jsp:include page= "Link.jsp" />

<h2>회원제 게시판 - 상세보기(View)</h2>

<table border ="1" width="90%">
	<tr>
		<td width="10%">번호</td>
		<td width="35%"><%out.print(board.getNum()); %></td>
		<td width="20%">작성자</td>
		<td width="25%">	<%out.print(board.getId()); %></td>
	</tr>
	<tr>
		<td width="10%">작성일</td>
		<td width="35%"> <% out.print(board.getPostdate());%></td>
		<td width="20%">조회수</td>
		<td width="25%"> <% out.print(board.getVisitcount()); %></td>
	</tr>
	
	<tr>
		<td width="10%">제목</td>
		<td width="80%" colspan="3"> 	<%out.print(board.getTitle()); %></td>
	</tr>
	
	<tr height="200px">
		<td width="10%">내용</td>
		<td width="80%" colspan="3">	<%= board.getContent().replace("\r\n","<br/>") %></td>
	</tr>
	<tr>
		<td width="90%" colspan="4" align="center">



		<button type="button" onclick="location.href='Board.jsp'">목록보기</button>
	<%
		if(session.getAttribute("UserId") != null 
			&& board.getId().equals(session.getAttribute("UserId"))){
	%>
		<button type="button" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>'">수정하기</button>
		<button type="button" onclick="deletePost()">삭제하기</button>
	<%
		}
	%>

		</td>
	</tr>
	
</table>

</body>
</html>