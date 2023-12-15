<%@page import="JS.JSFunction"%>
<%@page import="Member.MemberDTO"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String LoginID = request.getParameter("LoginID");
String LoginPass = request.getParameter("LoginPass");

MemberDAO dao = new MemberDAO(application);
MemberDTO dto = dao.SelectUser(LoginID, LoginPass);
dao.close();

if(dto.getUserID() != null) {
	session.setAttribute("UserID", dto.getUserID());
	session.setAttribute("UserPass", dto.getUserPass());
	response.sendRedirect("Calender.jsp");
}else{
	JSFunction.alertBack("아이디, 패스워드를 확인해주세요", out);
}

%>