package com.healthcare.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.healthcare.model.Ticket;
import com.healthcare.util.DBConnection;

public class TicketService {

    // CREATE
    public void saveTicket(Ticket ticket) {
        try {
            String query = "INSERT INTO tickets (fullName, email, phone, date, time, issueCategory, issueDescription) " +
                           "VALUES ('" + ticket.getFullName() + "', '" + ticket.getEmail() + "', '" + ticket.getPhone() +
                           "', '" + ticket.getDate() + "', '" + ticket.getTime() + "', '" + ticket.getIssueCategory() +
                           "', '" + ticket.getIssueDescription() + "')";

            Statement statement = DBConnection.getConnection().createStatement();
            System.out.println("Running Query: " + query);
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // READ
    public ArrayList<Ticket> getList() {
        ArrayList<Ticket> ticketList = new ArrayList<>();
        try {
            String query = "SELECT * FROM tickets";
            Statement statement = DBConnection.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticketId"));
                ticket.setFullName(rs.getString("fullName"));
                ticket.setEmail(rs.getString("email"));
                ticket.setPhone(rs.getString("phone"));
                ticket.setDate(rs.getString("date"));
                ticket.setTime(rs.getString("time"));
                ticket.setIssueCategory(rs.getString("issueCategory"));
                ticket.setIssueDescription(rs.getString("issueDescription"));
                ticketList.add(ticket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ticketList;
    }

    // UPDATE
    public void updateTicket(Ticket ticket) {
        try {
            String query = "UPDATE tickets SET fullName='" + ticket.getFullName() +
                "', email='" + ticket.getEmail() +
                "', phone='" + ticket.getPhone() +
                "', date='" + ticket.getDate() +
                "', time='" + ticket.getTime() +
                "', issueCategory='" + ticket.getIssueCategory() +
                "', issueDescription='" + ticket.getIssueDescription() +
                "' WHERE ticketId=" + ticket.getTicketId();

            Statement statement = DBConnection.getConnection().createStatement();
            System.out.println("UPDATE Query: " + query);
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DELETE
    public void deleteTicket(Ticket ticket) {
        try {
            String query = "DELETE FROM tickets WHERE ticketId = " + ticket.getTicketId();
            Statement statement = DBConnection.getConnection().createStatement();
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
