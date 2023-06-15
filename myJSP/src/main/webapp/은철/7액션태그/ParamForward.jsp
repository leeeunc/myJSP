<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>

	<jsp:getProperty property="name" name="person" /><br>
	<jsp:getProperty property="age" name="person" />
	
	<h2>forward된 페이지 에서 매개변수 확인!!</h2>
	<%= request.getParameter("param1") %><br>
	<%= request.getParameter("param2") %><br>
	<%= request.getParameter("param3") %><br>
	
	<!-- jsp:include 액션태그를 이용해 다른페이지를 불러올 때 
	jsp:param 액션태그를 이용시 파라메터를 전달할 수 있습니다. -->
	
	<h2>jsp:include페이지에 파라메터 넘기기</h2>
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="서울 구로구" name="loc1"/>
		<jsp:param value="서울 양천구" name="loc2"/>
	</jsp:include>
</body>
</html>