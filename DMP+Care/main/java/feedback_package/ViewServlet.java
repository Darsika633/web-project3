package feedback_package;

import java.io.IOException;  
import java.io.PrintWriter;  
import java.util.List;  

import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
            throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Feedback List</title>");
        out.println("<style>");
        out.println("* { margin: 0; padding: 0; box-sizing: border-box; }");
        out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f5f7fa; color: #333; line-height: 1.6; }");
        out.println(".container { width: 90%; max-width: 1200px; margin: 20px auto; padding: 20px; }");
        out.println("h1 { color: #4a6fa5; text-align: center; margin: 20px 0; font-weight: 600; }");
        
        // Search form styling
        out.println(".search-container { display: flex; justify-content: center; margin-bottom: 30px; }");
        out.println(".search-form { display: flex; width: 100%; max-width: 500px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); border-radius: 8px; overflow: hidden; }");
        out.println(".search-form input[type='text'] { flex-grow: 1; padding: 12px 15px; border: none; font-size: 16px; }");
        out.println(".search-form input[type='submit'] { background-color: #4a6fa5; color: white; border: none; padding: 0 25px; cursor: pointer; font-weight: 500; transition: background-color 0.3s; }");
        out.println(".search-form input[type='submit']:hover { background-color: #395d8f; }");
        
        // Table styling
        out.println("table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 15px rgba(0,0,0,0.1); margin-bottom: 30px; }");
        out.println("th { background-color: #4a6fa5; color: white; padding: 15px; text-align: left; font-weight: 500; }");
        out.println("td { padding: 15px; border-bottom: 1px solid #eee; }");
        out.println("tr:last-child td { border-bottom: none; }");
        out.println("tr:hover { background-color: #f8f9fb; }");
        
        // Button styling
        out.println(".action-btn { display: inline-block; padding: 8px 12px; border-radius: 4px; text-decoration: none; font-weight: 500; text-align: center; transition: all 0.3s; }");
        out.println(".edit-btn { background-color: #4a6fa5; color: white; }");
        out.println(".edit-btn:hover { background-color: #395d8f; }");
        out.println(".delete-btn { background-color: #e74c3c; color: white; }");
        out.println(".delete-btn:hover { background-color: #c0392b; }");
        
        // Add New Feedback button
        out.println(".add-new { display: block; width: 200px; margin: 0 auto; background-color: #4a6fa5; color: white; text-align: center; padding: 12px 20px; border-radius: 6px; text-decoration: none; font-weight: 600; box-shadow: 0 2px 10px rgba(0,0,0,0.1); transition: all 0.3s; }");
        out.println(".add-new:hover { background-color: #395d8f; transform: translateY(-2px); box-shadow: 0 4px 15px rgba(0,0,0,0.15); }");
        
        // Responsive styling
        out.println("@media (max-width: 768px) {");
        out.println("  .container { width: 95%; padding: 10px; }");
        out.println("  table { display: block; overflow-x: auto; }");
        out.println("  th, td { padding: 10px; }");
        out.println("}");
        
        // No results message
        out.println(".no-results { text-align: center; padding: 30px; background: white; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); }");
        
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h1>Feedback List</h1>");  

        // Search Form
        out.println("<div class='search-container'>");
        out.println("<form class='search-form' action='ViewServlet' method='get'>");
        out.println("<input type='text' name='search' placeholder='Search by customer name...' value='" + 
                    (request.getParameter("search") != null ? request.getParameter("search") : "") + "'/>");
        out.println("<input type='submit' value='Search'/>");
        out.println("</form>");
        out.println("</div>");
        
        // Get search parameter
        String searchQuery = request.getParameter("search");
        
        List<feedback> list;
        
        // If searchQuery is present, perform a search, else display all records
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            list = feedbackDao.searchFeedbackByName(searchQuery);
        } else {
            list = feedbackDao.getAllFeedbacks();
        }

        if (list.isEmpty()) {
            out.println("<div class='no-results'>No feedback records found</div>");
        } else {
            out.println("<table>");  
            out.println("<tr><th>ID</th><th>Customer Name</th><th>Event Name</th><th>Date</th><th>Comment</th><th>Edit</th><th>Delete</th></tr>");  
            for(feedback e : list) {  
                out.println("<tr>");
                out.println("<td>" + e.getId() + "</td>");
                out.println("<td>" + e.getCustomerName() + "</td>");
                out.println("<td>" + e.getEventName() + "</td>");
                out.println("<td>" + e.getFeedbackDate() + "</td>");
                out.println("<td>" + e.getFeedbackComment() + "</td>");
                out.println("<td><a class='action-btn edit-btn' href='EditServlet?id=" + e.getId() + "'>Edit</a></td>");
                out.println("<td><a class='action-btn delete-btn' href='DeleteServlet?id=" + e.getId() + "'>Delete</a></td>");
                out.println("</tr>");
            }  
            out.println("</table>");
        }

        out.println("<a class='add-new' href='index.jsp'>Add New Feedback</a>");  
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
        out.close();  
    }  
}
