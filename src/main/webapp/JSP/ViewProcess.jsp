<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Board.BoardDTO"%>
<%@page import="Board.BoardDAO"%>
<%@page import="JS.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String Year = "23";
String Month = request.getParameter("Month");
String Day = request.getParameter("Day");
String UserID = (String)session.getAttribute("UserID");

SimpleDateFormat dateFormat = new SimpleDateFormat("yy/mm/dd");

String Date = Year + "/" + Month + "/" + Day;
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.SelectDay(Date, UserID);
dao.close();

session.setAttribute("Date", Date);

if(dto.getUserID() != null) {
	session.setAttribute("UserID", dto.getUserID());
	session.setAttribute("PostDate", dto.getDate());
	session.setAttribute("Title", dto.getTitle());
	session.setAttribute("Content", dto.getContent());
	response.sendRedirect("View.jsp");
}else{
	response.sendRedirect("Write.jsp");
}
%>