<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>

<%@ page import="com.javaex.vo.GBVo"%>

<%
	//리스트를 가져옴 -> 어트리뷰트로 리스트 받아옴
	List<GBVo> gbList = (List<GBVo>)(request.getAttribute("GBList"));
	
	//System.out.println(gbList);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- post 방식으로는 전송이 안됨 / controller가 실행이 안됨, from action의 주소가 문제가 있는 듯함
			 컨트롤러의 메소드 설정을 해야 실행이 됨 --%>
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
		<% for(int i=0; i<gbList.size();i++) { %>
			<table border="1">
				<tr>
					<td><%= gbList.get(i).getNo() %></td>
					<td><%= gbList.get(i).getName() %></td>
					<td><%= gbList.get(i).getReg_date() %></td>
					<td><a href="/guestbook2/gbc?action=dform&no=<%=gbList.get(i).getNo()%>">삭제</a></td>
				</tr>
				<tr>
					<td colspan="4"> <%= gbList.get(i).getContent() %> </td>
				</tr>
			</table>
			<br>
		<%} %>

	</body>
</html>