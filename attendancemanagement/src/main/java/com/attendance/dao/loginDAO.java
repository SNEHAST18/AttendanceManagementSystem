package com.attendance.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.attendance.util.DBconnection;

public class loginDAO {

    public String validateUser(String username, String password) {

        String role = null;

        try {
            Connection conn = DBconnection.getConnection();

            // ✅ ADMIN → username + password
            String adminSql = "SELECT * FROM admin WHERE username=? AND password=?";
            PreparedStatement ps1 = conn.prepareStatement(adminSql);
            ps1.setString(1, username);
            ps1.setString(2, password);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) return "admin";

            // ✅ TEACHER → email + password
            String teacherSql = "SELECT * FROM teacher WHERE email=? AND password=?";
            PreparedStatement ps2 = conn.prepareStatement(teacherSql);
            ps2.setString(1, username);   // same input used as email
            ps2.setString(2, password);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) return "teacher";

            // ✅ STUDENT → email + password
            String studentSql = "SELECT * FROM student WHERE email=? AND password=?";
            PreparedStatement ps3 = conn.prepareStatement(studentSql);
            ps3.setString(1, username);   // same input used as email
            ps3.setString(2, password);
            ResultSet rs3 = ps3.executeQuery();

            if (rs3.next()) return "student";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public String getTeacherId(String username) {
        String id = null;
        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT id FROM teacher WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
}