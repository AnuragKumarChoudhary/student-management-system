<%-- 
    Document   : studentData
    Created on : 18 Sep, 2019, 11:58:40 AM
    Author     : Anurag Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Data</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="studentData.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            .card{
                box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.2), 0 8px 30px 0 rgba(0, 0, 0, 0.19);
                width: 70%;
                margin-top: 1%;
                margin-left: 15%;
                padding-top: 15px;
                padding-left: 15px;
                line-height: 0.2;
            }
            .label{
                font-weight: bold;
            }
            .image{
                border: 1px solid black;
                padding: 5px;  
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <div class="container-fluid header">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <div>
                        <p>Hello ${username}</p>
                    </div>
                </div>
            </div>
        </div>

        <%
            Connection connect = null;
            Statement statement = null;
            ResultSet result = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatabasesystem", "root", "");
                statement = connect.createStatement();

                String query = "Select * from studentinfo";
                result = statement.executeQuery(query);
                while (result.next()) {
        %>
        <div class="card">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-2">
                        <%
                            if (result.getString(7).trim().equals("Male")) {
                        %>
                        <img class="image" src="../assets/boy.png" width="120px" height="120px" title="Male" />
                        <%
                        } else {
                        %>
                        <img class="image" src="../assets/girl.png" width="120px" height="120px" title="Female" />  
                        <%
                            }
                        %>
                    </div>
                    <div class="col-sm-9">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Name : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(2) + " " + result.getString(3)%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Email : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(4)%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Contact : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(5)%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <P class="label">Branch : </p>
                            </div><div class="col-sm-9">
                                <p>- <%=result.getString(6)%></P>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Registration ID : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(15)%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Date of Birth : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(8)%></p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="label">Address : </p>
                            </div>
                            <div class="col-sm-9">
                                <p>- <%=result.getString(9) + ", " + result.getString(10) + ", " + result.getString(11) + ", " + result.getString(12) + ", " + result.getString(13) + " - " + result.getString(14)%></p>
                            </div>  
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="../updateStudent/update.jsp">
                                    <div>
                                        <input name="ID" type="hidden" value="<%=result.getString(15)%>">
                                        <i style="position:absolute; z-index: 2;font-size: 20px;padding-top: 5px; padding-left: 7px;margin-top: 22%;margin-left: 2%;color: white;" class="fa fa-pencil"></i>
                                        <input title="Edit" style="position:relative;width: 36px;height: 36px; border-radius: 18px;margin-top: 30%;border: none;background-color: orange;outline: none;" type="submit" value="">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <form action="../deleteStudent/delete.jsp">
                                    <div>
                                        <input name="ID" type="hidden" value="<%=result.getString(15)%>">
                                        <i style="position:absolute; z-index: 2; font-size: 20px;padding-top: 5px; padding-left: 5px;margin-top: 22%;margin-left: 5%;color: white;" class="fa fa-trash"></i>
                                        <input title="Delete" style="position:relative;width: 36px;height: 36px; border-radius: 18px;margin-top: 30%;border: none;background-color: red;outline: none;" type="submit" value="">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
            }
        %>
        <br>
    </body>
</html>
