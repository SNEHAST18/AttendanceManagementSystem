<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>

    <!-- SAME CSS AS ADD FACULTY -->
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<!-- ===== Bubble Background ===== -->
<canvas id="bubbleCanvas"></canvas>

<!-- ===== Sidebar ===== -->
<div class="admin-sidebar">
    <h2>ADMIN</h2>
    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="add_student.jsp" class="active">Add Student</a>
    <a href="view_students.jsp">View Students</a>
    <a href="add_faculty.jsp">Add Faculty</a>
    <a href="view_faculty.jsp">View Faculty</a>
    <a href="view_attendance.jsp">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<!-- ===== Main Content ===== -->
<div class="admin-content center-content">

    <!-- ✅ PAGE TITLE (OUTSIDE CARD – NO OVERLAP) -->
    <div class="page-title">➕ Add Student</div>

    <!-- ✅ CENTER CARD -->
    <div class="glass-card">

        <form action="<%=request.getContextPath()%>/addStudent" method="post">

            <input type="text" name="rollno" placeholder="Roll Number" required>
            <input type="text" name="name" placeholder="Student Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="branch" placeholder="Branch" required>
            <input type="text" name="semester" placeholder="Semester" required>

            <button type="submit">Add Student</button>
        </form>

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