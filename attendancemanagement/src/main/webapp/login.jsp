<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
</head>

<body>
<!-- HOME BUTTON -->
<div style="position: absolute; top: 20px; right: 20px; z-index: 10;">
    <a href="<%=request.getContextPath()%>/home.jsp" 
       style="display:flex; align-items:center; background:#0072ff; color:#fff; 
              padding:8px 12px; border-radius:8px; text-decoration:none; font-weight:bold;
              transition: 0.3s;">
        🏠 Home
    </a>
</div>

<div class="particles">
    <span style="left:5%;  animation-duration:18s;"></span>
    <span style="left:10%; animation-duration:22s;"></span>
    <span style="left:15%; animation-duration:20s;"></span>
    <span style="left:20%; animation-duration:25s;"></span>
    <span style="left:25%; animation-duration:19s;"></span>
    <span style="left:30%; animation-duration:24s;"></span>
    <span style="left:35%; animation-duration:21s;"></span>
    <span style="left:40%; animation-duration:26s;"></span>
    <span style="left:45%; animation-duration:23s;"></span>
    <span style="left:50%; animation-duration:18s;"></span>
    <span style="left:55%; animation-duration:27s;"></span>
    <span style="left:60%; animation-duration:20s;"></span>
    <span style="left:65%; animation-duration:24s;"></span>
    <span style="left:70%; animation-duration:22s;"></span>
    <span style="left:75%; animation-duration:28s;"></span>
    <span style="left:80%; animation-duration:19s;"></span>
    <span style="left:85%; animation-duration:25s;"></span>
    <span style="left:90%; animation-duration:21s;"></span>
    <span style="left:95%; animation-duration:26s;"></span>
</div>

<div class="center">
    <div class="box">
        <h2>Attendance Login</h2>

        <form action="<%=request.getContextPath()%>/login" method="post">

            <input type="text" name="username" placeholder="Username / Email" required>

            <input type="password" name="password" placeholder="Password" required>

            <input type="submit" value="Login">

        </form>
    </div>
</div>

</body>
</html>