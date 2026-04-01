<%@ page import="java.util.List" %>
<%@ page import="com.attendance.model.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Teachers</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
            color: #fff;
        }

        .container {
            max-width: 1100px;
            margin: 60px auto;
        }

        .card {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            text-align: center;
        }

        th {
            background: linear-gradient(135deg,#00c6ff,#0072ff);
        }

        tr {
            background: rgba(255,255,255,0.08);
        }

        tr:hover {
            background: rgba(0,198,255,0.2);
        }

        .btn {
            padding: 6px 14px;
            border-radius: 6px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .edit { background: #28a745; }
        .delete { background: #dc3545; }

        .add-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: linear-gradient(135deg,#00c6ff,#0072ff);
            border-radius: 12px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="container">
<div class="card">
    <h2>📋 Teacher List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Subject</th>
            <th>Action</th>
        </tr>

        <%
            List<Teacher> list = (List<Teacher>) request.getAttribute("teacherList");
            if (list != null && !list.isEmpty()) {
                for (Teacher t : list) {
        %>
        <tr>
            <td><%= t.getId() %></td>
            <td><%= t.getName() %></td>
            <td><%= t.getEmail() %></td>
            <td><%= t.getPassword() %></td>
            <td><%= t.getSubject() %></td>
            <td>
                <a class="btn edit"
                   href="<%= request.getContextPath() %>/editTeacher?id=<%= t.getId() %>">
                   Edit
                </a>

                <a class="btn delete"
                   href="<%= request.getContextPath() %>/deleteTeacher?id=<%= t.getId() %>"
                   onclick="return confirm('Delete this teacher?');">
                   Delete
                </a>
            </td>
        </tr>
        <% }} else { %>
        <tr>
            <td colspan="6">No teachers found</td>
        </tr>
        <% } %>
    </table>

    <a href="<%= request.getContextPath() %>/teacher/add_teacher.jsp"
       class="add-btn">➕ Add New Teacher</a>
</div>
</div>

</body>
</html>