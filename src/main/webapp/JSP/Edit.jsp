<%@page import="Board.BoardDAO"%>
<%@page import="Board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%
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
    <title>일기 수정</title>
    <link rel="stylesheet" href="../CSS/Edit.css">
</head>
<body>
    <h2 class="H2">일기 수정</h2>
    <hr class="Hr">
    <form action="EditProcess.jsp" method="post">
        <input type="hidden" name="UserID" value="<%=UserID%>">
        <input type="text" name="TitleInput" value="<%=dto.getTitle()%>" required class="Title"><br>
        <textarea name="ContentInput" required class="Content"><%=dto.getContent()%></textarea><br>
        <input type="submit" value="수정 완료" class="Submit">
    </form>
    <a href="View.jsp?Title=<%=dto.getTitle()%>" class="ListA">취소</a>
    <footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
