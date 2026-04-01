<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.attendance.model.Student" %>

<%
    Student s = (Student) request.getAttribute("student");
    if (s == null) {
        out.println("Student data not found!");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>

<body>

<!-- ✅ BACKGROUND ANIMATION -->
<div class="animated-bg"></div>

<!-- ✅ CENTER CONTENT -->
<div class="center-content">
    <div class="glass-card form-container">

        <h2 class="form-title">✏ Edit Student</h2>

        <form action="${pageContext.request.contextPath}/editStudent" method="post">

            <input type="hidden" name="id" value="<%= s.getId() %>">

            <input type="text" name="rollno" value="<%= s.getRollno() %>" readonly>

            <input type="text" name="name" value="<%= s.getName() %>" required>

            <input type="email" name="email" value="<%= s.getEmail() %>" required>

            <input type="password" name="password" value="<%= s.getPassword() %>" required>

            <input type="text" name="branch" value="<%= s.getBranch() %>" required>

            <input type="text" name="semester" value="<%= s.getSemester() %>" required>

            <button type="submit">Update Student</button>

        </form>

    </div>
</div>

</body>
</html>