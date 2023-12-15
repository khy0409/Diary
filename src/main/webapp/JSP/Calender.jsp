<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Calendar</title>
        <link rel="stylesheet" href="../CSS/Calender.css">
    
</head>
<body>
    <h1>Simple Calendar</h1>
<%
LocalDate currentDate = LocalDate.now();

// 현재 월을 가져옴 (1부터 12까지의 숫자)
int currentMonth = currentDate.getMonthValue();

int selectedMonth = currentMonth;

try {
    String monthParam = request.getParameter("month");

    if (monthParam != null) {
        selectedMonth = Integer.parseInt(monthParam);
        if (selectedMonth < 1 || selectedMonth > 12) {
            selectedMonth = currentMonth; // Set to default if not in the valid range
        }
    }
%>
    <form action="#" method="get">
        <label for="monthSelect">Select a Month: </label>
        <select name="month" id="monthSelect" onchange="this.form.submit()">
            <option value="1"<%= selectedMonth == 1 ? "selected" : "" %>>1월</option>
            <option value="2"<%= selectedMonth == 2 ? "selected" : "" %>>2월</option>
            <option value="3"<%= selectedMonth == 3 ? "selected" : "" %>>3월</option>
            <option value="4"<%= selectedMonth == 4 ? "selected" : "" %>>4월</option>
            <option value="5"<%= selectedMonth == 5 ? "selected" : "" %>>5월</option>
            <option value="6"<%= selectedMonth == 6 ? "selected" : "" %>>6월</option>
            <option value="7"<%= selectedMonth == 7 ? "selected" : "" %>>7월</option>
            <option value="8"<%= selectedMonth == 8 ? "selected" : "" %>>8월</option>
            <option value="9"<%= selectedMonth == 9 ? "selected" : "" %>>9월</option>
            <option value="10"<%= selectedMonth == 10 ? "selected" : "" %>>10월</option>
            <option value="11"<%= selectedMonth == 11 ? "selected" : "" %>>11월</option>
            <option value="12"<%= selectedMonth == 12 ? "selected" : "" %>>12월</option>
        </select>
    </form>

    <table>
        <thead>
            <tr>
                <th>일요일</th>
                <th>월요일</th>
                <th>화요일</th>
                <th>수요일</th>
                <th>목요일</th>
                <th>금요일</th>
                <th>토요일</th>
            </tr>
        </thead>
        <tbody>
            <% 
            

                    int selectedYear = 2023; // Default year
                    java.util.Calendar cal = java.util.Calendar.getInstance();
                    cal.set(java.util.Calendar.YEAR, selectedYear);
                    cal.set(java.util.Calendar.MONTH, selectedMonth - 1);
                    cal.set(java.util.Calendar.DAY_OF_MONTH, 1);

                    int firstDayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK) - 1;
                    int lastDayOfMonth = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

                    int dayCount = 1;
                    int rowCount = (int)Math.ceil((firstDayOfWeek + lastDayOfMonth) / 7.0);

                    for (int i = 0; i < rowCount; i++) {
                        out.println("<tr>");

                        for (int j = 0; j < 7; j++) {
                            out.println("<td>");

                            if (i == 0 && j < firstDayOfWeek) {
                                // Empty cells before the first day of the month
                                out.println("&nbsp;");
                            } else if (dayCount <= lastDayOfMonth) {
                            	%>
                                <a href="ViewProcess.jsp?Month=<%= selectedMonth%>&Day=<%=dayCount%>"> <%= dayCount %></a>
                                <%
                                dayCount++;
                            }

                            out.println("</td>");
                        }

                        out.println("</tr>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<tr><td colspan='7'>Invalid month parameter</td></tr>");
                }
            %>
        </tbody>
    </table>
    <footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
