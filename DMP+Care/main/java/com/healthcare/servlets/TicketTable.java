package com.healthcare.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthcare.model.Ticket;
import com.healthcare.service.TicketService;

@WebServlet("/TicketTable")
public class TicketTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TicketTable() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 4: Call service to get all tickets from DB
        TicketService as = new TicketService();
        ArrayList<Ticket> ticketList = as.getList();

        // Debug: Print how many tickets fetched
        System.out.println("Fetched Ticket Count: " + ticketList.size());

        // Store tickets in request to send to JSP
        request.setAttribute("tickets", ticketList);

        // Forward to TicketTable.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("TicketTable.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
}
