<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - param</title>
</head>
<body>
	<!-- 
		액션태그는 태그의 형태를 지니고 있어 소스의 이질감이 줄어들고
		jsp코드보다 훨씬 짧은 코드로 동일한 기능을 구현할 수 있다.
	 -->
	<h2>자바빈을 활용한 매개변수 전달</h2>
	<%
		request.setCharacterEncoding("utf-8");
	%>

	<h2>자바빈객체를 파라메터로 전달하기</h2>
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	<jsp:setProperty property="name" name="person" value="하니" />
	<jsp:setProperty property="age" name="person" value="20" />

	<!-- 
		jsp:include, jsp:forward 액션태그 이용시
		파라메터를 전달할 수 있다.
	 -->
	 
	 <%
	 	String pValue = "StringValue";
	 %>
	 
	<jsp:forward page="ParamForward.jsp?param1=쿼리스트링">
		<jsp:param value="param2" name="param2"/>
		<jsp:param value="<%=pValue %>" name="param3"/>
	</jsp:forward>


</body>
</html>