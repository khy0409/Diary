<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새로운 일기 작성</title>
    <link rel="stylesheet" href="../CSS/Write.css">
</head>
<body>

    <h2 class="H2">새로운 일기 작성</h2>
    <hr class="Hr">
    <form action="WriteProcess.jsp" method="post">
        <input type="text" name="Title" required class="Title" placeholder="제목을 입력해주세요."><br>
        <textarea name="Content"   required class="Content" placeholder="내용을 입력해주세요."></textarea><br>
        <input type="submit" value="작성 완료" class="Submit">
    </form>
    <a href="Calender.jsp" class="ListB">캘린더 가기</a>
    <a href="List.jsp" class="ListA">일기 목록 가기</a>
    <footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
