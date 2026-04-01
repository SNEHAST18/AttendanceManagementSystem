package com.attendance.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.attendance.dao.AttendanceDAO;
import com.attendance.model.Attendance;

@WebServlet("/studentAttendance")
public class StudentAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ✅ SESSION CHECK
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

		String studentId = (String) session.getAttribute("user");

		AttendanceDAO dao = new AttendanceDAO();
		List<Attendance> list = dao.getAttendanceByStudentId(studentId); // ✅ CORRECT METHOD

		request.setAttribute("attendanceList", list);

		RequestDispatcher rd = request.getRequestDispatcher("/student/student_attendance.jsp");
		rd.forward(request, response);
	}
}