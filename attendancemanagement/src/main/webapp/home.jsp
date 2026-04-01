<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management System</title>
    <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/theme.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #060b1a;
        }

        .doodle-bg {
            position: fixed;
            inset: 0;
            z-index: -1;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='120' height='120'%3E%3Ctext x='10' y='30' fill='rgba(255,255,255,0.05)' font-size='20'%3E✔%3C/text%3E%3Ctext x='60' y='80' fill='rgba(255,255,255,0.04)' font-size='18'%3E📚%3C/text%3E%3Ctext x='30' y='100' fill='rgba(255,255,255,0.04)' font-size='16'%3E🕒%3C/text%3E%3C/svg%3E");
            background-repeat: repeat;
        }
    </style>
</head>
<body>





<!-- Your existing content stays below -->



    <!-- Doodle Background -->
    <div class="doodle-bg"></div>
<!-- NAVBAR -->
<nav class="navbar">
    <div class="logo">
        <span class="logo-icon">📊</span> AMS
    </div>
    <div class="nav-links">
        <a href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#features">Features</a>
        <a href="#contact">Contact</a>
        <a href="login.jsp" class="login-btn">Login</a>
    </div>
</nav>

<!-- HERO -->
<section id="home" class="hero">
    <div class="hero-card">
        <h1>Attendance Management System</h1>
        <p>Smart • Secure • Digital Attendance Solution</p>
        <a href="login.jsp" class="hero-btn">Get Started</a>
    </div>
</section>

<!-- ABOUT -->
<section id="about" class="about">
    <h2>About AMS</h2>
    <p>
        Attendance Management System is a digital platform designed to simplify 
        attendance tracking for Admins, Teachers and Students.
        It ensures accuracy, security and time efficiency.
    </p>
</section>

<!-- FEATURES -->
<section id="features" class="features">
    <div class="feature-card">
        <h3>Easy Tracking</h3>
        <p>Digitally manage attendance with accuracy.</p>
    </div>

    <div class="feature-card">
        <h3>Teacher Friendly</h3>
        <p>Quick attendance marking & viewing.</p>
    </div>

    <div class="feature-card">
        <h3>Secure System</h3>
        <p>Separate roles for Admin, Teacher & Student.</p>
    </div>
</section>

<!-- CONTACT -->
<section id="contact" class="contact">
    <h2>Contact Us</h2>
    <p>Email: support@attendance.com</p>
    <p>Phone: +91 98765 43210</p>
</section>

<footer>
    © 2025 Attendance Management System
</footer>

</body>
</html>