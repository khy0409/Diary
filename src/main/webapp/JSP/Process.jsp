<%@page import="JS.JSFunction"%>
<%@page import="Member.MemberDTO"%>
<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String JoinID = request.getParameter("JoinID");
String JoinPass = request.getParameter("JoinPass");
String PassCheck = request.getParameter("PassCheck");

if (JoinPass.equals(PassCheck)) {
	JoinPass = PassCheck;
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.InsertUser(JoinID, JoinPass);
	dao.close();

	if(dto.getUserID() != null) {
		session.setAttribute("UserID", dto.getUserID());
		session.setAttribute("UserPass", dto.getUserPass());
		response.sendRedirect("Join.jsp");
	}else{
		JSFunction.alertBack("다른 아이디로 시도해주세요", out);
	}
} else {
	JSFunction.alertBack("비밀번호가 다릅니다", out);
}

%>