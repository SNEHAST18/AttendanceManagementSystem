package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.StudentDAO;
import com.attendance.model.Student;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ NAMES MATCHING JSP NOW
        String rollno = request.getParameter("rollno");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");
        String semester = request.getParameter("semester");

        Student s = new Student(rollno, name, email, password, branch, semester);

        StudentDAO dao = new StudentDAO();
        boolean status = dao.addStudent(s);

        if (status) {
            response.sendRedirect(request.getContextPath() + "/admin/view_students.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/add_student.jsp");
        }
    }
}