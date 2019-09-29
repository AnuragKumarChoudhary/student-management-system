<%-- 
    Document   : data
    Created on : 18 Sep, 2019, 1:16:48 AM
    Author     : Anurag Choudhary
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Database System</title>
    </head>
    <body>
        <%
            Random random = new Random();
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String dept = request.getParameter("dept");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String add1 = request.getParameter("add1");
            String add2 = request.getParameter("add2");
            String district = request.getParameter("district");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            String zipcode = request.getParameter("zipcode");
            int regID = random.nextInt(9999999);
            Connection connect = null;
            Statement statement = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatabasesystem", "root", "");
                statement = connect.createStatement();

                String query = "Insert into studentinfo(`id`,`fname`,`lname`,`email`,`contact`,`dept`,`gender`,`dob`,`add1`,`add2`,`district`,`state`,`country`,`zipcode`, `regID`) values (NULL, '" + fname + "', '" + lname + "','" + email + "','" + contact + "','" + dept + "','" + gender + "','" + dob + "','" + add1 + "', '" + add2 + "', '" + district + "', '" + state + "', '" + country + "', '" + zipcode + "', '" + regID + "')";
                statement.executeUpdate(query);
                out.print("Data Added Successfully");
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
