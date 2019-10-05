<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Merienda&display=swap" rel="stylesheet">
        <style>
            .header{
                box-shadow: 0 7px 10px -10px #000000;
            }
            .card{
                padding: 20px;
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .preview{
                margin-top: 20px;
                margin-bottom: 20px;
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
            .dropdown{
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
                if (result.next()) {
        %>
        <div class="container preview">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Preview</h2>
                </div>
            </div>
        </div>
        <div class="container card">
            <div class="row">
                <div class="col-sm-3">
                    <p>Name</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(2) + " " + result.getString(3)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Email</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(4)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Contact</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(5)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Department</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(6)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Registration ID</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(15)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Gender</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(7)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Date of Birth</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(8)%></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <p>Address</p>
                </div>
                <div class="col-sm-9">
                    <p>- <%= result.getString(9) + ", " + result.getString(10) + ", " + result.getString(11) + ", " + result.getString(12) + ", " + result.getString(13) + " - " + result.getString(14)%></p>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4">
                    <form action="deleteData.jsp" method="get">
                        <div class="not-visible" style="position: fixed; top: 50%; left: 50%;width: 300px; height: 100px;z-index: -2;"><input type="text" name="id" value="<%= result.getString(1)%>"></div>
                        <input class="btn btn-danger" type="submit" value="Delete Student" />
                        <div style="position: fixed; top: 50%; left: 50%;width: 300px; height: 100px;background-color: white; z-index: -1;"></div>
                    </form>
                </div>
            </div>
        </div>
        <%
        } else {%>
        <h4>No Record Found</h4>
        <%
                }
            } catch (Exception e) {
            }
        %>

    </div>
</div>
</body>
</html>
