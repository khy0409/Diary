<%@page import="Board.BoardDAO"%>
<%@page import="Board.BoardDTO"%>
<%@page import="JS.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String UserID = (String)session.getAttribute("UserID");
String Title = (String)session.getAttribute("Title");
String upTitle = request.getParameter("TitleInput");
String Content = request.getParameter("ContentInput");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.UpdateWrite(UserID, Title, upTitle,  Content);
dao.close();


if(dto.getTitle() != null) {
	session.setAttribute("Title", dto.getTitle());
	session.setAttribute("Content", dto.getContent());
	session.setAttribute("Update", dto.getUpdate());
	response.sendRedirect("List.jsp");
}else{
	JSFunction.alertBack("수정에 실패했습니다", out);
}

%>