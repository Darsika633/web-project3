<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.dmpcare.model.Appointment" %>
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Edit Appointment – DMP+care</title>
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
        <a href="Service.jsp" class="text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
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
	
<section class="bg-gray-100 min-h-screen flex items-center justify-center py-12">
  <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-2xl">
    <div class="text-center mb-6">
      <h2 class="text-3xl font-bold text-gray-800">
        <i class="fas fa-calendar-check text-red-500 mr-2"></i>Update Your Appointment
      </h2>
    </div>
<form action="${pageContext.request.contextPath}/UpdateAppointment" method="POST" class="space-y-5">
      <input type="hidden" name="id" value="${param.id}" />
      
      <!-- Full Name -->
      <div>
        <label for="name" class="block text-sm font-semibold mb-1">Full Name</label>
        <input type="text" id="name" name="name" value = "${param.name}"
          class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
      </div>

      <!-- Phone -->
      <div>
        <label for="phone" class="block text-sm font-semibold mb-1">Phone</label>
        <input type="tel" id="phone" name="phone" value = "${param.phone}"
          class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
      </div>

      <!-- Patient Type -->
      <div>
        <label for="patientType" class="block text-sm font-semibold mb-1">Patient Type</label>
        <select name="patientType" class="..." required>
		  <option value="">-- Select Type --</option>
		  <option value="Normal" ${param.patientType == 'Normal' ? 'selected' : ''}>Normal</option>
		  <option value="Emergency" ${param.patientType == 'Emergency' ? 'selected' : ''}>Emergency</option>
		</select>
		
      </div>
	
	
	<!-- Health Care Provider-->
      <div>
        <label for="doctor" class="block text-sm font-semibold mb-1">Doctor</label>
        <input type="text" id="name" name="doctor" value = "${param.doctor}"
          class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
      </div>
	
      <!-- Date and Time -->
      <div class="flex flex-col sm:flex-row gap-4">
        <div class="flex-1">
          <label for="date" class="block text-sm font-semibold mb-1">Date</label>
          <input type="date" id="date" name="date" value = "${param.date}"
            class="w-full border border-gray-300 px-4 py-2 rounded-lg" />
        </div>
        
        <div class="flex-1">
          <label for="time" class="block text-sm font-semibold mb-1">Time</label>
          <input type="time" id="time" name="time" value = "${param.time}"
            class="w-full border border-gray-300 px-4 py-2 rounded-lg" />
        </div>
      </div>

      <!-- Reason -->
      <div>
        <label for="reason" class="block text-sm font-semibold mb-1">Reason / Message</label>
        <textarea id="reason" name="reason" rows="3"
          class="w-full border border-gray-300 px-4 py-2 rounded-lg"
          >${param.reason}</textarea>
      </div>

      <!-- Submit -->
      <div class="text-right pt-4">
        <button type="submit"
          class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-lg text-sm shadow">
          <i class="fas fa-check-circle mr-2"></i>Update
        </button>
      </div>
    </form>
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
    



</body>
</html>