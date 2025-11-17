package com.healthcare.servlets;

import com.healthcare.model.Ticket;
import com.healthcare.service.TicketService;

import com.healthcare.util.DBConnection;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.sql.*;


@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  Ticket ticket = new Ticket();
    	  
			ticket.setTicketId(Integer.parseInt(request.getParameter("ticketId")));  // ✅ add this line at the top before setName()
			ticket.setFullName(request.getParameter("fullName"));
			ticket.setEmail(request.getParameter("email"));
			ticket.setPhone(request.getParameter("phone"));
			ticket.setDate(request.getParameter("date"));
			ticket.setTime(request.getParameter("time"));
			ticket.setIssueCategory(request.getParameter("issueCategory"));
			ticket.setIssueDescription(request.getParameter("issueDescription"));
			
    	  
    	  TicketService as = new TicketService();
    	  as.updateTicket(ticket);
    	  System.out.println("Updating ticket: " + ticket.getTicketId() + " with description: " + ticket.getIssueDescription());

    	  RequestDispatcher dispatcher = request.getRequestDispatcher("TicketTable");
    	  dispatcher.forward(request, response);
    	}

    }


