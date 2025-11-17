<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dmpcare.model.Customer" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DMP +care</title>
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>
<body>

<!-- Navigation Bar -->
<nav class="bg-white shadow-md fixed w-full z-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <!-- Logo -->
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
            <i class="fas fa-chevron-down text-sm ml-1"></i>
          </button>
          <div x-show="open" @click.outside="open = false" class="absolute right-0 mt-2 w-48 bg-white shadow-lg rounded-lg z-50 py-2">
            
            <a href="profile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100"><i class="fas fa-user mr-2"></i>Profile</a>
            <a href="register.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a>
            <a href="logout.jsp" class="block px-4 py-2 text-red-500 hover:bg-gray-100"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
          </div>
        </div>
      </div>

      <!-- Mobile Menu Toggle -->
      <div class="md:hidden flex items-center">
        <button id="mobile-menu-button" class="text-gray-700 focus:outline-none">
          <i class="fas fa-bars text-2xl"></i>
        </button>
      </div>
    </div>
  </div>

  <!-- Mobile Menu -->
  <div id="mobile-menu" class="md:hidden hidden px-4 pb-4">
    <a href="register.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
    <a href="Service.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>
    <a href="logout.jsp" class="block py-2 text-white bg-red-500 hover:bg-red-600 text-center rounded-md"><i class="fas fa-sign-out-alt mr-1"></i>Logout</a>
  </div>

  <script>
    const btn = document.getElementById('mobile-menu-button');
    const menu = document.getElementById('mobile-menu');
    btn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  </script>
</nav>
    <!-- Hero Section with Animation -->
<section class="bg-blue-50 pt-24 pb-16" x-data="{ visible: false }" x-init="setTimeout(() => visible = true, 300)">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row items-center justify-between">
      
      <!-- Left Content -->
      <div class="md:w-1/2 text-center md:text-left space-y-6">
  
        <h1 
          class="text-4xl sm:text-5xl font-extrabold text-gray-800 leading-tight transform opacity-0 transition duration-700"
          :class="{ 'opacity-100 translate-x-0': visible, '-translate-x-6': !visible }"
        >
          Your <span class="text-red-500">Health</span>, Our <span class="text-blue-500">Priority</span>
        </h1>
  
        <p 
          class="text-gray-600 text-lg transform opacity-0 transition duration-700 delay-200"
          :class="{ 'opacity-100 translate-x-0': visible, '-translate-x-6': !visible }"
        >
          Welcome to <strong>DMP+care</strong>, your trusted online healthcare assistant. Chat with experts, book appointments, or get instant support — all in one place.
        </p>
  
        <div 
          class="flex flex-col sm:flex-row gap-4 justify-center md:justify-start transform opacity-0 transition duration-700 delay-400"
          :class="{ 'opacity-100 translate-y-0': visible, 'translate-y-4': !visible }"
        >
          <a href="appointment.jsp" class="bg-red-500 hover:bg-red-600 text-white px-6 py-3 rounded-lg text-lg shadow">
            <i class="fas fa-calendar-check mr-2"></i>Book Appointment
          </a>
          <a href="#" class="border border-red-500 text-red-500 hover:bg-red-100 px-6 py-3 rounded-lg text-lg shadow">
            <i class="fas fa-comments mr-2"></i>Live Chat
          </a>
        </div>
      </div>
  
      <!-- Right Icon Panel with Animation -->
      <div 
        class="md:w-1/2 mt-10 md:mt-0 text-center transform opacity-0 transition duration-700 delay-500"
        :class="{ 'opacity-100 translate-y-0': visible, 'translate-y-6': !visible }"
      >
        <i class="fas fa-user-md text-blue-500 text-[120px] sm:text-[160px] md:text-[200px]"></i>
      </div>
    </div>
  </section>
  
<section class="bg-white py-20" x-data="{ visible: false }" x-init="setTimeout(() => visible = true, 300)">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">

    <!-- Title -->
    <h2 
      class="text-3xl sm:text-4xl font-bold text-gray-800 mb-12 opacity-0 transition duration-700"
      :class="{ 'opacity-100 translate-y-0': visible, '-translate-y-4': !visible }"
    >
      <i class="fas fa-hand-holding-medical text-red-500 mr-2"></i>Our Services
    </h2>

   
    <!-- Grid container -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
  <template x-for="(service, index) in [
    { icon: 'fas fa-calendar-check', title: 'Online Appointments', desc: 'Easily schedule and manage appointments with doctors online.', color: 'text-blue-500',href: 'appointment.jsp' },
    { icon: 'fas fa-ticket-alt', title: 'Raise Tickets', desc: 'Report issues or concerns and our support team will handle them promptly.', color: 'text-yellow-500', href: 'raise-ticket.jsp' },
    { icon: 'fas fa-comment-dots', title: 'Give Feedback', desc: 'Help us improve by sharing your experience and suggestions.', color: 'text-green-500', href: 'index.jsp' },
    { icon: 'fas fa-credit-card', title: 'Payment', desc: 'Quick and secure payment options for medical bills and services.', color: 'text-purple-500', href: 'payment.jsp' }
  ]" :key="index">

    <div class="bg-white shadow-md rounded-lg p-5 hover:shadow-lg transition">
      <div class="flex items-center space-x-4">
        <a :href="service.href" class="block bg-white shadow-md rounded-lg p-5 hover:shadow-lg transition">
  <div class="flex items-center space-x-4">
    <i :class="`${service.icon} text-3xl ${service.color}`"></i>
    <div>
      <h3 class="font-semibold text-lg text-gray-800" x-text="service.title"></h3>
      <p class="text-sm text-gray-500" x-text="service.desc"></p>
    </div>
  </div>
</a>   
    </div>

  </template>
    </div>
  </div>
</section>


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
    