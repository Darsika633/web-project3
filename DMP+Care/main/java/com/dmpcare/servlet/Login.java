package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Customer;
import com.dmpcare.service.CustomerService;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	Customer cus = new Customer();
    	cus.setEmail(request.getParameter("email"));
    	cus.setPassword(request.getParameter("password"));
    	
    	CustomerService cs = new CustomerService();

    	boolean status = cs.validate(cus);
    	
    	
		if(status) {
			HttpSession session = request.getSession();
		    session.setAttribute("username", cus.getName()); // or cus.getName() if available
		   
		    
		    Customer loginedcus = cs.getOne(cus);
    		RequestDispatcher dispatcher = request.getRequestDispatcher ("profile.jsp");
    		request.setAttribute("Customer", loginedcus);
    		dispatcher.forward(request, response);
    	}
    	else {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
    	}
    }
  }



