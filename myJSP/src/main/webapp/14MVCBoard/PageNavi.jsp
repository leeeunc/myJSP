<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
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

<script>
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}
	
</script>

<!-- 영역에 저장 -->
<c:set var="pageDto" value="${pageDto }"></c:set>
<c:if test="${pagedTO.PREV }">

</c:if>




<!-- 이전 -->	
<c:if test="${pageDto.prev}">
<%-- 	<a href="list.jsp?pageNo=${pageDto.startNo-1 }"> 이전</a> --%>
	<input type="button" value="이전" onclick ="go(${pageDto.startNo-1})">
</c:if>

<!--  페이지 번호 출력 -->
<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	<input type="button" value="${i }" onclick="go(${i})">
</c:forEach>

<!-- 다음 -->
<c:if test="${pageDto.next}">
<%-- 	<a href="list.jsp?pageNo= ${pageDto.endNo+ 1 }"> 다음</a> --%>
	<input type="button" value="다음" onclick ="go(${pageDto.endNo+1})">
</c:if>



</body>
</html>