<%@ page import="java.util.*, com.attendance.dao.AttendanceDAO, com.attendance.model.Attendance" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.attendance.util.DBconnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Attendance</title>
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        /* Status coloring */
        .status-present {
            color: #00ff00;  /* Bright green */
            font-weight: bold;
        }
        .status-absent {
            color: #ff4b4b;  /* Bright red */
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- ===== Bubble Background ===== -->
<canvas id="bubbleCanvas"></canvas>

<!-- ===== Sidebar ===== -->
<div class="admin-sidebar">
    <h2>ADMIN</h2>
    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="add_student.jsp">Add Student</a>
    <a href="view_students.jsp">View Students</a>
    <a href="add_faculty.jsp">Add Faculty</a>
    <a href="view_faculty.jsp">View Faculty</a>
    <a href="view_attendance.jsp" class="active">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<%
    AttendanceDAO dao = new AttendanceDAO();
    List<Attendance> list = dao.getAllAttendance();
%>

<!-- ===== Main Content ===== -->
<div class="admin-content">

    <div class="page-title">📊 Attendance List</div>

    <div class="glass-card table-card">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Attendance ID</th>
                    <th>Student Name</th>
                    <th>Student ID</th>
                    <th>Teacher Name</th>
                    <th>Teacher ID</th>
                    <th>Subject</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <% for (Attendance a : list) { %>
                <tr>
                    <td><%= a.getId() %></td>
                    <td><%= a.getStudentName() %></td>
                    <td><%= a.getStudentId() %></td>
                    <td><%= a.getTeacherName() %></td>
                    <td><%= a.getTeacherId() %></td>
                    <td><%= a.getSubject() %></td>
                    <td><%= a.getDate() %></td>
                    <td class="<%= a.getStatus().equalsIgnoreCase("Present") ? "status-present" : "status-absent" %>">
                        <%= a.getStatus() %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</div>

<!-- ===== Bubble Animation Script ===== -->
<script>
const canvas = document.getElementById('bubbleCanvas');
const ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let bubbles = [];
for (let i = 0; i < 70; i++) {
    bubbles.push({
        x: Math.random() * canvas.width,
        y: Math.random() * canvas.height,
        r: Math.random() * 6 + 2,
        dx: (Math.random() - 0.5) * 0.8,
        dy: -Math.random() * 1.2,
        c: 'rgba(0,180,255,0.35)'
    });
}

function animate() {
    ctx.clearRect(0,0,canvas.width,canvas.height);
    bubbles.forEach(b => {
        ctx.beginPath();
        ctx.arc(b.x,b.y,b.r,0,Math.PI * 2);
        ctx.fillStyle = b.c;
        ctx.fill();
        b.x += b.dx;
        b.y += b.dy;
        if (b.y < 0) b.y = canvas.height;
    });
    requestAnimationFrame(animate);
}
animate();

window.onresize = () => {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
};
</script>

</body>
</html>