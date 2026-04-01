package com.attendance.model;

public class Attendance {

    private String id;
    private String studentId;
    private String teacherId;
    private String subject;
    private String date;
    private String status;
     private String studentName;
     private String teacherName;
    // ✅ EMPTY CONSTRUCTOR (needed by servlet)
    public Attendance() {
    }

    // ✅ FULL CONSTRUCTOR (needed by DAO)
    public Attendance(String id, String studentId, String teacherId, String subject, String date, String status) {
        this.id = id;
        this.studentId = studentId;
        this.teacherId = teacherId;
        this.subject = subject;
        this.date = date;
        this.status = status;
    }

    // ✅ GETTERS & SETTERS

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getTeacherName() { 
    	return teacherName; 
    	}
    public void setTeacherName(String teacherName) { 
    	this.teacherName = teacherName;
    	}
}