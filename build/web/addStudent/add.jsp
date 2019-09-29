<%-- 
    Document   : add
    Created on : 25 Sep, 2019, 2:40:35 PM
    Author     : Anurag Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/style.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container-fluid header">
            <div class="row">
                <div class="col-sm-5">
                    <h3>Student Database Management</h3>
                </div>
                <div class="col-sm-3"></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2 btn-shw-stnd">
                    <div class="dropdown">
                        <button style="outline: none;" class="btn btn-success dropdown-toggle text-dark bg-transparent" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Actions
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="http://localhost:8084/StudentDatabaseManagement/showStudent/studentData.jsp">Show Students</a>
                            <a class="dropdown-item" href="http://localhost:8084/StudentDatabaseManagement/updateStudent/update.jsp">Update Students</a>
                            <a class="dropdown-item" href="http://localhost:8084/StudentDatabaseManagement/deleteStudent/delete.jsp">Delete Students</a>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <form action="addStudent.jsp" method="get">
            <div class="container body">
                <div class="row">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>First Name</label>
                                <input class="form-control" type="text" name="fname">
                            </div>
                            <div class="col-sm-6">
                                <label>Last Name</label>
                                <input class="form-control" type="text" name="lname">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Email</label>
                                <input class="form-control" type="email" name="email">
                            </div>
                            <div class="col-sm-6">
                                <label>Contact No.</label>
                                <input class="form-control" type="number" name="contact">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <label>Department</label>
                                <select class="form-control" name="dept">
                                    <option selected>Choose...</option>
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
                                    <option selected="">Choose...</option>
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label>Date of Birth</label>
                                <input class="form-control" type="date" name="dob">
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
                                <input class="form-control" type="text" name="add1">
                            </div>
                            <div class="col-sm-6">
                                <label>Address Line 2</label>
                                <input class="form-control" type="text" name="add2">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>District</label>
                                <input class="form-control" type="text" name="district">
                            </div>
                            <div class="col-sm-6">
                                <label>State</label>
                                <input class="form-control" type="text" name="state">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Country</label>
                                <select class="form-control" name="country">
                                    <option selected>Choose...</option>
                                    <option>India</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <label>Postal Code</label>
                                <input class="form-control" type="number" name="zipcode">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <button class="btn btn-primary" style="margin-top: 20px" type="submit" click="data.jsp">Add Student</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </form>
    </body>
</html>
