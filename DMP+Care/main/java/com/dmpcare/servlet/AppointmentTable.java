package com.dmpcare.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Appointment;
import com.dmpcare.service.AppointmentService;

@WebServlet("/AppointmentTable")
public class AppointmentTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AppointmentTable() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	
    	AppointmentService as = new AppointmentService();
    	ArrayList<Appointment> Appointment = as.getList();
    	request.setAttribute("appointment", Appointment);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("appointmentTable.jsp");
    	dispatcher.forward(request, response);
    }
}
