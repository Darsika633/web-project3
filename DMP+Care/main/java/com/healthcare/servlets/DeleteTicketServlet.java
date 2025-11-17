package com.healthcare.servlets;

import com.healthcare.model.Ticket;
import com.healthcare.service.TicketService;

import com.healthcare.util.DBConnection;



import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteTicketServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	
   

    	 Ticket ticket = new Ticket();
    	 ticket.setTicketId(Integer.parseInt(request.getParameter("ticketId")));

             TicketService service = new TicketService();
             service.deleteTicket(ticket);

    	 System.out.println("Deleting Ticket ID: " + ticket.getTicketId());
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("TicketTable");
    	 dispatcher.forward(request, response);
    }

    }


