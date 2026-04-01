<%@ page import="java.util.*" %>
<%@ page import="com.attendance.dao.AttendanceDAO" %>
<%@ page import="com.attendance.model.Attendance" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	// ✅ SESSION CHECK
	String studentId = (String) session.getAttribute("user");

	if (studentId == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
		return;
	}

	List<Attendance> list = (List<Attendance>) request.getAttribute("attendanceList");
%>

<html>
<head>
	<title>My Attendance</title>
</head>
<body>

<h2>My Attendance Report</h2>

<table border="1">
	<tr>
		<th>ID</th>
		<th>Student ID</th>
		<th>Teacher ID</th>
		<th>Subject</th>
		<th>Date</th>
		<th>Status</th>
	</tr>

	<%
		if (list != null) {
			for (Attendance a : list) {
	%>
	<tr>
		<td><%= a.getId() %></td>
		<td><%= a.getStudentId() %></td>
		<td><%= a.getTeacherId() %></td>
		<td><%= a.getSubject() %></td>
		<td><%= a.getDate() %></td>
		<td><%= a.getStatus() %></td>
	</tr>
	<%
			}
		}
	%>
</table>

</body>
</html>