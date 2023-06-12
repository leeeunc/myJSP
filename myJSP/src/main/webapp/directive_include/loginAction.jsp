
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function showAlert(massage) {
	alert(massage);
	location.href = "gogreen.jsp";
}
</script>

</head>
<body>
<h1>환영합니다.</h1>

<%
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	String saveYN = request.getParameter("save_check");
	out.print("saveYN : " + saveYN + "<br>");

	// out.print("saveYN test : " + saveYN);
	
	// 체크박스가 체크되었을경우, 아이디를 쿠키에 저장 합니다.
	if(saveYN != null &&  "Y".equals(saveYN)){
		// out.print("test 쿠키생성");
		CookieManager.makeCookie(response, "userId", id, 60*60*24*7);
	}
	
	if("abc".equals(id) && "123".equals(pw)){
		 // out.print("환영합니다.");
		 // 로그인 성공

		 // 세션에 저장
		 // 세션영역에 id 저장
		 session.setAttribute("id", id);
		 
		 // 다시 메인페이지로 이동하기
		  response.sendRedirect("gogreen.jsp"); // 다시 페이지로 돌아가기
	} else{
		// out.print("<script>showAlert('로그인 실패');</script>");
		// 로그인 실패
		 response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
	
%>

</body>
</html>