<%@page import="dto.Criteria"%>
<%@page import="model2.mvcboard.MVCBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC모델2 게시판</h2>

		
 	 <h4>총 게시물수 : ${totalCnt }</h4>
	    <!-- 검색폼 --> 
  	 <%-- 총 건수 : <%= totalCnt %> --%> 
    <form method="get" name = 'searchForm'>
    <table border="1" width="90%">
    <!-- 페이지 번호 -->
    <input type="hidden" name="pageNo"> <!-- 보이게 하려면 type="text" -->
    <tr>    
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content" 
                	${param.searchField eq "content" ? "selected" : "" }>내용</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord }" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
	

 	 
	<table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th >번호</th>
            <th >제목</th>
            <th >작성자</th>
            <th >조회수</th>
            <th >작성일</th>
            <th >첨부</th>
        </tr>
        
        
        

        
        <!-- 목록의 내용 --> 
        <c:choose>
			<c:when test="${empty MVClist }">
				<tr>
					<td colspan="6"> 검색 결과가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${MVClist }" var="row" varStatus="loop">
		        	<tr>
		        		<td>${row.idx }</td>
		        		<td>
			        		<a href="../mvcboard/view.do?idx=${row.idx }">
			        			${row.title}
			        		</a>
		        		</td>
		        		<td>${row.name}</td>
		        		<td>${row.visitcount}</td>
		        		<td>${row.postdate}</td>
		        		<td></td>
		        	</tr>
		        </c:forEach>
			</c:otherwise>
        </c:choose>

    </table>
	
	<!-- 글쓰기 버튼 달기
		글쓰기 버튼 클릭시 글쓰기 페이지로 이동
		등록 버튼 클릭하면 글 등록 -->
		<table border="1" width="90%" >
		<tr align="right">
			<td>
				<button onclick="location.href='../mvcboard/write.do'">글쓰기</button>
			</td>
		</tr>
		</table>
	
	<table border="1" width="90%">
	<!--  페이지 블럭 -->
		<tr align="center">
			<td>
				<%@include file="../14MVCBoard/PageNavi.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>