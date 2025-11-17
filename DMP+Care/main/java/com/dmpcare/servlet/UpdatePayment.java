package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Payment;
import com.dmpcare.service.PaymentService;

@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdatePayment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Payment payment = new Payment();

        payment.setId(Integer.parseInt(request.getParameter("id")));
        payment.setFullName(request.getParameter("fullName"));
        payment.setEmail(request.getParameter("email"));
        payment.setService(request.getParameter("service"));

        try {
            payment.setAmount(Double.parseDouble(request.getParameter("amount")));
        } catch (NumberFormatException e) {
            payment.setAmount(0.0);
        }

        payment.setCardNumber(request.getParameter("cardNumber"));

        PaymentService ps = new PaymentService();
        ps.updatePayment(payment);

        // Forward back to table view
        RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentTable");
        dispatcher.forward(request, response);
    }
}
