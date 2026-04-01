<%@ page import="java.util.*, com.attendance.dao.StudentDAO, com.attendance.model.Student" %>
<%@ page import="com.attendance.util.DBconnection" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Get teacherId from session
    String teacherId = (String) session.getAttribute("teacherId");
    if (teacherId == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <style>
        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
            z-index: 1;
        }

        .glass-card {
            width: 420px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 18px;
            backdrop-filter: blur(15px);
            animation: fadeUp 0.8s ease;
            color: #fff;
        }

        .glass-card h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .glass-card form input, 
        .glass-card form select {
            width: 100%;
            padding: 12px;
            margin-bottom: 14px;
            border-radius: 8px;
            border: none;
            outline: none;
            font-size: 15px;
        }

        .glass-card form button {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .glass-card form button:hover {
            transform: translateY(-2px);
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        #bubbleCanvas {
            position: fixed;
            top: 0;
            left: 0;
            z-index: 0;
        }
    </style>
</head>
<body>

<!-- Bubble Background -->
<canvas id="bubbleCanvas"></canvas>

<div class="center-content">
    <div class="glass-card">
        <h2>📋 Mark Attendance</h2>
        <form action="../addAttendance" method="post">
            <input type="hidden" name="teacherId" value="<%=teacherId%>">

            <label>Student:</label>
            <select name="studentId">
                <%
                    Connection con = DBconnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT id, name FROM student");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                %>
                <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                <% } %>
            </select>

            <label>Subject:</label>
            <input type="text" name="subject" required>

            <label>Date:</label>
            <input type="date" name="date" required>

            <label>Status:</label>
            <select name="status" required>
                <option>Present</option>
                <option>Absent</option>
            </select>

            <button type="submit">Submit Attendance</button>
        </form>
    </div>
</div>

<script>
const canvas = document.getElementById('bubbleCanvas');
const ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let bubbles = [];
for (let i = 0; i < 70; i++) {
    bubbles.push({
        x: Math.random()*canvas.width,
        y: Math.random()*canvas.height,
        r: Math.random()*6+2,
        dx: (Math.random()-0.5)*0.8,
        dy: -Math.random()*1.2,
        c: 'rgba(0,180,255,0.35)'
    });
}

function animate() {
    ctx.clearRect(0,0,canvas.width,canvas.height);
    bubbles.forEach(b => {
        ctx.beginPath();
        ctx.arc(b.x,b.y,b.r,0,Math.PI*2);
        ctx.fillStyle = b.c;
        ctx.fill();
        b.x += b.dx;
        b.y += b.dy;
        if(b.y<0) b.y=canvas.height;
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