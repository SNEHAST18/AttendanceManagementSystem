package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.dao.TeacherDAO;
import com.attendance.model.Teacher;
import com.attendance.util.DBconnection;

@WebServlet("/editTeacher")
public class EditTeacherServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            TeacherDAO dao = new TeacherDAO(DBconnection.getConnection());
            Teacher teacher = dao.getTeacherById(id);

            if (teacher == null) {
                response.sendRedirect(request.getContextPath() + "/viewTeacher");
                return;
            }

            request.setAttribute("teacher", teacher);
            RequestDispatcher rd =
                    request.getRequestDispatcher("/teacher/edit_teacher.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/viewTeacher");
        }
    }
}