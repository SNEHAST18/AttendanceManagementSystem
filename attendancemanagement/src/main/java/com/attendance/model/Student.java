package com.attendance.model;

public class Student {
	
    private String rollno;
    private String name;
    private String email;
    private String password;
    private String branch;
    private String semester;
    private String id; // optional, if you use id from DB

    public Student() { }

    // Add this constructor (matches your servlet usage)
    public Student(String id,String rollno, String name, String email, String password, String branch, String semester) {
        this.id=id;
    	this.rollno = rollno;
        this.name = name;
        this.email = email;
        this.password = password;
        this.branch = branch;
        this.semester = semester;
    }
 // ✅ CONSTRUCTOR WITHOUT ID (FOR ADD STUDENT)
    public Student(String rollno, String name, String email, String password, String branch, String semester) {
    	this.rollno = rollno;
    	this.name = name;
    	this.email = email;
    	this.password = password;
    	this.branch = branch;
    	this.semester = semester;
    }
    // Getters and setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getRollno() { return rollno; }
    public void setRollno(String rollno) { this.rollno = rollno; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public String getSemester() { return semester; }
    public void setSemester(String semester) { this.semester = semester; }
}