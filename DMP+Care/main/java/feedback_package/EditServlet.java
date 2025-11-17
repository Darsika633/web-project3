package feedback_package;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
            throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  

        String sid = request.getParameter("id");  
        int id = Integer.parseInt(sid);  
        feedback e = feedbackDao.getFeedbackById(id);

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Update Feedback</title>");
        out.println("<style>");
        out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f5f7fa; margin: 0; padding: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 100vh; color: #333; }");
        out.println(".container { background-color: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); padding: 30px; width: 90%; max-width: 600px; }");
        out.println("h1 { color: #4a6fa5; text-align: center; margin-bottom: 30px; font-weight: 600; }");
        out.println(".form-group { margin-bottom: 20px; }");
        out.println("label { display: block; margin-bottom: 8px; font-weight: 500; color: #555; }");
        out.println("input[type='text'], textarea { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; font-family: inherit; font-size: 15px; }");
        out.println(".btn { background-color: #4a6fa5; color: white; border: none; border-radius: 6px; padding: 12px 20px; cursor: pointer; font-weight: 600; font-size: 16px; transition: background-color 0.3s; width: 100%; }");
        out.println(".btn:hover { background-color: #395d8f; }");
        out.println(".back-link { text-align: center; margin-top: 20px; }");
        out.println(".back-link a { display: inline-block; background-color: #f5f7fa; color: #4a6fa5; text-decoration: none; padding: 10px 20px; border-radius: 6px; border: 1px solid #4a6fa5; font-weight: 500; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>Update Feedback</h1>");

        out.println("<form action='EditServlet2' method='post' onsubmit='return validateDate();'>");
        out.println("<input type='hidden' name='id' value='" + e.getId() + "'/>");

        out.println("<div class='form-group'>");
        out.println("<label for='customerName'>Customer Name:</label>");
        out.println("<input type='text' id='customerName' name='customerName' value='" + e.getCustomerName() + "' required />");
        out.println("</div>");

        out.println("<div class='form-group'>");
        out.println("<label for='eventName'>Event Name:</label>");
        out.println("<input type='text' id='eventName' name='eventName' value='" + e.getEventName() + "' required />");
        out.println("</div>");

        out.println("<div class='form-group'>");
        out.println("<label for='feedbackDate'>Feedback Date (YYYY-MM-DD):</label>");
        out.println("<input type='text' id='feedbackDate' name='feedbackDate' value='" + e.getFeedbackDate() + "' placeholder='YYYY-MM-DD' required />");
        out.println("</div>");

        out.println("<div class='form-group'>");
        out.println("<label for='feedbackComment'>Feedback Comment:</label>");
        out.println("<textarea id='feedbackComment' name='feedbackComment' rows='4' required>" + e.getFeedbackComment() + "</textarea>");
        out.println("</div>");

        out.println("<button type='submit' class='btn'>Update & Save</button>");
        out.println("</form>");

        out.println("<div class='back-link'>");
        out.println("<a href='ViewServlet'>Back to List</a>");
        out.println("</div>");
        out.println("</div>");

        // ✅ JavaScript validation for date format
        out.println("<script>");
        out.println("function validateDate() {");
        out.println("    var dateInput = document.getElementById('feedbackDate').value.trim();");
        out.println("    var datePattern = /^\\d{4}-\\d{2}-\\d{2}$/;");
        out.println("    if (!datePattern.test(dateInput)) {");
        out.println("        alert('Please enter the date in YYYY-MM-DD format.');");
        out.println("        return false;");
        out.println("    }");
        out.println("    return true;");
        out.println("}");
        out.println("</script>");

        out.println("</body>");
        out.println("</html>");

        out.close();  
    }
}
