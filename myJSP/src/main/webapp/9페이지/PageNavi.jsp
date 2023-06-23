<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
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


<c:set var="pageDto" value="${pageDto }"></c:set>
<c:if test="${pageDto.prev }">
	<a href='List.jsp?pageNo=${pageDto.startNo-1 }'>이전</a>
</c:if>

<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	<a href='List.jsp?pageNo=${i }'>${i }</a>
</c:forEach>

<c:if test="${pageDto.next }">
	<a href='List.jsp?pageNo=${pageDto.endNo+1 }'>다음</a>
</c:if>

</body>
</html>