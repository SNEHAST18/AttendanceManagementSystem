<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String teacherName = (String) session.getAttribute("teacherUser");
    String teacherId = (String) session.getAttribute("teacherId");
    if (teacherName == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<style>
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: "Segoe UI", sans-serif;
    overflow-x: hidden;
}

/* ===== Background Image ===== */
.bg-image {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background:
        linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)),
        url('${pageContext.request.contextPath}/images/teacher-bg.jpeg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    z-index: 0;
}

/* ===== Bubble Canvas ===== */
#bubbleCanvas {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
}

/* ===== Center Glass Box ===== */
.center-box {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 430px;
    padding: 35px;
    background: rgba(255,255,255,0.15);
    border-radius: 20px;
    backdrop-filter: blur(16px);
    -webkit-backdrop-filter: blur(16px);
    text-align: center;
    z-index: 2;
    box-shadow: 0 10px 35px rgba(0,0,0,0.4);
}

.center-box h2 {
    color: #fff;
    margin-bottom: 25px;
}

/* ===== Buttons ===== */
.center-box .btn {
    display: block;
    width: 100%;
    padding: 13px;
    margin: 10px 0;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    color: #fff;
    text-decoration: none;
    border-radius: 12px;
    font-weight: bold;
    transition: 0.3s;
}

.center-box .btn:hover {
    transform: translateY(-3px);
    background: linear-gradient(135deg, #0072ff, #00c6ff);
}

/* ===== Mobile ===== */
@media (max-width: 500px) {
    .center-box {
        width: 90%;
        padding: 25px;
    }
}
</style>
</head>

<body>

<div class="bg-image"></div>
<canvas id="bubbleCanvas"></canvas>

<div class="center-box">
    <h2>Welcome, <%= teacherName %> 👋</h2>

    <a href="teacher_attendance.jsp" class="btn">Mark Attendance</a>
    <a href="view_attendance.jsp" class="btn">View Attendance</a>
    <a href="add_teacher.jsp" class="btn">Add Teacher</a>

    <a href="${pageContext.request.contextPath}/teacher/viewTeachers" class="btn">
        View Teacher
    </a>

    <a href="<%=request.getContextPath()%>/logout.jsp" class="btn logout">
    🚪 Logout
</a>
</div>

<script>
const canvas = document.getElementById("bubbleCanvas");
const ctx = canvas.getContext("2d");

function resize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
}
resize();

let bubbles = [];
for (let i = 0; i < 70; i++) {
    bubbles.push({
        x: Math.random() * canvas.width,
        y: Math.random() * canvas.height,
        r: Math.random() * 6 + 2,
        dx: (Math.random() - 0.5) * 0.8,
        dy: -Math.random() * 1.2,
        c: "rgba(0,180,255,0.35)"
    });
}

function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
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

window.addEventListener("resize", resize);
</script>

</body>
</html>