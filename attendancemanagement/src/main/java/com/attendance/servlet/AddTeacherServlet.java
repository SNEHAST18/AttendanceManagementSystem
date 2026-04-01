package com.attendance.servlet;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.TeacherDAO;
import com.attendance.model.Teacher;
import com.attendance.util.DBconnection;

@WebServlet("/addTeacher")
public class AddTeacherServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String subject = request.getParameter("subject");

        Teacher t = new Teacher();
        t.setName(name);
        t.setEmail(email);
        t.setPassword(password);
        t.setSubject(subject);

        // ✅ CORRECT FIX HERE
        Connection conn = DBconnection.getConnection();
        TeacherDAO dao = new TeacherDAO(conn);

        boolean status = dao.addTeacher(t);

        if (status) {
            response.sendRedirect(request.getContextPath() + "/admin/view_faculty.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/add_faculty.jsp?error=1");
        }
    }
}