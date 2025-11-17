package feedback_package;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

@WebServlet("/EditServlet2")
public class EditServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   
              throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
          
        String sid = request.getParameter("id");  
        int id = Integer.parseInt(sid);  
        String customerName = request.getParameter("customerName");  
        String eventName = request.getParameter("eventName");  
        String feedbackDate = request.getParameter("feedbackDate");  
        String feedbackComment = request.getParameter("feedbackComment");  
          
        feedback e = new feedback();  
        e.setId(id);  
        e.setCustomerName(customerName);  
        e.setEventName(eventName);  
        e.setFeedbackDate(feedbackDate);  
        e.setFeedbackComment(feedbackComment);  
          
        int status = feedbackDao.update(e);  
        if(status > 0) {  
            response.sendRedirect("ViewServlet");  
        } else {  
            out.println("Sorry! unable to update record");  
        }  
          
        out.close();  
    }
}
