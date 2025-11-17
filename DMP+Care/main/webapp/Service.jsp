<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Make Appointment – DMP+care</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<!-- Navigation Bar -->
<nav class="bg-white shadow-md fixed w-full z-50">
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
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>
        
        <!-- User Dropdown -->
        <div x-data="{ open: false }" class="relative">
          <button @click="open = !open" class="flex items-center space-x-2 bg-gray-100 hover:bg-gray-200 px-4 py-2 rounded-lg">
            <i class="fas fa-user-circle text-xl text-gray-700"></i>
            <span class="text-gray-700 font-medium">Hello,  <span class="text-red-500"><%= session.getAttribute("username") %></span>
            </span>
            
           
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
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
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

<section class="pt-24 pb-16 px-6 md:px-16 bg-white">
    <div class="text-center mb-12">
      <h2 class="text-3xl font-bold text-gray-800">
        <i class="fas fa-hand-holding-medical text-red-500 mr-2"></i>Our Services
      </h2>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
      
      <!-- Online Appointments -->
      <a href="appointment.jsp" class="bg-white shadow rounded-lg p-6 text-center hover:shadow-lg transition block">
        <i class="fas fa-calendar-check text-3xl text-blue-500 mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800">Online Appointments</h3>
        <p class="text-sm text-gray-600 mt-2">Easily schedule and manage appointments with doctors online.</p>
      </a>

      <!-- Raise Tickets -->
      <a href="raiseTicket.jsp" class="bg-white shadow rounded-lg p-6 text-center hover:shadow-lg transition block">
        <i class="fas fa-ticket-alt text-3xl text-yellow-500 mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800">Raise Tickets</h3>
        <p class="text-sm text-gray-600 mt-2">Report issues or concerns and our support team will handle them promptly.</p>
      </a>

      <!-- Give Feedback -->
      <a href="index.jsp" class="bg-white shadow rounded-lg p-6 text-center hover:shadow-lg transition block">
        <i class="fas fa-comment-dots text-3xl text-green-500 mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800">Give Feedback</h3>
        <p class="text-sm text-gray-600 mt-2">Help us improve by sharing your experience and suggestions.</p>
      </a>

      <!-- Payment -->
      <a href="payment.jsp" class="bg-white shadow rounded-lg p-6 text-center hover:shadow-lg transition block">
        <i class="fas fa-credit-card text-3xl text-purple-500 mb-4"></i>
        <h3 class="text-lg font-semibold text-gray-800">Payment</h3>
        <p class="text-sm text-gray-600 mt-2">Quick and secure payment options for medical bills and services.</p>
      </a>

    </div>
  </section>
  
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
    
	