<%-- 
    Document   : deleteData
    Created on : 19 Sep, 2019, 2:17:23 PM
    Author     : Anurag Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            String id = request.getParameter("id");

            Connection connect = null;
            Statement statement = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connect = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDatabaseSystem", "root", "");
                statement = connect.createStatement();

                String query = "Delete from studentinfo where id = " + id + ";";
                statement.executeUpdate(query);
                request.setAttribute("Success", "Student Data with ID = " + id + " is deleted");
                response.sendRedirect("../welcome.jsp");
        %>
        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }
        %>
    </body>
</html>
