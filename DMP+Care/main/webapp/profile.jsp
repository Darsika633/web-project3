<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dmpcare.model.Customer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DMP+care – Profile</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>
<body class="bg-gray-100 h-full">

<!-- Navbar -->
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
            <span class="text-gray-700 font-medium">Hello, <span class="text-red-500"><%= session.getAttribute("username") %></span></span>
            <i class="fas fa-chevron-down text-sm ml-1"></i>
          </button>
          <div x-show="open" @click.outside="open = false" class="absolute right-0 mt-2 w-48 bg-white shadow-lg rounded-lg z-50 py-2">
            <a href="profile.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100"><i class="fas fa-user mr-2"></i>Profile</a>
            <a href="register.jsp" class="block px-4 py-2 text-gray-700 hover:bg-gray-100"><i class="fas fa-tachometer-alt mr-2"></i>Dashboard</a>
            <a href="logout.jsp" class="block px-4 py-2 text-red-500 hover:bg-gray-100"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
          </div>
        </div>
      </div>

      <!-- Mobile Menu Button -->
      <div class="md:hidden flex items-center">
        <button id="mobile-menu-button" class="text-gray-700 focus:outline-none">
          <i class="fas fa-bars text-2xl"></i>
        </button>
      </div>
    </div>
  </div>
</nav>

<script>
  const btn = document.getElementById('mobile-menu-button');
  const menu = document.getElementById('mobile-menu');
  btn?.addEventListener('click', () => {
    menu?.classList.toggle('hidden');
  });
</script>

<!-- Profile Section -->
<main class="pt-24 flex justify-center">
  <div class="bg-white shadow-xl rounded-xl p-10 w-full max-w-lg space-y-6">
    <div class="text-center">
      <i class="fas fa-heartbeat text-red-500 text-4xl mb-2"></i>
      <h1 class="text-2xl font-bold text-gray-800">DMP+care My Profile</h1>
    </div>

    <c:set var="cus" value="${Customer}" />
    
    <!-- Name -->
    <div>
      <label class="block text-sm font-medium mb-1" for="name">Name</label>
      <input type="text" id="name" name="name" value="${cus.name}"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
    </div>

    <!-- Email -->
    <div>
      <label class="block text-sm font-medium mb-1" for="email">Email Address</label>
      <input type="email" id="email" name="email" value="${cus.email}"
             class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
    </div>

    <!-- Password -->
    <div x-data="{ show: false }" class="relative">
      <label class="block text-sm font-medium mb-1" for="password">Password</label>
      <input :type="show ? 'text' : 'password'" id="password" name="password" value="${cus.password}"
             class="w-full px-4 py-2 pr-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
      <button type="button" class="absolute top-9 right-3 text-gray-400 text-sm" @click="show = !show">
        <i :class="show ? 'fas fa-eye-slash' : 'fas fa-eye'"></i>
      </button>
    </div>
  </div>
</main>

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