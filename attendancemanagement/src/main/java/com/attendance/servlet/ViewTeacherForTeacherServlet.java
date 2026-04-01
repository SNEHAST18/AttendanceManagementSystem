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

@WebServlet("/teacher/viewTeachers")
public class ViewTeacherForTeacherServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // ✅ 1. Get DB connection
            Connection conn = DBconnection.getConnection();

            // ✅ 2. PASS connection to DAO (IMPORTANT)
            TeacherDAO dao = new TeacherDAO(conn);

            // ✅ 3. Fetch teachers
            List<Teacher> list = dao.getAllTeachers();

            // ✅ 4. Send list to JSP
            request.setAttribute("teacherList", list);

            // ✅ 5. Forward to teacher JSP (NOT admin)
            RequestDispatcher rd =
                    request.getRequestDispatcher("/teacher/view_teacher.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}