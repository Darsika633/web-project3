package com.dmpcare.service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dmpcare.model.Appointment;
import com.dmpcare.utils.DBConnect;

public class AppointmentService {
	
   //insert new record to appointment table
	public void saveAppointment(Appointment app) {
		try {
			String query = "insert into appointment values(NUll,'" +app.getName()+"','"+app.getPhone()+"','"+app.getPatientType()+"','"+app.getDoctor()+"','"+app.getDate()+"','"+app.getTime()+"','"+app.getReason()+"')";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// read all the values
	public ArrayList<Appointment> getList(){
		try {
			ArrayList<Appointment> ListAppointment = new ArrayList<Appointment>();
			String query = "select * from appointment";
			Statement statement = DBConnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				
				Appointment app = new Appointment();
				app.setId(rs.getInt("id"));  // ✅ add this line at the top before setName()
				app.setName(rs.getString("name"));
				app.setPhone(rs.getString("phone"));
				app.setPatientType(rs.getString("patientType"));
				app.setDoctor(rs.getString("doctor"));
				app.setDate(rs.getString("date"));
				app.setTime(rs.getString("time"));
				app.setReason(rs.getString("reason"));
				
				ListAppointment.add(app);
			}
			return ListAppointment;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	
	}
	// update 
	public void updateAppointment(Appointment app) {
		try {
			
			String query = "UPDATE appointment SET name = '"+app.getName()+"', phone = '"+app.getPhone()+"',patientType = '"+app.getPatientType()+"', doctor ='"+app.getDoctor()+"', date = '"+app.getDate()+"', time ='"+app.getTime()+"', reason = '"+app.getReason()+"' where id ='"+app.getId()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//delete
	public void deleteAppointment(Appointment app) {
		try {
			String query = "Delete from appointment where id = '"+app.getId()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
