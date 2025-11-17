
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment Table</title>

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100">
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
	

<section class="p-12">
  <div class="max-w-7xl mx-auto bg-white p-6 rounded-lg shadow">
    <h1 class="text-2xl font-bold text-gray-800 mb-6">
      <i class="fas fa-table text-purple-600 mr-2"></i>Payment Table
    </h1>

    <table class="min-w-full table-auto text-sm text-left">
      <thead class="bg-gray-100 text-gray-700">
        <tr>
          <th class="px-4 py-2">ID</th>
          <th class="px-4 py-2">Full Name</th>
          <th class="px-4 py-2">Email</th>
          <th class="px-4 py-2">Service</th>
          <th class="px-4 py-2">Amount (LKR)</th>
          <th class="px-4 py-2">Card Number</th>
          <th class="px-4 py-2">Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="pay" items="${payment}">
          <tr class="border-b hover:bg-gray-50">
            <td class="px-4 py-2">${pay.id}</td>
            <td class="px-4 py-2">${pay.fullName}</td>
            <td class="px-4 py-2">${pay.email}</td>
            <td class="px-4 py-2">${pay.service}</td>
            <td class="px-4 py-2">LKR ${pay.amount}</td>
            <td class="px-4 py-2">${pay.cardNumber}</td>
            <td class="px-4 py-2">
            
            <form action="editPayment.jsp" method="post">
			  <input type="hidden" name="id" value="${pay.id}">
			  <input type="hidden" name="fullName" value="${pay.fullName}">
			  <input type="hidden" name="email" value="${pay.email}">
			  <input type="hidden" name="service" value="${pay.service}">
			  <input type="hidden" name="amount" value="${pay.amount}">
			  <input type="hidden" name="cardNumber" value="${pay.cardNumber}">
			  <button type="submit"
			     class="bg-yellow-400 text-white px-3 py-1 rounded hover:bg-yellow-500 text-xs inline-flex items-center">
			    <i class="fas fa-edit mr-1"></i>
			    Edit
			  </button>
			</form>
			                        
              <form action="DeletePayment" method="post">
                <input type="hidden" name="id" value="${pay.id}" />
                <button type="submit"
                  class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 text-xs inline-flex items-center">
                  <i class="fas fa-trash mr-1"></i>Delete
                </button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>

<!-- Optional navigation form -->
<form action="PaymentTable" method="post" class="flex justify-center mt-10">
  <button type="submit"
    class="bg-purple-600 hover:bg-purple-700 text-white text-lg px-6 py-3 rounded-lg shadow-md inline-flex items-center gap-2">
    <i class="fas fa-plus-circle"></i> View Payments
  </button>
</form>
 <!-- Footer Section -->
<footer class="bg-gray-900 text-white pt-12 mt-16">
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