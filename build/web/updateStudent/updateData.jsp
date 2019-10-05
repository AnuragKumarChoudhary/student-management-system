<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Data</title>
        <link rel="stylesheet" href="../styles/style.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            if (session.getAttribute("username") == null) {
                response.sendRedirect("../index.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-5"></div>
                <div class="col-sm-1">
                    <div class="about">
                        <a href="/aboutUs/aboutUs.jsp">About Us</a>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello ${username}
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <form action="logout">
                                <input type="submit" class="form-control logout" value="Log Out">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
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
            String regID = request.getParameter("regID");

            Connection connect = null;
            Statement statement = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDatabaseSystem", "root", "");
                statement = connect.createStatement();

                String query = "Update studentinfo SET fname='" + fname + "', lname='" + lname + "', email='" + email + "', contact='" + contact + "', dept='" + dept + "', gender='" + gender + "', dob='" + dob + "', add1='" + add1 + "', add2='" + add2 + "', district='" + district + "', state='" + state + "', country='" + country + "', zipcode='" + zipcode + "' where regID='" + regID + "';";
                statement.executeUpdate(query);
                request.setAttribute("Success", "Message: Data was Updated Successfully.");
                response.sendRedirect("../welcome.jsp");
            } catch (Exception e) {
                request.setAttribute("Error", "Error: " + e.getMessage());
            }
        %>
    </body>
</html>
