<%@page import="dto.Person"%>
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
	pageContext.setAttribute("page", "페이지영역(스코프)");
	pageContext.setAttribute("page_int", 10000);
	pageContext.setAttribute("pagePerson", new Person("하니",20));
%>

	<h2>page영역의 속성 값 읽기</h2>
	
	<%
		// object 타입으로 변환 되므로 형변환이 필요 합니다!!
		String page_str = pageContext.getAttribute("page").toString();
		int page_int = (Integer)pageContext.getAttribute("page_int");
		Person page_person = (Person)pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>int : <%=page_int %></li>
		<li>String : <%=page_str %></li>
		<li>Person : <%=page_person.getName() %>, <%=page_person.getAge() %></li>
		
	</ul>

	<h2>Include된 파일에서 page 영역 읽어오기</h2>
	<p>Include지시어로 감싼 JSP파일은 포함관계를 가지므로 같은 페이지</p>
	<p>페이지 영역이 공유 됩니다.</p>
	
	<%@ include file = "pageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<!-- 링크를 이용해서 페이지를 다시 요청 하게되면 페이지 영역이 초기화 됩니다. -->
	<a href = "PageLocation.jsp">PageLocation.jsp 바로가기</a>

</body>
</html>