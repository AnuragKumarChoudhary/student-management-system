<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Database</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Merienda&display=swap" rel="stylesheet">
        <style>
            body{
                width: 100vw;
                height: 100vh;
                background-image: url(assets/welcome.jpg);
                background-size: cover;
                font-family: sans-serif;
            }
            .card{
                padding: 20px;
                position: absolute;
                top: 50%;
                transform: translateY(75%);
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
            }
            .button{
                margin-top: 10px;
            }
            .about{
                width: 100%;
                text-align: center;
                margin-top: 10px;
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
                margin-top: 10px;
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
                color: white;
                padding-top: 10px;
                font-family: 'Merienda', cursive;
                text-shadow: 2px 2px #ff0000;
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
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-9">
                    <a href="welcome.jsp"><p class="heading">student management system</p></a>
                </div>
                <div class="col-sm-1">
                    <div class="about">
                        <a href="aboutUs/aboutUs.jsp">About Us</a>
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
