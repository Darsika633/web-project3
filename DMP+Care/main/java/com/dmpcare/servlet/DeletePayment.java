package com.dmpcare.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dmpcare.model.Payment;
import com.dmpcare.service.PaymentService;

@WebServlet("/DeletePayment")
public class DeletePayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeletePayment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 Payment pay = new Payment();
    	 pay.setId(Integer.parseInt(request.getParameter("id")));
    	 
    	 PaymentService as = new PaymentService();
    	 as.deletePayment(pay);
    	 
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentTable");
    	 dispatcher.forward(request, response);
    }

    }
