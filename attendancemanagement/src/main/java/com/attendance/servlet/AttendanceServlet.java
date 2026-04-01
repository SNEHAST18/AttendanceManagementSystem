package com.attendance.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.attendance.dao.AttendanceDAO;
import com.attendance.model.Attendance;

@WebServlet("/addAttendance")
public class AttendanceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("=== DEBUG: Attendance submission START ===");
    	System.out.println("studentId = " + request.getParameter("studentId"));
    	System.out.println("teacherId = " + request.getParameter("teacherId"));
    	System.out.println("subject = " + request.getParameter("subject"));
    	System.out.println("date = " + request.getParameter("date"));
    	System.out.println("status = " + request.getParameter("status"));

        String studentId = request.getParameter("studentId");
        HttpSession session = request.getSession();
        String teacherId = (String) session.getAttribute("teacherId");
        String subject = request.getParameter("subject");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Attendance a = new Attendance();
        a.setStudentId(studentId);
        a.setTeacherId(teacherId);
        a.setSubject(subject);
        a.setDate(date);
        a.setStatus(status);

        AttendanceDAO dao = new AttendanceDAO();
        boolean done = dao.addAttendance(a);

        if (done) {
            // Redirect to a page that actually exists for teacher
            response.sendRedirect(request.getContextPath() + "/teacher/teacher_dashboard.jsp");
        } else {
            // Return to the attendance form (include context path)
            response.sendRedirect(request.getContextPath() + "/teacher/teacher_attendance.jsp?error=1");
        }
    }
}