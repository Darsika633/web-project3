package feedback_package;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Retrieve form parameters
        String customerName = request.getParameter("customerName");
        String eventName = request.getParameter("eventName");
        String feedbackDate = request.getParameter("feedbackDate");
        String feedbackComment = request.getParameter("feedbackComment");

        // Create a feedback object and set properties
        feedback e = new feedback();
        e.setCustomerName(customerName);
        e.setEventName(eventName);
        e.setFeedbackDate(feedbackDate);
        e.setFeedbackComment(feedbackComment);

        // Save the feedback using feedbackDao
        int status = feedbackDao.save(e);
        
        // Check if the save was successful
        if (status > 0) {
            // Redirect to ViewServlet to show the saved data
            response.sendRedirect("ViewServlet");
        } else {
            out.println("Sorry! Unable to save the record.");
        }

        out.close();
    }
}
