package com.attendance.dao;

import java.sql.*;
import java.util.*;

import com.attendance.model.Teacher;

public class TeacherDAO {

    private Connection conn;

    public TeacherDAO(Connection conn) {
        this.conn = conn;
    }

    // ✅ ADD TEACHER
    public boolean addTeacher(Teacher t) {
        boolean result = false;
        try {
            String sql = "INSERT INTO teacher(name, email, password, subject) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getEmail());
            ps.setString(3, t.getPassword());
            ps.setString(4, t.getSubject());

            result = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // ✅ VIEW ALL TEACHERS
    public List<Teacher> getAllTeachers() {
        List<Teacher> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM teacher";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Teacher t = new Teacher(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("subject")
                );
                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ DELETE TEACHER
    public boolean deleteTeacher(int id) {
    	boolean result=false;
        try {
            String sql = "DELETE FROM teacher WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            result=ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // ✅ GET TEACHER BY ID (FOR EDIT)
    public Teacher getTeacherById(int id) {
        Teacher t = null;
        try {
            String sql = "SELECT * FROM teacher WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                t = new Teacher(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("subject")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    // ✅ UPDATE TEACHER
    public boolean updateTeacher(Teacher t) {
    	boolean result=false;
        try {
            String sql = "UPDATE teacher SET name=?, email=?, password=?, subject=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getEmail());
            ps.setString(3, t.getPassword());
            ps.setString(4, t.getSubject());
            ps.setInt(5, t.getId());

           result= ps.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}