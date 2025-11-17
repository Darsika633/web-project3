<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DMP +care</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <!-- Include FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     <!-- Alpine.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>
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
        <a href="HomePage.jsp" class="text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
        <a href="login.jsp" class="text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
        <a href="#" class="text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>
        <a href="login.jsp" class="text-white bg-red-500 hover:bg-red-600 px-4 py-2 rounded-lg"><i class="fas fa-sign-in-alt mr-1"></i>Login</a>
      </div>

      <!-- Mobile Menu Button -->
      <div class="md:hidden flex items-center">
        <button id="mobile-menu-button" class="text-gray-700 focus:outline-none">
          <i class="fas fa-bars text-2xl"></i>
        </button>
      </div>
    </div>
  </div>

  <!-- Mobile Menu (hidden by default) -->
  <div id="mobile-menu" class="md:hidden hidden px-4 pb-4">
    <a href="HomePage.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
    <a href="login.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
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
        { icon: 'fas fa-calendar-check', title: 'Online Appointments', desc: 'Easily schedule and manage appointments with doctors online.', color: 'text-blue-500' },
        { icon: 'fas fa-ticket-alt', title: 'Raise Tickets', desc: 'Report issues or concerns and our support team will handle them promptly.', color: 'text-yellow-500' },
        { icon: 'fas fa-comment-dots', title: 'Give Feedback', desc: 'Help us improve by sharing your experience and suggestions.', color: 'text-green-500' },
        { icon: 'fas fa-credit-card', title: 'Payment', desc: 'Quick and secure payment options for medical bills and services.', color: 'text-purple-500' }
      ]" :key="index">
        
        <!-- Card -->
        <div 
          class="bg-gray-50 p-6 rounded-xl shadow-md transition-transform transform hover:scale-105 opacity-0"
          :class="{ 'opacity-100 translate-y-0': visible, 'translate-y-6': !visible }"
          :style="`transition-delay: ${index * 100}ms`"
        >
          <div class="text-5xl mb-4" :class="service.color">
            <i :class="service.icon"></i>
          </div>
          <h3 class="text-lg font-bold text-gray-800 mb-2" x-text="service.title"></h3>
          <p class="text-gray-600 text-sm leading-relaxed" x-text="service.desc"></p>
        </div>

      </template>

    </div>
  </div>
</section>


<!-- Login / Signup Promo Section -->
<section class="bg-blue-50 py-16" x-data="{ showSignup: false }">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row items-center justify-between gap-10">
  
      <!-- Left: Text & Benefits -->
      <div class="md:w-2/3 space-y-6">
        <h2 class="text-3xl sm:text-4xl font-bold text-gray-800">
          <i class="fas fa-user-plus text-red-500 mr-2"></i>Create Your DMP+care Account
        </h2>
        <p class="text-lg text-gray-700">
          Sign up to enjoy personalized healthcare support and faster service access.
        </p>
  
        <!-- Benefits List -->
        <ul class="space-y-3 text-left text-gray-700">
          <li class="flex items-start">
            <i class="fas fa-calendar-check text-blue-500 mr-3 mt-1"></i>
            Manage appointments easily from your dashboard.
          </li>
          <li class="flex items-start">
            <i class="fas fa-comments text-green-500 mr-3 mt-1"></i>
            Access your past chats and interactions.
          </li>
          <li class="flex items-start">
            <i class="fas fa-notes-medical text-purple-500 mr-3 mt-1"></i>
            Store and retrieve your medical queries securely.
          </li>
        </ul>
      </div>
  
      <!-- Right: Buttons -->
      <div class="md:w-1/3 flex flex-col items-center md:items-end gap-4 text-center md:text-right">
        <a href="login.jsp" class="bg-red-500 hover:bg-red-600 text-white px-6 py-3 rounded-lg text-lg shadow w-full md:w-auto">
          <i class="fas fa-sign-in-alt mr-2"></i>Login
        </a>
        <a href="signup.jsp" class="bg-white border border-red-500 text-red-500 hover:bg-red-100 px-6 py-3 rounded-lg text-lg shadow w-full md:w-auto">
          <i class="fas fa-user-plus mr-2"></i>Sign Up
        </a>
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
    