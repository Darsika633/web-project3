package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Customer;
import com.dmpcare.service.CustomerService;

@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddCustomer() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters
        Customer cus = new Customer();
        cus.setName(request.getParameter("name"));
        cus.setEmail(request.getParameter("email"));
        cus.setPassword(request.getParameter("password"));

        // Register user (your service logic)
        CustomerService cs = new CustomerService();
        cs.regCustomer(cus);

      
        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
}

