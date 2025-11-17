package com.dmpcare.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Payment;
import com.dmpcare.service.PaymentService;

@WebServlet("/PaymentTable")
public class PaymentTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PaymentTable() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch list of payments
        PaymentService ps = new PaymentService();
        ArrayList<Payment> paymentList = ps.getList();

        // Set attribute and forward to JSP
        request.setAttribute("payment", paymentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentTable.jsp");
        dispatcher.forward(request, response);
    }
}
