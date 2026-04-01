<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.attendance.dao.TeacherDAO" %>
<%@ page import="com.attendance.model.Teacher" %>
<%@ page import="com.attendance.util.DBconnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Faculty</title>
    <link rel="stylesheet" href="../css/admin.css">
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
    <a href="view_faculty.jsp" class="active">View Faculty</a>
    <a href="view_attendance.jsp">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<%
    Connection conn = DBconnection.getConnection();
    TeacherDAO dao = new TeacherDAO(conn);
    List<Teacher> list = dao.getAllTeachers();
%>

<!-- ===== Main Content ===== -->
<div class="admin-content">

    <div class="page-title">👨‍🏫 All Faculty</div>

    <div class="glass-card table-card">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Teacher t : list) { %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td><%= t.getName() %></td>
                    <td><%= t.getEmail() %></td>
                    <td><%= t.getSubject() %></td>
                    <td>
                        <a class="edit-btn" href="<%= request.getContextPath() %>/editTeacher?id=<%= t.getId() %>">Edit</a>
                        <a class="delete-btn" href="<%= request.getContextPath() %>/deleteTeacher?id=<%= t.getId() %>">Delete</a>
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