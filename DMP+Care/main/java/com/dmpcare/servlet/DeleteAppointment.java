package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Appointment;
import com.dmpcare.service.AppointmentService;


@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteAppointment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 Appointment app = new Appointment();
    	 app.setId(Integer.parseInt(request.getParameter("id")));
    	 
    	 AppointmentService as = new AppointmentService();
    	 as.deleteAppointment(app);
    	 
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("AppointmentTable");
    	 dispatcher.forward(request, response);
    }

    }

