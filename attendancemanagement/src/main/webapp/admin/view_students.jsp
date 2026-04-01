<%@ page import="java.util.*, com.attendance.model.Student, com.attendance.dao.StudentDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<canvas id="bubbleCanvas"></canvas>

<div class="admin-sidebar">
    <h2>ADMIN</h2>
    <a href="admin_dashboard.jsp">Dashboard</a>
    <a href="add_student.jsp">Add Student</a>
    <a href="view_students.jsp" class="active">View Students</a>
    <a href="add_faculty.jsp">Add Faculty</a>
    <a href="view_faculty.jsp">View Faculty</a>
    <a href="view_attendance.jsp">View Attendance</a>
    <a href="../logout.jsp" class="logout-btn">Logout</a>
</div>

<%
    StudentDAO dao = new StudentDAO();
    List<Student> list = dao.getAllStudents();
%>

<div class="admin-content">
    <div class="page-title">👨‍🎓 All Students</div>

    <div class="glass-card table-card">
        <table class="styled-table">
            <tr>
                <th>ID</th><th>Roll</th><th>Name</th><th>Email</th>
                <th>Password</th><th>Branch</th><th>Sem</th><th>Action</th>
            </tr>

            <% for(Student s : list){ %>
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getRollno()%></td>
                <td><%=s.getName()%></td>
                <td><%=s.getEmail()%></td>
                <td><%=s.getPassword()%></td>
                <td><%=s.getBranch()%></td>
                <td><%=s.getSemester()%></td>
                <td>
                    <a class="edit-btn" href="${pageContext.request.contextPath}/editStudent?id=<%=s.getId()%>">Edit</a>
                    <a class="delete-btn" href="${pageContext.request.contextPath}/deleteStudent?id=<%=s.getId()%>">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</div>

<script src="../js/bubbles.js"></script>
</body>
</html>