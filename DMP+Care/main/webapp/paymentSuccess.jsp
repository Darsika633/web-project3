<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Successful</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-green-50 min-h-screen flex items-center justify-center">

    <div class="bg-white p-8 rounded shadow-lg max-w-md text-center">
        <div class="text-green-600 mb-4">
            <i class="fas fa-check-circle text-6xl"></i>
        </div>
        <h1 class="text-2xl font-bold text-green-700 mb-2">Payment Successful</h1>
        <p class="text-gray-600 mb-4">Thank you for your payment. Your transaction has been completed successfully.</p>
        
        <!-- Optional: Display a transaction summary -->
        <div class="bg-green-100 text-green-800 text-sm p-4 rounded mb-4">
          <p><strong>Transaction ID:</strong> DMP${id}</p>
		  <p><strong>Amount:</strong> LKR ${amount}</p>
          
        </div>

        <a href="paymentTable.jsp" class="inline-block bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700 transition">
            <i class="fas fa-home mr-2"></i>Go to Payment
        </a>
    </div>

</body>
</html>
