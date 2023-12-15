<%@page import="JS.JSFunction"%>
<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String UserID = (String) session.getAttribute("UserID");
String Title = (String) session.getAttribute("Title");
String Date = (String) session.getAttribute("Date");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.DeleteWrite(Date, UserID, Title);
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>일기 삭제</title>
</head>
<%
if (dto.getUpdate() != null) {
%>
<body>
	<h1>일기가 삭제되었습니다.</h1>
	<a href="List.jsp">일기 목록으로 돌아가기</a>
</body>
<%
}else {
	JSFunction.alertBack("다시 시도해주세요", out);
}
%>
</html>