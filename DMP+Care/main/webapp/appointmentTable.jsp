<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.dmpcare.model.Customer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="en" class="h-full" xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Appointment Table – DMP+care</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body >
<!-- Navigation Bar -->
<nav class="bg-white shadow-md fixed w-full z-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <!-- Logo & Name -->
      <div class="flex items-center space-x-2">
        <i class="fas fa-heartbeat text-red-500 text-2xl"></i>
        <span class="text-xl font-bold text-gray-700">DMP<span class="text-red-500">+care</span></span>
      </div>

```
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

  <!-- Mobile Menu Button -->
  <div class="md:hidden flex items-center">
    <button id="mobile-menu-button" class="text-gray-700 focus:outline-none">
      <i class="fas fa-bars text-2xl"></i>
    </button>
  </div>
</div>
```

  </div>

  <!-- Mobile Menu (hidden by default) -->

  <div id="mobile-menu" class="md:hidden hidden px-4 pb-4">
    <a href="register.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-home mr-1"></i>Home</a>
    <a href="Service.jsp" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-stethoscope mr-1"></i>Services</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-info-circle mr-1"></i>About</a>
    <a href="#" class="block py-2 text-gray-700 hover:text-red-500"><i class="fas fa-phone-alt mr-1"></i>Contact</a>

  </div>
</nav>
<section class="bg-gray-100 p-12">
  <div class="max-w-7xl mx-auto bg-white p-6 rounded-lg shadow">
    <h1 class="text-2xl font-bold text-gray-800 mb-6">
      <i class="fas fa-table text-blue-500 mr-2"></i>Appointment Table
    </h1>

```
  <table class="min-w-full table-auto text-sm text-left">
    <thead class="bg-gray-100 text-gray-700">
      <tr>
        <th class="px-4 py-2">Id</th>
        <th class="px-4 py-2">Name</th>
        <th class="px-4 py-2">Phone</th>
        <th class="px-4 py-2">Patient Type</th>
        <th class="px-4 py-2">Doctor</th>
        <th class="px-4 py-2">Date</th>
        <th class="px-4 py-2">Time</th>
        <th class="px-4 py-2">Reason</th>
        <th class="px-4 py-2">Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="app" items="${appointment}">
      
      <tr class="border-b hover:bg-gray-50">
        <td class="px-4 py-2">${app.id}</td>
        <td class="px-4 py-2">${app.name}</td>
        <td class="px-4 py-2">${app.phone}</td>
        <td class="px-4 py-2">${app.patientType}</td>
        <td class="px-4 py-2">${app.doctor}</td>
        <td class="px-4 py-2">${app.date}</td>
        <td class="px-4 py-2">${app.time}</td>
        <td class="px-4 py-2">${app.reason}</td>
        <td class="px-4 py-2 flex gap-2">
        
        <form action="editAppointment.jsp " method="post" >
        <input type="hidden" name="id" value="${app.id}" />
        <input type = "hidden" name="name" value="${app.name }">
        <input type = "hidden" name="phone" value="${app.phone }">
        <input type = "hidden" name="patientType" value="${app.patientType }">
        <input type = "hidden" name="doctor" value="${app.doctor }">
        <input type = "hidden" name="date" value="${app.date }">
        <input type = "hidden" name="time" value="${app.time}">
        <input type = "hidden" name="reason" value="${app.reason }">
		  <button type="submit"
		     class="bg-yellow-400 text-white px-3 py-1 rounded hover:bg-yellow-500 text-xs inline-flex items-center">
		    <i class="fas fa-edit mr-1"></i>
		    Edit
		  </button>
		</form>
		
          <form action="DeleteAppointment" method="post" >
            <input type="hidden" name="id" value="${app.id}" />
		  <button type="submit"
		      class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 text-xs inline-flex items-center">
		   <i class="fas fa-trash mr-1"></i>
		   Delete
		  </button>	
		  </form>
		           
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
```

</section>

```
 <form action="AppointmentTable" method="post" class="flex justify-center mt-10">
<button type="submit"
    class="bg-blue-600 hover:bg-blue-700 text-white text-lg px-6 py-3 rounded-lg shadow-md inline-flex items-center gap-2">
    <i class="fas fa-calendar-alt"></i>
    View Appointments
  </button></form>
```

 <!-- Footer Section -->

<footer class="bg-gray-900 text-white pt-12 mt-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-3 gap-8 text-center md:text-left">

```
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
```

  </footer>
</body>
</html>

