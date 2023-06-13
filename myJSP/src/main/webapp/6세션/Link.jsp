<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%"> 
    <tr>
        <td align="center">
        
        <%
        	String userid = (String)session.getAttribute("UserId");
        		
        	if(userid == null || "".equals(userid)){
        %>
            <a href="../6세션/LoginForm.jsp">로그인</a>
        <%		
        	}else{
        %>
 			<a href="../6세션/Logout.jsp">로그아웃</a>
        <%		
        	}
        %>
        
        
        
        
        
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../08Board/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
        </td>
    </tr>
</table>
