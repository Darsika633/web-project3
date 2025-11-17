package com.healthcare.servlets;

import com.healthcare.util.DBConnection;

import com.healthcare.model.Ticket;
import com.healthcare.service.TicketService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;



@WebServlet("/RaiseTicketServlet")
public class RaiseTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
    public RaiseTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	Ticket ticket = new Ticket();
    	
    	
    	ticket.setFullName(request.getParameter("fullName"));
        ticket.setEmail(request.getParameter("email"));
        ticket.setPhone(request.getParameter("phone"));
        ticket.setDate(request.getParameter("date"));
        ticket.setTime(request.getParameter("time"));
        ticket.setIssueCategory(request.getParameter("issueCategory"));
        ticket.setIssueDescription(request.getParameter("issueDescription"));

        
    	TicketService as = new TicketService();
    	as.saveTicket(ticket);
    	
    	// Set success message
        request.setAttribute("message", "Ticket raised successfully!");

      
        RequestDispatcher dispatcher = request.getRequestDispatcher("TicketTable.jsp");
        dispatcher.forward(request, response);
    }
}

