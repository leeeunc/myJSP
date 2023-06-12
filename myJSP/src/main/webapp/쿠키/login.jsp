<%@page import="utils.CookieManager"%>
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
	String loginErr = request.getParameter("loginErr");
	
	if("Y".equals(loginErr)){
	out.print("<script>alert('아이디/비밀번호를 확인해주세요.')</script>");
	}
	
	String userId = CookieManager.readCookie(request, "userId");
	
	// 쿠키에 저장된 아이디 보여주기
	// 쿠키에 저장된 아이디가 있다면 id필드의 value속성에 아이디 값을 넣어줍니다.
	
	/*
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		
		for(Cookie cookie : cookies){
			if("userId".equals(cookie.getName())){
				userId = cookie.getValue();
				out.print("userId : " + userId);
				break;
			}
		}
	}
	*/
	String name = request.getParameter("name");
	
	if(name != null && !name.equals("")){
		out.print("<h1>" + name + "님 반갑습니다 </h1>");
	} else{	
%>

<form action="./loginAction.jsp" method="post">
			
                    <div class='loginbox'>
                        <div id='login'>
                            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required = "required" value="<%=userId%>"><br>
                            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required = "required"><br>
                            <input type="checkbox" name="save_check" value="Y" <%= !("").equals(userId)? "checked" : "" %>> 아이디 저장하기 <br>
                        </div>
                        <div id='button'>
                        <input type="submit" value="로그인">
                        </div>
                    </div>
                    <div id='info'>

                        <a href="">회원가입</a>
                        <a href="">ID찾기</a>
                        <a href="">PW찾기</a>
                    </div>
        </form>
  <%
	}
  %>
</body>
</html>