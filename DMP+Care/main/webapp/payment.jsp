<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DMP+Care Payment Portal</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- Alpine.js -->
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script>
	function validatePaymentForm() {
	    // Example: Validate card number length (without spaces)
	    const cardNumber = document.getElementById('cardNumber').value.replace(/\s+/g, '');
	    if (cardNumber.length !== 16 || !/^\d+$/.test(cardNumber)) {
	        alert('Card Number must be exactly 16 digits.');
	        return false; // prevent form submission
	    }
	
	    // Validate amount is positive number
	    const amount = document.getElementById('amount').value.trim();
	    if (isNaN(amount) || Number(amount) <= 0) {
	        alert('Please enter a valid positive amount.');
	        return false;
	    }
	
	    // Validate email format using regex
	    const email = document.getElementById('email').value.trim();
	    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (!emailPattern.test(email)) {
	        alert('Please enter a valid email address.');
	        return false;
	    }

    // Validate Full Name is not empty and only letters and spaces
    const fullName = document.getElementById('fullName').value.trim();
    if (!/^[A-Za-z\s]+$/.test(fullName)) {
        alert('Full Name can contain letters and spaces only.');
        return false;
    }

    // Validate service selected
    const service = document.getElementById('service').value;
    if (!service) {
        alert('Please select a service type.');
        return false;
    }

    // All validations passed
    return true;
}
</script>
</head>
<body >
<body class="bg-gray-100 m-0 p-0">
<!-- Navigation Bar -->
<nav class="bbg-white shadow-md fixed top-0 w-full z-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <!-- Logo & Name -->
      <div class="flex items-center space-x-2">
        <i class="fas fa-heartbeat text-red-500 text-2xl"></i>
        <span class="text-xl font-bold text-gray-700">DMP<span class="text-red-500">+care</span></span>
      </div>

      <!-- Desktop Menu -->
      <div class="hidden md:flex items-center space-x-6">
        <a href="register.jsp" class="text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
        <a href="Service.jsp" class="text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>
        
        <!-- User Dropdown -->
        <div x-data="{ open: false }" class="relative">
          <button @click="open = !open" class="flex items-center space-x-2 bg-gray-100 hover:bg-gray-200 px-4 py-2 rounded-lg">
            <i class="fas fa-user-circle text-xl text-gray-700"></i>
            <span class="text-gray-700 font-medium">Hello,  <span class="text-red-500"><%= session.getAttribute("username") %></span>
            </span>
            </button>
           
          </div>
        </div>
      </div>
       
      </div>

      <!-- Mobile Menu Button -->
      <div class="md:hidden flex items-center">
        <button id="mobile-menu-button" class="text-gray-700 focus:outline-none">
          <i class="fas fa-bars text-2xl"></i>
        </button>
      </div>
 
  <!-- Mobile Menu (hidden by default) -->
  <div id="mobile-menu" class="md:hidden hidden px-4 pb-4">
    <a href="register.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
    <a href="Service.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>
    <a href="Login.jsp" class="block py-2 text-white bg-red-500 hover:bg-red-600 text-center rounded-md"><i class="fas fa-sign-in-alt mr-1"></i>Login</a>
  </div>

  <!-- Script to toggle mobile menu -->
  <script>
    const btn = document.getElementById('mobile-menu-button');
    const menu = document.getElementById('mobile-menu');

    btn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  </script>
</nav>
	
	<%
  // Check login session (Pre-condition)
  if (session.getAttribute("username") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<div class="max-w-lg mx-auto mt-12 bg-white shadow-lg rounded-lg p-8" x-data="{ loading: false }">
    <h2 class="text-2xl font-semibold text-center text-purple-700 mb-6">
        <i class="fas fa-credit-card text-red-500"></i> DMP<span class="text-red-500">+Care</span> Payment
    </h2>

    <!-- Payment Form -->
    <form action="${pageContext.request.contextPath}/AddPayment" method="post" @submit="loading = true" onsubmit="return validatePaymentForm()" class="space-y-4">

        <!-- Full Name -->
        <div>
            <label for="fullName" class="block text-gray-700 font-medium mb-1">Full Name</label>
            <input type="text" id="fullName" name="fullName" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-purple-500"
                   placeholder="e.g., John Doe">
        </div>

        <!-- Email -->
        <div>
            <label for="email" class="block text-gray-700 font-medium mb-1">Email</label>
            <input type="email" id="email" name="email" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-purple-500"
                   placeholder="e.g., john@example.com">
        </div>

        <!-- Service Type -->
        <div>
            <label for="service" class="block text-gray-700 font-medium mb-1">Service Type</label>
            <select id="service" name="service" required
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-purple-500">
                <option value="">-- Select --</option>
                <option value="consultation">Consultation</option>
                <option value="therapy">Physical Therapy</option>
                <option value="lab">Lab Test</option>
                <option value="surgery">Surgery</option>
                <option value="other">Other</option>
            </select>
        </div>

        <!-- Amount -->
        <div>
            <label for="amount" class="block text-gray-700 font-medium mb-1">Amount (LKR)</label>
            <input type="text"  id="amount" name="amount" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-purple-500"
                   placeholder="e.g., 2500.00">
        </div>

        <!-- Card Number -->
        <div>
            <label for="cardNumber" class="block text-gray-700 font-medium mb-1">Card Number</label>
            <input type="text" id="cardNumber" name="cardNumber" maxlength="19" required
                   class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-purple-500"
                   placeholder="1234 5678 9012 3456">
        </div>

        <!-- Submit -->
        <div class="text-end pt-4">
            <button type="submit"
                    class="bg-purple-600 hover:bg-purple-700 text-white font-semibold px-6 py-2 rounded transition duration-200 disabled:opacity-50"
                    :disabled="loading">
                <template x-if="!loading">
                    <span><i class="fas fa-paper-plane mr-2"></i>Pay Now</span>
                </template>
                <template x-if="loading">
                    <span><i class="fas fa-spinner fa-spin mr-2"></i>Processing...</span>
                </template>
            </button>
        </div>
    </form>
</div>
 <!-- Footer Section -->
<footer class="bg-gray-800 text-white py-10">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">
      
      <!-- Quick Links -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
        <ul class="space-y-2">
          <li><a href="#" class="hover:underline">Terms & Conditions</a></li>
          <li><a href="#" class="hover:underline">Privacy Policy</a></li>
          <li><a href="#" class="hover:underline">Feedback</a></li>
        </ul>
      </div>
  
      <!-- Contact Info -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Contact Us</h3>
        <p><i class="fas fa-envelope mr-2"></i>dmpcare@university.edu</p>
        <p><i class="fas fa-phone-alt mr-2"></i>+94 71 234 5678</p>
      </div>
  
      <!-- Disclaimer -->
      <div>
        <h3 class="text-lg font-semibold mb-4">Disclaimer</h3>
        <p class="text-sm text-gray-300">
          This system is part of a student project and not for real healthcare use.
        </p>
      </div>
    </div>
  
    <!-- Bottom Line -->
    <div class="mt-10 border-t border-gray-700 pt-4 text-center text-sm text-gray-400">
      © 2025 DMP+care. All rights reserved.
    </div>
  </footer>
  
</body>
</html>
    
</body>
</html>
