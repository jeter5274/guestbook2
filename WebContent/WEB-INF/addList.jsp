<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="/guestbook2/gbc" method="post">
			<%-- action:--%> <input type="hidden" name="action" value="add">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=""></td>
					<td>비밀번호</td>
					<td><input type="text" name="password" value=""></td>
				</tr>
				<tr>
					<td colspan="4"> <textarea name="content" value=""> </textarea> </td>
				</tr>
				<tr>
					<td colspan="4"> <button type="submit">확인</button></td>
				</tr>
			</table>
		</form>
		<br>

		<c:forEach items="${GBList}" var="gbl"> 
			<table border="1">
				<tr>
					<td>${gbl.no}</td>
					<td>${gbl.name}</td>
					<td>${gbl.reg_date}</td>
					<td><a href="/guestbook2/gbc?action=dform&no=${gbl.no}">삭제</a></td>
				</tr>
				<tr>
					<td colspan="4"> ${gbl.content} </td>

				</tr>
			</table>
			<br>
		</c:forEach>

	</body>
</html>