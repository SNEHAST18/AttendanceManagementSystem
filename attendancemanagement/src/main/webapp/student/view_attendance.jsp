<%@ page import="java.sql.*" %>
<%@ page import="com.attendance.util.DBconnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String studentEmail = (String) session.getAttribute("studentUser");
    if (studentEmail == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Attendance</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/student.css">
<style>
/* GLASS CARD FOR TABLE */
.glass-card.wide {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 90%;
    max-width: 1000px;
    padding: 30px;
    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    color: #fff;
    z-index: 2;
    box-shadow: 0 8px 32px rgba(0,0,0,0.35);
}

.glass-card.wide h2 {
    text-align: center;
    margin-bottom: 15px;
}

.glass-card .subtitle {
    text-align: center;
    margin-bottom: 25px;
    font-size: 18px;
}

/* TABLE STYLING */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    font-size: 16px;
}

th, td {
    padding: 12px 10px;
    text-align: center;
}

th {
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    color: #fff;
    font-weight: bold;
    border-radius: 6px;
}

tr {
    background: rgba(255,255,255,0.05);
    transition: 0.3s;
}

tr:hover {
    background: rgba(0,198,255,0.2);
}

/* Present / Absent colors */
.present {
    color: #00ff7f;
    font-weight: bold;
}
.absent {
    color: #ff4b2b;
    font-weight: bold;
}

/* BACK BUTTON */
.btn.back {
    display: inline-block;
    padding: 12px 25px;
    border-radius: 12px;
    background: linear-gradient(135deg, #ff416c, #ff4b2b);
    color: #fff;
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    transition: 0.3s;
}

.btn.back:hover {
    transform: translateY(-3px);
}
</style>
</head>
<body>

<div class="bg-image"></div>
<canvas id="bubbleCanvas"></canvas>

<div class="glass-card wide">
    <h2>📘 My Attendance</h2>
    <p class="subtitle">Student: <%= studentEmail %></p>

    <table>
        <tr>
            <th>ID</th>
            <th>Student ID</th>
            <th>Teacher ID</th>
            <th>Subject</th>
            <th>Date</th>
            <th>Status</th>
        </tr>

<%
    try {
        Connection con = DBconnection.getConnection();
        String sql =
            "SELECT a.id, a.student_id, a.teacher_id, a.subject, a.date, a.status " +
            "FROM attendance a JOIN student s ON a.student_id = s.id WHERE s.email = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, studentEmail);
        ResultSet rs = ps.executeQuery();

        boolean found = false;
        while (rs.next()) {
            found = true;
%>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("student_id") %></td>
            <td><%= rs.getInt("teacher_id") %></td>
            <td><%= rs.getString("subject") %></td>
            <td><%= rs.getDate("date") %></td>
            <td class="<%= rs.getString("status").equalsIgnoreCase("Present") ? "present" : "absent" %>">
                <%= rs.getString("status") %>
            </td>
        </tr>
<%
        }
        if (!found) {
%>
        <tr>
            <td colspan="6">No attendance records found.</td>
        </tr>
<%
        }
    } catch (Exception e) {
%>
        <tr>
            <td colspan="6">Error loading attendance</td>
        </tr>
<%
    }
%>
    </table>

    <a href="<%=request.getContextPath()%>/student/student_dashboard.jsp" class="btn back">
        ⬅ Back to Dashboard
    </a>
</div>

<script src="<%=request.getContextPath()%>/js/bubbles.js"></script>
</body>
</html>