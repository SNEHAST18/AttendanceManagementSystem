package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.StudentDAO;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        StudentDAO dao = new StudentDAO();
        boolean status = dao.deleteStudent(id);

        if (status) {
            response.sendRedirect("admin/view_students.jsp");
        } else {
            response.getWriter().println("Delete Failed");
        }
    }
}