<%@ page import="java.util.*, com.attendance.dao.AttendanceDAO, com.attendance.model.Attendance" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String teacherEmail = (String) session.getAttribute("teacherUser");
    if (teacherEmail == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher - View Attendance</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <style>
        /* Status colors */
        .present {
            color: #00ff7f; /* Green */
            font-weight: bold;
        }
        .absent {
            color: #ff4b2b; /* Red */
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- ===== Bubble Background ===== -->
<canvas id="bubbleCanvas"></canvas>

<!-- ===== Main Content ===== -->
<div class="admin-content">
    <div class="page-title">📊 My Attendance Records</div>

    <div class="glass-card table-card">
        <table>
            <thead>
                <tr>
                    <th>Attendance ID</th>
                    <th>Student Name</th>
                    <th>Student ID</th>
                    <th>Subject</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    AttendanceDAO dao = new AttendanceDAO();
                    List<Attendance> list = dao.getAttendanceByTeacher(teacherEmail);

                    if (list.isEmpty()) {
                %>
                        <tr>
                            <td colspan="6">No attendance records found!</td>
                        </tr>
                <%
                    } else {
                        for (Attendance a : list) {
                %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><%= a.getStudentName() %></td>
                        <td><%= a.getStudentId() %></td>
                        <td><%= a.getSubject() %></td>
                        <td><%= a.getDate() %></td>
                        <td class="<%= a.getStatus().equalsIgnoreCase("Present") ? "present" : "absent" %>">
                            <%= a.getStatus() %>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
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
        ctx.arc(b.x, b.y, b.r, 0, Math.PI * 2);
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