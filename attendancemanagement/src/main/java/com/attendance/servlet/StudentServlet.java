package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.StudentDAO;
import com.attendance.model.Student;

@WebServlet("/Student")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // read form parameters
    	String id=req.getParameter("id");
        String rollno = req.getParameter("rollno");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String branch = req.getParameter("branch");
        String semester = req.getParameter("semester");

        // create model object
        Student s = new Student(id,rollno, name, email, password, branch, semester);

        // save using DAO
        StudentDAO dao = new StudentDAO();
        boolean saved = dao.addStudent(s);

        if (saved) {
            // success -> show students list (page inside admin)
            resp.sendRedirect(req.getContextPath() + "/admin/view_students.jsp");
        } else {
            // failure -> simple error message (you can improve later)
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("<h3>Error adding student. Try again.</h3>");
            resp.getWriter().println("<a href=\"" + req.getContextPath() + "/admin/add_student.jsp\">Back</a>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // redirect GET to the add-student form
        resp.sendRedirect(req.getContextPath() + "/admin/add_student.jsp");
    }
}