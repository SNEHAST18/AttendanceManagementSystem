package com.attendance.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.TeacherDAO;
import com.attendance.model.Teacher;
import com.attendance.util.DBconnection;

@WebServlet("/viewTeacher")
public class ViewTeacherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection conn = DBconnection.getConnection();
            TeacherDAO dao = new TeacherDAO(conn);
            List<Teacher> list = dao.getAllTeachers();

            request.setAttribute("teacherList", list);
            RequestDispatcher rd = request.getRequestDispatcher("/admin/view_faculty.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}