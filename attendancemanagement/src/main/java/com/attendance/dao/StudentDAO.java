package com.attendance.dao;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.attendance.model.Student;
import com.attendance.util.DBconnection;

public class StudentDAO {

	public boolean addStudent(Student s) {
	    boolean status = false;
	    try {
	        Connection conn = DBconnection.getConnection();

	        // make sure table is students and id is AUTO_INCREMENT in DB
	        String sql = "INSERT INTO student (rollno, name, email, password, branch, semester) VALUES (?, ?, ?, ?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, s.getRollno());
	        ps.setString(2, s.getName());
	        ps.setString(3, s.getEmail());
	        ps.setString(4, s.getPassword());
	        ps.setString(5, s.getBranch());
	        ps.setString(6, s.getSemester());

	        int i = ps.executeUpdate();
	        if (i > 0) status = true;

	    } catch (Exception e) {
	        e.printStackTrace(); // check console for exact error if still fails
	    }
	    return status;
	}
    public List<Student> getAllStudents() {

        List<Student> list = new ArrayList<>();

        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT * FROM student";   // your table name
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student s = new Student(
                		rs.getString("id"),
                    rs.getString("rollno"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("branch"),
                    rs.getString("semester")
                );

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public boolean updateStudent(Student s) {
        boolean status = false;

        try {
            Connection conn = DBconnection.getConnection();
            String sql = "UPDATE student SET rollno=?, name=?, password=?, semester=? WHERE id=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s.getRollno());
            ps.setString(2, s.getName());
            ps.setString(3, s.getPassword());
            
            ps.setString(4, s.getSemester());
            ps.setString(5, s.getId());

            int i = ps.executeUpdate();
            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public boolean deleteStudent(String id) {
        boolean status = false;

        try {
            Connection conn = DBconnection.getConnection();
            String sql = "DELETE FROM student WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, id);

            int i = ps.executeUpdate();
            if (i > 0)
                status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public Student getStudentById(String id) {
        Student s = null;

        try {
            Connection conn = DBconnection.getConnection();
            String sql = "SELECT * FROM student WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student(
                    rs.getString("id"),
                    rs.getString("rollno"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("branch"),
                    rs.getString("semester")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }
    
}