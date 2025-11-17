<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, com.healthcare.util.DBConnection" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Ticket</title>
</head>
<<body>
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
        <i class="fas fa-edit text-red-500 mr-2"></i> Edit Raise Ticket
    </h2>
    <p class="text-sm text-gray-500">Edit in the form if you have any issues..</p>
   </div>

    <form action="${pageContext.request.contextPath}/UpdateTicketServlet" method="post" class="space-y-5">
       <input type="hidden" name="ticketId" value="${param.ticketId}">
        <div>
            <label for="name" class="block text-sm font-semibold mb-1">Full Name</label>
            <input type="text" name="fullName" value="${param.fullName}"  
            class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-red-400" />
        </div>
        <div>
            <label for="email" class="block text-sm font-semibold mb-1">Email</label>
            <input type="email" name="email" value="${param.email }"  
            class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-red-400" />
        </div>
         <div>
	        <label for="phone" class="block text-sm font-semibold mb-1">Phone</label>
	        <input type="tel" id="phone" name="phone" value = "${param.phone}"
	          class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-red-400" />
	      </div>
	      
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
        
        <div>
                <label class="block text-sm font-semibold mb-1">Issue Category</label>
                <select name="issueCategory" class="..." required>
                    <option value="">-- Select an Issue --</option>
                    <option value="Appointment Issues" ${param.issueCategory == 'Appointment Issues' ? 'selected' : ''}>Appointment Issues</option>
                    <option value="Technical Problem" ${param.issueCategory == 'Technical Problem' ? 'selected' : ''}>Technical Problem</option>
                    <option value="Medical Support" ${param.issueCategory == 'Medical Support' ? 'selected' : ''}>Medical Support</option>
                    <option value="Other" ${param.issueCategory == 'Othert' ? 'selected' : ''}>Other</option>
                </select>
            </div>
		      
		         
      
            <div>
                <label class="block text-sm font-semibold mb-1">Describe Your Issue</label>
                <textarea id="reason" name="issueDescription" rows="3"
          class="w-full border border-gray-300 px-4 py-2 rounded-lg">${param.issueDescription}</textarea>
            </div>
        <div class="text-right pt-4">
        <button type="submit"
          class="bg-red-500 hover:bg-black-600 text-white px-6 py-2 rounded-lg text-sm shadow">
          <i class="fas fa-check-circle mr-2"></i>Update Ticket
            </button>
        </div>
    </form>
  </div>
</div>
</section>

<jsp:include page="footer.jsp" />


</body>
</html>

