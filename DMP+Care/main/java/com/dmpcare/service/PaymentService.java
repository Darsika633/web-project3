package com.dmpcare.service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


import com.dmpcare.model.Payment;
import com.dmpcare.utils.DBConnect;

public class PaymentService {

    // Save payment to DB
    public void savePayment(Payment payment) {
        try {
            String query = "INSERT INTO payment (fullName, email, service, amount, cardNumber) VALUES (" +
                    "'" + payment.getFullName() + "'," +
                    "'" + payment.getEmail() + "'," +
                    "'" + payment.getService() + "'," +
                    payment.getAmount() + "," +
                    "'" + payment.getCardNumber() + "')";
            
            Statement statement = DBConnect.getConnection().createStatement();
            statement.executeUpdate(query);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Optional: Get all payments
    public ArrayList<Payment> getList() {
        try {
            ArrayList<Payment> paymentList = new ArrayList<>();
            String query = "SELECT * FROM payment";
            Statement statement = DBConnect.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                Payment payment = new Payment();
            	payment.setId(rs.getInt("id"));  // ✅ add this line at the top before setName()
                payment.setFullName(rs.getString("fullName"));
                payment.setEmail(rs.getString("email"));
                payment.setService(rs.getString("service"));
                payment.setAmount(rs.getDouble("amount"));
                payment.setCardNumber(rs.getString("cardNumber"));

                paymentList.add(payment);
            }

            return paymentList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    //update
    public void updatePayment(Payment payment) {
        try {
            String query = "UPDATE payment SET fullName = '" + payment.getFullName() + "', " +
                           "email = '" + payment.getEmail() + "', " +
                           "service = '" + payment.getService() + "', " +
                           "amount = " + payment.getAmount() + ", " +
                           "cardNumber = '" + payment.getCardNumber() + "' " +
                           "WHERE id = " + payment.getId();

            Statement stmt = DBConnect.getConnection().createStatement();
            stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // delete
    public void deletePayment(Payment pay) {
		try {
			String query = "Delete from payment where id = '"+pay.getId()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
