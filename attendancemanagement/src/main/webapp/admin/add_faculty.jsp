<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Faculty</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<canvas id="bubbleCanvas"></canvas>

<div class="admin-sidebar">
    <h2>ADMIN</h2>
    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="add_student.jsp">Add Student</a>
    <a href="view_students.jsp">View Students</a>
    <a href="add_faculty.jsp" class="active">Add Faculty</a>
    <a href="view_faculty.jsp">View Faculty</a>
    <a href="view_attendance.jsp">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<div class="admin-content">
    <div class="page-title">➕ Add Faculty</div>

    <div class="glass-card">
        <form action="<%=request.getContextPath()%>/addTeacher" method="post">
            <input type="text" name="name" placeholder="Faculty Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="subject" placeholder="Subject" required>
            <button type="submit">Add Teacher</button>
        </form>
    </div>
</div>

<script src="../js/bubbles.js"></script>
</body>
</html>