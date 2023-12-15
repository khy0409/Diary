<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@page import="JS.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String Title= request.getParameter("Title");
String WirteID = (String)session.getAttribute("UserID");
String Content = request.getParameter("Content");
String Date = (String)session.getAttribute("Date");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.Wirte(WirteID, Content, Date, Title);
dao.close();

if(dto.getContent() != null) {
	session.setAttribute("Title", dto.getTitle());
	session.setAttribute("Content", dto.getContent());
	response.sendRedirect("List.jsp");
}else{
	JSFunction.alertBack("다시 시도해주세요", out);
}
%>