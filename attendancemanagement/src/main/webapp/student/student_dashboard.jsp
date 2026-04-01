<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String student = (String) session.getAttribute("studentUser");
    if (student == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/student.css">
</head>
<body>

<!-- ✅ BACKGROUND IMAGE -->
<div class="bg-image"></div>

<!-- ✅ BUBBLES -->
<canvas id="bubbleCanvas"></canvas>

<!-- ✅ GLASS CARD -->
<div class="center-box">
    <h2>Welcome, <%= student %> 👋</h2>

    <a href="<%=request.getContextPath()%>/student/view_attendance.jsp" class="btn">
        📊 View Attendance
    </a>

    <a href="<%=request.getContextPath()%>/logout.jsp" class="btn logout">
        🚪 Logout
    </a>
</div>

<script src="<%=request.getContextPath()%>/js/bubbles.js"></script>
</body>
</html>