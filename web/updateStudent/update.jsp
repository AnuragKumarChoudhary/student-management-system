<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Merienda&display=swap" rel="stylesheet">
        <style>
            .header{
                box-shadow: 0 7px 10px -10px #000000;
            }
            label{
                font-weight: bold;
            }
            .about{
                text-align: center;
                margin-top: 20px;
                background: white;
                padding-top: 7px;
                padding-bottom: 7px;
                border-radius: 3px;
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .about:hover{
                background-color: #E9EBF5;
                cursor: pointer;
            }
            .about > a{
                text-decoration: none;
                color: black;
                font-family: sans-serif;
            }
            .about > a:hover{
                text-decoration: none;
                color: red;
                font-family: sans-serif;
            }
            .dropdown, .body{
                margin-top: 20px;
            }
            .btn{
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .btn:hover{
                color: red;
            }
            .logout{
                border: none;
                outline: none;
                box-shadow: none;
            }
            .logout:focus{
                border: none;
                outline: none;
                box-shadow: none;
            }
            .logout:hover{
                border: none;
                outline: none;
                box-shadow: none;
                color: red;
            }
            a{
                font-weight: bolder;
            }
            a:hover{
                text-decoration: none;
            }
            .heading{
                font-size: 35px;
                font-weight: bolder;
                color: black;
                padding-top: 10px;
                font-family: 'Merienda', cursive;
            }
        </style>
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
        <div class="container-fluid header">
            <div class="row">
                <div class="col-sm-9">
                    <a href="../welcome.jsp"><p class="heading">student management system</p></a>
                </div>
                <div class="col-sm-1">
                    <div class="about">
                        <a href="../aboutUs/aboutUs.jsp">About Us</a>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello ${username}
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <form action="../logout">
                                <input type="submit" class="form-control logout" value="Log Out">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            String id = request.getParameter("ID");

            Connection connect = null;
            Statement statement = null;
            ResultSet result = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDatabaseSystem", "root", "");
                statement = connect.createStatement();

                String query = "Select * from studentinfo where regID = '" + id + "';";
                result = statement.executeQuery(query);
            } catch (Exception e) {
                out.print(e.getMessage());
            }
            if (result.next()) {
        %>
        <form action="updateData.jsp" method="get">
            <div class="container body">
                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>First Name</label>
                                <input class="form-control" type="text" name="fname" value="<%=result.getString(2)%>">
                            </div>
                            <div class="col-sm-6">
                                <label>Last Name</label>
                                <input class="form-control" type="text" name="lname" value="<%=result.getString(3)%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Email</label>
                                <input class="form-control" type="email" name="email" value="<%=result.getString(4)%>">
                            </div>
                            <div class="col-sm-6">
                                <label>Contact No.</label>
                                <input class="form-control" type="number" name="contact" value="<%=result.getString(5)%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <label>Department</label>
                                <select class="form-control" name="dept">
                                    <option selected value="<%=result.getString(6)%>"><%=result.getString(6)%></option>
                                    <option value="CSE">Computer Science & Technology</option>
                                    <option value="IT">Information Technology</option>
                                    <option value="ECE">Electronics & Communication Engineering</option>
                                    <option value="ME">Mechanical Engineering</option>
                                    <option value="CE">Civil Engineering</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Gender</label>
                                <select class="form-control" name="gender">
                                    <option selected><%=result.getString(7)%></option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label>Date of Birth</label>
                                <input class="form-control" type="date" name="dob" value="<%=result.getString(8)%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <hr>
                                <h4>Address</h4>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Address Line 1</label>
                                <input class="form-control" type="text" name="add1" value="<%=result.getString(9)%>">
                            </div>
                            <div class="col-sm-6">
                                <label>Address Line 2</label>
                                <input class="form-control" type="text" name="add2" value="<%=result.getString(10)%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>District</label>
                                <input class="form-control" type="text" name="district" value="<%=result.getString(11)%>">
                            </div>
                            <div class="col-sm-6">
                                <label>State</label>
                                <input class="form-control" type="text" name="state" value="<%=result.getString(12)%>">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Country</label>
                                <select class="form-control" name="country">
                                    <option selected><%=result.getString(13)%></option>
                                    <option>India</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label>Postal Code</label>
                                <input class="form-control" type="number" name="zipcode" value="<%=result.getString(14)%>">
                            </div>
                            <input type="hidden" name="regID" value="<%=result.getString(15)%>"
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <button class="btn btn-primary" style="margin-top: 20px;margin-bottom: 20px;" type="submit">Update Student Info</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </form>
        <%
        } else {
        %>
        <p>No record found.</p>
        <%
            }
        %>
    </div>
    <br>
</body>
</html>
