<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Feedback</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: #333;
        }

        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
            width: 90%;
            max-width: 600px;
        }

        h1 {
            color: #4a6fa5;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-family: inherit;
            font-size: 15px;
            transition: border 0.3s;
        }

        input[type="text"]:focus, textarea:focus {
            border-color: #4a6fa5;
            outline: none;
            box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.1);
        }

        .btn {
            background-color: #4a6fa5;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 12px 20px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%;
        }

        .btn:hover {
            background-color: #395d8f;
        }

        .view-feedback {
            text-align: center;
            margin-top: 20px;
        }

        .view-feedback a {
            display: inline-block;
            background-color: #f5f7fa;
            color: #4a6fa5;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
            border: 1px solid #4a6fa5;
            font-weight: 500;
            transition: all 0.3s;
        }

        .view-feedback a:hover {
            background-color: #eef0f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Feedback</h1>

        <form action="SaveServlet" method="post" onsubmit="return validateDate();">
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" required />
            </div>

            <div class="form-group">
                <label for="eventName">Event Name:</label>
                <input type="text" id="eventName" name="eventName" required />
            </div>

            <div class="form-group">
                <label for="feedbackDate">Feedback Date (YYYY-MM-DD):</label>
                <input type="text" id="feedbackDate" name="feedbackDate" placeholder="YYYY-MM-DD" required />
            </div>

            <div class="form-group">
                <label for="feedbackComment">Feedback Comment:</label>
                <textarea id="feedbackComment" name="feedbackComment" rows="4" required></textarea>
            </div>

            <button type="submit" class="btn">Save Feedback</button>
        </form>

        <div class="view-feedback">
            <a href="ViewServlet">View Feedbacks</a>
        </div>
    </div>

    <script>
        function validateDate() {
            const dateInput = document.getElementById("feedbackDate").value.trim();
            const datePattern = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD

            if (!datePattern.test(dateInput)) {
                alert("Please enter the date in YYYY-MM-DD format.");
                return false; // prevent form submission
            }

            return true;
        }
    </script>
</body>
</html>
