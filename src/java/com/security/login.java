package com.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username.equals("admin")) {
            if (password.equals("password")) {

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("welcome.jsp");

            } else {

                request.setAttribute("errorMessage", "Password is Incorrect.");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            }
        } else {

            request.setAttribute("errorMessage", "Username is Incorrect.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
