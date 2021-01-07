<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int no = (int)request.getAttribute("guestbook_no");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		
		<%-- post 방식으로는 전송이 안됨--%>
		<form action="/guestbook2/gbc" method="get">
			비밀번호 <input type="text" name="password">
			no: <input type="text" name="no" value=<%=no%>>
			action: <input type="text" name="action" value="delete">
			<button type="submit">확인</button><br>
			
			<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
		</form>
	</body>
</html>