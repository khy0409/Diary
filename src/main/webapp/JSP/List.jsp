<%@page import="Board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Board.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
String userID = (String)session.getAttribute("UserID");
String Date = (String)session.getAttribute("Date");
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> list = dao.list(userID, Date);
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 일기장</title>
 <link rel="stylesheet" href="../CSS/List.css">
</head>
<body>
	<h2 class="H2">일기 목록</h2>
	<hr class="Hr">
	<ol class="Ol">
		<%
		for (int i = 0; i < list.size(); i++) {
		%>
		<li><a href="View.jsp?Title=<%=list.get(i).getTitle()%>"
			class="List"><%=list.get(i).getTitle()%></a> - (<%=list.get(i).getDate()%>)</li> 
	<hr class="Hr2">
		<%
		}
		%>
	</ol>
	<a href="Write.jsp" class="NewWrite">새로운 일기 작성</a>
	<a href="Calender.jsp" class="Home">캘린더 가기</a>
	
	<footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
