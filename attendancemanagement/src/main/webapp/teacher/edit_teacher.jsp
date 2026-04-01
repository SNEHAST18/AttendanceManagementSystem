<%@ page import="com.attendance.model.Teacher" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    Teacher t = (Teacher) request.getAttribute("teacher");
    if (t == null) {
        response.sendRedirect(request.getContextPath() + "/viewTeacher");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Teacher</title>
<style>
body {
    background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    font-family: "Segoe UI", sans-serif;
    color: white;
}
.form-box {
    width: 420px;
    margin: 80px auto;
    background: rgba(255,255,255,0.15);
    padding: 30px;
    border-radius: 18px;
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: none;
}
button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg,#00c6ff,#0072ff);
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
}
</style>
</head>

<body>

<div class="form-box">
<h2>Edit Teacher</h2>

<form action="<%= request.getContextPath() %>/UpdateTeacherServlet" method="post">
    <input type="hidden" name="id" value="<%= t.getId() %>">

    <input type="text" name="name" value="<%= t.getName() %>" required>
    <input type="email" name="email" value="<%= t.getEmail() %>" required>
    <input type="text" name="password" value="<%= t.getPassword() %>" required>
    <input type="text" name="subject" value="<%= t.getSubject() %>" required>

    <button type="submit">Update Teacher</button>
</form>
</div>

</body>
</html>