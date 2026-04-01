package com.attendance.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.TeacherDAO;
import com.attendance.util.DBconnection;

@WebServlet("/deleteTeacher")
public class DeleteTeacherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DBconnection.getConnection();
            TeacherDAO dao = new TeacherDAO(conn);

            dao.deleteTeacher(id);

            response.sendRedirect(request.getContextPath() + "/viewTeacher");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}