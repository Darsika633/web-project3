<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Payment</title>

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center py-12">

<section class="bg-white rounded-xl shadow-lg p-8 w-full max-w-2xl">
  <div class="text-center mb-6">
    <h2 class="text-3xl font-bold text-gray-800">
      <i class="fas fa-credit-card text-purple-600 mr-2"></i>Edit Payment Details
    </h2>
  </div>

  <form action="${pageContext.request.contextPath}/UpdatePayment" method="POST" class="space-y-5">
    <input type="hidden" name="id" value="${param.id}" />

    <!-- Full Name -->
    <div>
      <label for="fullName" class="block text-sm font-semibold mb-1">Full Name</label>
      <input type="text" id="fullName" name="fullName" value="${param.fullName}"
        class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-purple-400" />
    </div>

    <!-- Email -->
    <div>
      <label for="email" class="block text-sm font-semibold mb-1">Email</label>
      <input type="email" id="email" name="email" value="${param.email}"
        class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-purple-400" />
    </div>

    <!-- Service Type -->
    <div>
      <label for="service" class="block text-sm font-semibold mb-1">Service Type</label>
      <select id="service" name="service"
        class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-purple-400">
        <option value="">-- Select Service --</option>
        <option value="consultation" ${param.service == 'consultation' ? 'selected' : ''}>Consultation</option>
        <option value="therapy" ${param.service == 'therapy' ? 'selected' : ''}>Physical Therapy</option>
        <option value="lab" ${param.service == 'lab' ? 'selected' : ''}>Lab Test</option>
        <option value="surgery" ${param.service == 'surgery' ? 'selected' : ''}>Surgery</option>
        <option value="other" ${param.service == 'other' ? 'selected' : ''}>Other</option>
      </select>
    </div>

    <!-- Amount -->
    <div>
      <label for="amount" class="block text-sm font-semibold mb-1">Amount (LKR)</label>
      <input type="text" id="amount" name="amount" value="${param.amount}"
        class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-purple-400" />
    </div>

    <!-- Card Number -->
    <div>
      <label for="cardNumber" class="block text-sm font-semibold mb-1">Card Number</label>
      <input type="text" id="cardNumber" name="cardNumber" maxlength="19" value="${param.cardNumber}"
        class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-purple-400" />
    </div>

    <!-- Submit -->
    <div class="text-right pt-4">
      <button type="submit"
        class="bg-purple-600 hover:bg-purple-700 text-white px-6 py-2 rounded-lg text-sm shadow">
        <i class="fas fa-check-circle mr-2"></i>Update Payment
      </button>
    </div>
  </form>
</section>

</body>
</html>
