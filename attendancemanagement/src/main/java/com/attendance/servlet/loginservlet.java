package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.attendance.dao.loginDAO;

@WebServlet("/login")
public class loginservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Works as username for admin & email for student/teacher
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        loginDAO dao = new loginDAO();
        String role = dao.validateUser(username, password);

        if (role != null) {
            HttpSession session = request.getSession();

            if (role.equals("teacher")) {
                String teacherId = dao.getTeacherId(username);
                session.setAttribute("teacherId", teacherId);   // store real id
                session.setAttribute("teacherUser", username);  // email (optional)
                response.sendRedirect(request.getContextPath() + "/teacher/teacher_dashboard.jsp");
            }
            else if (role.equals("admin")) {
                session.setAttribute("adminUser", username);
                response.sendRedirect(request.getContextPath() + "/admin/admin_dashboard.jsp");
            } 
            else if (role.equals("student")) {
                session.setAttribute("studentUser", username);
                response.sendRedirect(request.getContextPath() + "/student/student_dashboard.jsp");
            }
        }
        else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=1");
        }
    }
}