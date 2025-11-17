package feedback_package;

import java.util.*;  
import java.sql.*;

public class feedbackDao { // Class: Encapsulation of feedback-related DB operations

    // Method to establish a database connection
    public static Connection getConnection(){  // Abstraction: hides connection setup details
        Connection con = null;  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  // Abstraction: loading JDBC driver
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dmpcare?characterEncoding=utf8&useSSL=false","root", "123456");  
        } catch(Exception e) {
            System.out.println(e);
        }  
        return con;  
    }

    // Save a new Feedback record to the database
    public static int save(feedback e){  // Encapsulation: method receives a feedback object
        int status = 0;  
        try {  
            Connection con = feedbackDao.getConnection();  
            PreparedStatement ps = con.prepareStatement(  
                "insert into feedback(customerName, eventName, feedbackDate, feedbackComment) values (?, ?, ?, ?)");  
            // Abstraction: PreparedStatement abstracts SQL complexity
            ps.setString(1, e.getCustomerName());  // Encapsulation: access data via getter methods
            ps.setString(2, e.getEventName());  
            ps.setString(3, e.getFeedbackDate());  
            ps.setString(4, e.getFeedbackComment());  
              
            status = ps.executeUpdate();  
            con.close();  
        } catch(Exception ex) {
            ex.printStackTrace();
        }  
        return status;  
    }

    // Update an existing feedback record in the database
    public static int update(feedback e){  // Encapsulation: accepts feedback object as input
        int status = 0;  
        try {  
            Connection con = feedbackDao.getConnection();  
            PreparedStatement ps = con.prepareStatement(  
                "update feedback set customerName=?, eventName=?, feedbackDate=?, feedbackComment=? where id=?");  
            ps.setString(1, e.getCustomerName());  
            ps.setString(2, e.getEventName());  
            ps.setString(3, e.getFeedbackDate());  
            ps.setString(4, e.getFeedbackComment());  
            ps.setInt(5, e.getId());  
              
            status = ps.executeUpdate();  
            con.close();  
        } catch(Exception ex) {
            ex.printStackTrace();
        }  
        return status;  
    }

    // Delete a feedback record by ID
    public static int delete(int id){  // Abstraction: caller does not need to know SQL syntax
        int status = 0;  
        try {  
            Connection con = feedbackDao.getConnection();  
            PreparedStatement ps = con.prepareStatement("delete from feedback where id=?");  
            ps.setInt(1, id);  
            status = ps.executeUpdate();  
            con.close();  
        } catch(Exception e) {
            e.printStackTrace();
        }  
        return status;  
    }

    // Retrieve a feedback record by its ID
    public static feedback getFeedbackById(int id){  // Object creation & encapsulation
        feedback e = new feedback();  // Object creation
        try {  
            Connection con = feedbackDao.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from feedback where id=?");  
            ps.setInt(1, id);  
            ResultSet rs = ps.executeQuery();  
            if(rs.next()){  
                e.setId(rs.getInt(1));  // Encapsulation: set data using setter methods
                e.setCustomerName(rs.getString(2));  
                e.setEventName(rs.getString(3));  
                e.setFeedbackDate(rs.getString(4));  
                e.setFeedbackComment(rs.getString(5));  
            }  
            con.close();  
        } catch(Exception ex) {
            ex.printStackTrace();
        }  
        return e;  
    }

    // Retrieve all feedback records from the database
    public static List<feedback> getAllFeedbacks(){  // Abstraction and object manipulation
        List<feedback> list = new ArrayList<feedback>();  // Object creation
        try {  
            Connection con = feedbackDao.getConnection();  
            PreparedStatement ps = con.prepareStatement("select * from feedback");  
            ResultSet rs = ps.executeQuery();  
            while(rs.next()){  
                feedback e = new feedback();  // Object creation for each record
                e.setId(rs.getInt(1));  
                e.setCustomerName(rs.getString(2));  
                e.setEventName(rs.getString(3));  
                e.setFeedbackDate(rs.getString(4));  
                e.setFeedbackComment(rs.getString(5));  

                list.add(e);  // Encapsulation: objects added to list
            }  
            con.close();  
        } catch(Exception e) {
            e.printStackTrace();
        }  
        return list;  
    }

    // Search feedback by customer name
    public static List<feedback> searchFeedbackByName(String customerName) {  // Abstraction: hides SQL query logic
        List<feedback> list = new ArrayList<>();  // Object creation
        try {
            Connection con = feedbackDao.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM feedback WHERE customerName LIKE ?");
            ps.setString(1, "%" + customerName + "%"); // Enable partial matching with wildcard
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                feedback e = new feedback();  // Object creation for each result
                e.setId(rs.getInt(1));
                e.setCustomerName(rs.getString(2));
                e.setEventName(rs.getString(3));
                e.setFeedbackDate(rs.getString(4));
                e.setFeedbackComment(rs.getString(5));
                list.add(e);
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }
}
