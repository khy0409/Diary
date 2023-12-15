<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
request.setCharacterEncoding("UTF-8");
String UserID = (String)session.getAttribute("UserID");
String Date = (String)session.getAttribute("Date");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(UserID, Date);
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=dto.getTitle()%></title>
        <link rel="stylesheet" href="../CSS/View.css">
</head>
<body>
    <h2 class="H2"><%=dto.getTitle()%></h2>
    <hr class="Hr">
    <p class="Content"><%=dto.getContent()%></p>
    <a href="Edit.jsp?Title=<%=dto.getTitle()%>" class="Edit">수정</a>
    <a href="Delete.jsp?Title=<%=dto.getTitle()%>" class="Delete">삭제</a>
    <a href="List.jsp" class="Home">일기 목록 가기</a>
    <footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
