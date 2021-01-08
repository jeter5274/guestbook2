<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	int result;
	
	try{
		result = (int)request.getAttribute("delresult");	
	}catch(NullPointerException e){ 
		result = 1;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%if(result==0){%>
			비밀번호를 잘 못 입력하셨습니다. 다시 입력해주세요.
		<%}%>
		
		<form action="/guestbook2/gbc" method="post">
			비밀번호 <input type="text" name="password">
			<%--no:--%> <input type="hidden" name="no" value=<%=no%>>
			<%-- action:--%> <input type="hidden" name="action" value="delete">
			<button type="submit">확인</button><br>
			
			<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
		</form>
	</body>
</html>