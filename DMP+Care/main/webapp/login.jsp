<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title> Login – DMP+care</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <!-- Alpine.js for password toggle -->
  <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
</head>
<body class="bg-gray-100 h-full flex items-center justify-center">
    <body class="h-full bg-cover bg-center bg-no-repeat bg-gray-100" style="background-image: url('./images/banner1.jpeg');">

  <!-- Login Card -->
  <div class="bg-white shadow-xl rounded-xl p-10 w-full max-w-md space-y-8">
    
    <!-- Logo / Title -->
    <div class="text-center">
      <i class="fas fa-heartbeat text-red-500 text-4xl mb-2"></i>
      <h1 class="text-2xl font-bold text-gray-800">DMP+care Login</h1>
      <p class="text-sm text-gray-500">Please enter your credentials</p>
    </div>
	<!-- Display error message if login fails -->
	<!-- Display error message if login fails -->
	
    <!-- Login Form -->
    <form action="${pageContext.request.contextPath}/Login" method="post"  class="space-y-6">
    
    
      
      <!-- Email -->
      <div>
        <label class="block text-sm font-medium mb-1" for="email">Email Address</label>
        <input type="email" id="email" name="email" required
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
      </div>

      <!-- Password -->
      <div x-data="{ show: false }" class="relative">
        <label class="block text-sm font-medium mb-1" for="password">Password</label>
        <input :type="show ? 'text' : 'password'" id="password" name="password" required
          class="w-full px-4 py-2 pr-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400" />
        <button type="button" class="absolute top-9 right-3 text-gray-400 text-sm" @click="show = !show">
          <i :class="show ? 'fas fa-eye-slash' : 'fas fa-eye'"></i>
        </button>
      </div>

      <!-- Error Message -->
      <c:if test="${not empty error}">
	    <div class="bg-red-500/20 text-red-400 border border-red-500 rounded-lg p-4">
	        <p>${error}Invalid email or password.</p>
	    </div>
	</c:if>

      <!-- Buttons -->
      <div class="flex items-center justify-between">
        <a href="signup.jsp" class="text-sm text-blue-500 hover:underline">Don't have an account? Sign Up</a>
        <button type="submit"
          class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-lg text-sm shadow">
          <i class="fas fa-sign-in-alt mr-2"></i>Login
        </button>
      </div>
    </form>
  </div>

  
</body>
</html>
    