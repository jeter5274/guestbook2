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
		비밀번호를 잘 못 입력하셨습니다. <br>
		<br>
		<a href="/guestbook2/gbc?action=dform&no=<%= no %>">비밀번호 다시 입력하기</a><br>
		<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
	</body>
</html>