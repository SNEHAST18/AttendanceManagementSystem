package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.attendance.dao.TeacherDAO;
import com.attendance.model.Teacher;
import com.attendance.util.DBconnection;

@WebServlet("/UpdateTeacherServlet")
public class UpdateTeacherServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String subject = request.getParameter("subject");

        Teacher t = new Teacher(id, name, email, password, subject);

        TeacherDAO dao = new TeacherDAO(DBconnection.getConnection());
        dao.updateTeacher(t);

        response.sendRedirect(request.getContextPath() + "/admin/view_faculty.jsp");
    }
}