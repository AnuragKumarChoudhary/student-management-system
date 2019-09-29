<%-- 
    Document   : welcome
    Created on : 27 Sep, 2019, 12:27:12 AM
    Author     : Anurag Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Database</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            body{
                width: 100vw;
                height: 100vh;
                background-image: url(assets/welcome.jpg);
                background-size: cover;
            }
            .card{
                padding: 20px;
                position: absolute;
                top: 50%;
                transform: translateY(100%);
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .button{
                margin-top: 10px;
            }
            .about{
                text-align: center;
                margin-top: 10px;
                background: white;
                padding: 5px;
                border-radius: 3px;
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .about > a{
                text-decoration: none;
                color: black;
            }
            .menu{
                width: 70%;
                margin-top: 10px;
                color: black;
                background: white;
                padding-top: 5px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-5"></div>
                <div class="col-sm-1">
                    <div class="about">
                        <a href="http://localhost:8084/StudentDatabaseManagement/aboutUs/aboutUs.jsp">About Us</a>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="menu">
                        <p>Hello ${username}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="search/search.jsp">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <input type="text" placeholder="Enter Registration ID" name="search" class="form-control">
                                        </div>
                                        <div class="col-sm-4">
                                            <input class="btn btn-warning form-control" type="submit" value="Search">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="addStudent/add.jsp">
                                    <input class="btn btn-primary form-control button" type="submit" value="Add Student">
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="showStudent/studentData.jsp">
                                    <input class="btn btn-primary form-control button" type="submit" value="Show Student">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
