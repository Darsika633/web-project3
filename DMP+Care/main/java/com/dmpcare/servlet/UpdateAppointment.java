package com.dmpcare.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dmpcare.model.Appointment;
import com.dmpcare.service.AppointmentService;

@WebServlet("/UpdateAppointment")
public class UpdateAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateAppointment() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  Appointment app = new Appointment();
    	  
    	  app.setId(Integer.parseInt(request.getParameter("id")));
    	  app.setName(request.getParameter("name"));
    	  app.setPhone(request.getParameter("phone"));
    	  app.setPatientType(request.getParameter("patientType"));
    	  app.setDoctor(request.getParameter("doctor"));
    	  app.setDate(request.getParameter("date"));
    	  app.setTime(request.getParameter("time"));
    	  app.setReason(request.getParameter("reason"));
    	  
    	  AppointmentService as = new AppointmentService();
    	  as.updateAppointment(app);
    	  
    	  RequestDispatcher dispatcher = request.getRequestDispatcher("AppointmentTable");
    	  dispatcher.forward(request, response);
    	}

    }

