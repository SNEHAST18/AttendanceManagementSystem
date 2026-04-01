<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String admin = (String) session.getAttribute("adminUser");
if (admin == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        /* FULL SCREEN BACKGROUND IMAGE WITH BLACK OVERLAY */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: "Segoe UI", sans-serif;
            overflow: hidden;
        }

        .bg-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("../images/admin-bg.jpeg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            z-index: 0;
        }

        /* BLACK OVERLAY */
        .bg-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.65);
            z-index: 1;
        }

        /* BUBBLE CANVAS */
        #bubbleCanvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 2;
        }

        /* CENTERED GLASS CONTROL PANEL */
        .center-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 450px;
            padding: 35px;
            background: rgba(0,0,0,0.35);
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.35);
            text-align: center;
            z-index: 3;
            color: #fff;
        }

        .center-box h2 {
            margin-bottom: 25px;
            font-size: 28px;
        }

        .center-box a {
            display: block;
            width: 100%;
            padding: 14px 0;
            margin: 10px 0;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: #fff;
            text-decoration: none;
            border-radius: 12px;
            font-weight: bold;
            transition: 0.3s;
        }

        .center-box a:hover {
            transform: translateY(-3px);
            background: linear-gradient(135deg, #0072ff, #00c6ff);
        }

        .logout-btn {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
        }

        @media (max-width: 768px) {
            .center-box {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>
<body>

<!-- BACKGROUND IMAGE -->
<div class="bg-image"></div>

<!-- BLACK OVERLAY -->
<div class="bg-overlay"></div>

<!-- BUBBLE CANVAS -->
<canvas id="bubbleCanvas"></canvas>

<!-- CENTERED CONTROL PANEL -->
<div class="center-box">
    <h2>Welcome Admin 👋</h2>

    <a href="add_student.jsp">Add Student</a>
    <a href="add_faculty.jsp">Add Faculty</a>
    <a href="view_students.jsp">View Students</a>
    <a href="view_faculty.jsp">View Faculty</a>
    <a href="view_attendance.jsp">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<!-- BUBBLE SCRIPT -->
<script>
const canvas = document.getElementById('bubbleCanvas');
const ctx = canvas.getContext('2d');
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let bubbles = [];
for(let i=0;i<70;i++){
    bubbles.push({
        x: Math.random()*canvas.width,
        y: Math.random()*canvas.height,
        r: Math.random()*6+2,
        dx: (Math.random()-0.5)*0.8,
        dy: -Math.random()*1.2,
        c: 'rgba(0,180,255,0.35)'
    });
}

function animate(){
    ctx.clearRect(0,0,canvas.width,canvas.height);
    bubbles.forEach(b=>{
        ctx.beginPath();
        ctx.arc(b.x,b.y,b.r,0,Math.PI*2);
        ctx.fillStyle = b.c;
        ctx.fill();
        b.x += b.dx;
        b.y += b.dy;
        if(b.y < 0) b.y = canvas.height;
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