package com.attendance.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.attendance.dao.StudentDAO;
import com.attendance.model.Student;

@WebServlet("/viewStudents")
public class StudentListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();
        List<Student> list = dao.getAllStudents();

        request.setAttribute("studentList", list);
        request.getRequestDispatcher("admin/view_students.jsp").forward(request, response);
    }
}