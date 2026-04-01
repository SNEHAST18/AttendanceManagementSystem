package com.attendance.dao;

import java.sql.*;
import java.util.*;
import com.attendance.model.Attendance;
import com.attendance.util.DBconnection;

public class AttendanceDAO {

    // Add attendance
    public boolean addAttendance(Attendance a) {
        boolean status = false;
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "INSERT INTO attendance(student_id, teacher_id, subject, `date`, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, a.getStudentId());
            ps.setString(2, a.getTeacherId());
            ps.setString(3, a.getSubject());
            ps.setString(4, a.getDate());
            ps.setString(5, a.getStatus());
            int i = ps.executeUpdate();
            if (i > 0) status = true;
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    // Admin: view all attendance
    public List<Attendance> getAllAttendance() {
        List<Attendance> list = new ArrayList<>();
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT a.id, a.student_id, a.teacher_id, a.subject, a.date, a.status, " +
                         "s.name AS student_name, t.name AS teacher_name " +
                         "FROM attendance a " +
                         "LEFT JOIN student s ON a.student_id = s.id " +
                         "LEFT JOIN teacher t ON a.teacher_id = t.id";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getString("id"));
                a.setStudentId(rs.getString("student_id"));
                a.setTeacherId(rs.getString("teacher_id"));
                a.setSubject(rs.getString("subject"));
                a.setDate(rs.getString("date"));
                a.setStatus(rs.getString("status"));
                a.setStudentName(rs.getString("student_name"));
                a.setTeacherName(rs.getString("teacher_name"));
                list.add(a);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Teacher: view attendance by teacher email
    public List<Attendance> getAttendanceByTeacher(String teacherEmail) {
        List<Attendance> list = new ArrayList<>();
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT a.id, a.student_id, a.teacher_id, a.subject, a.date, a.status, " +
                         "s.name AS student_name, t.name AS teacher_name " +
                         "FROM attendance a " +
                         "JOIN student s ON a.student_id = s.id " +
                         "JOIN teacher t ON a.teacher_id = t.id " +
                         "WHERE t.email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, teacherEmail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getString("id"));
                a.setStudentId(rs.getString("student_id"));
                a.setStudentName(rs.getString("student_name"));
                a.setTeacherId(rs.getString("teacher_id"));
                a.setTeacherName(rs.getString("teacher_name"));
                a.setSubject(rs.getString("subject"));
                a.setDate(rs.getString("date"));
                a.setStatus(rs.getString("status"));
                list.add(a);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Optional: get attendance by student id
    public List<Attendance> getAttendanceByStudentId(String studentId) {
        List<Attendance> list = new ArrayList<>();
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT * FROM attendance WHERE student_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Attendance a = new Attendance(
                    rs.getString("id"),
                    rs.getString("student_id"),
                    rs.getString("teacher_id"),
                    rs.getString("subject"),
                    rs.getString("date"),
                    rs.getString("status")
                );
                list.add(a);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}