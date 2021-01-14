<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<c:if test="${delresult == 0}"> <%-- ${delresult == 0} = ${requestScope.delresult == 0} --%>
			비밀번호를 잘 못 입력하셨습니다. 다시 입력해주세요.
		</c:if>
		
		<form action="/guestbook2/gbc" method="post">
			비밀번호 <input type="text" name="password">
			<%--no:--%> <input type="hidden" name="no" value="${param.no}"> 
			<%-- action:--%> <input type="hidden" name="action" value="delete">
			<button type="submit">확인</button><br>
			
			<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
		</form>
	</body>
</html>