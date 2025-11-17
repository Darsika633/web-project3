package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Payment;
import com.dmpcare.service.PaymentService;

@WebServlet("/AddPayment")
public class AddPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPayment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Populate Payment model from form data
        Payment payment = new Payment();
        payment.setFullName(request.getParameter("fullName"));
        payment.setEmail(request.getParameter("email"));
        payment.setService(request.getParameter("service"));

        try {
            payment.setAmount(Double.parseDouble(request.getParameter("amount")));
        } catch (NumberFormatException e) {
            payment.setAmount(0.0); // fallback in case of invalid input
        }

        payment.setCardNumber(request.getParameter("cardNumber"));

        // Save via service
        PaymentService ps = new PaymentService();
        ps.savePayment(payment);

        // Forward to confirmation page
        request.setAttribute("amount", payment.getAmount());
        request.setAttribute("transactionId",payment.getId());

        RequestDispatcher dispatcher = request.getRequestDispatcher("paymentSuccess.jsp");
        dispatcher.forward(request, response);
    }
}
