package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.attendance.dao.StudentDAO;
import com.attendance.model.Student;

@WebServlet("/editStudent")
public class EditStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ 1. OPEN EDIT PAGE
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        StudentDAO dao = new StudentDAO();
        Student s = dao.getStudentById(id);

        request.setAttribute("student", s);

        RequestDispatcher rd = request.getRequestDispatcher("/admin/edit_student.jsp");
        rd.forward(request, response);
    }

    // ✅ 2. UPDATE STUDENT
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String rollno = request.getParameter("rollno");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");

        Student s = new Student(id, rollno, name, email, password, branch, semester);

        StudentDAO dao = new StudentDAO();
        boolean status = dao.updateStudent(s);

        if (status) {
            response.sendRedirect(request.getContextPath() + "/admin/view_students.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/edit_student.jsp?error=1");
        }
    }
}