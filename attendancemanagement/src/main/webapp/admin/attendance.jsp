<h2>Mark Attendance (Admin)</h2>

<form action="../addAttendance" method="post">

    Student ID: 
    <input type="text" name="studentId" required><br><br>

    Teacher ID: 
    <input type="text" name="teacherId" required><br><br>

    Subject: 
    <input type="text" name="subject" required><br><br>

    Date: 
    <input type="date" name="date" required><br><br>

    Status:
    <select name="status">
        <option>Present</option>
        <option>Absent</option>
    </select><br><br>

    <input type="submit" value="Submit Attendance">

</form>