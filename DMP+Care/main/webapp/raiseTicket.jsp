<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Raise a Support Ticket</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
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
	

<!-- Ticket Form --><section class="bg-gray-100 min-h-screen flex items-center justify-center py-12">
  <div class="bg-white rounded-xl shadow-lg p-8 w-full max-w-2xl">
    <div class="text-center mb-6">
      <h2 class="text-3xl font-bold text-gray-800">
        <i class="fas fa-calendar-check text-red-500 mr-2"></i>Raise a Support Ticket
      </h2>
      <p class="text-sm text-gray-500">Fill in the form if you have any issues..</p>
    </div>

        <c:if test="${not empty error}">
            <p class="text-red-500 mb-4">${error}</p>
        </c:if>
        <c:if test="${not empty message}">
            <p class="text-green-600 mb-4">${message}</p>
        </c:if>
        
        <c:if test="${not empty tickets}">
		    <script>
		        document.addEventListener("DOMContentLoaded", () => {
		            document.getElementById("ticketTable").style.display = "block";
		        });
		    </script>
		</c:if>
		
		 <% if (request.getAttribute("error") != null) { %>
      <p class="text-sm text-red-500 text-center mb-4"><%= request.getAttribute("error") %></p>
    <% } %>
 
       

<form action="${pageContext.request.contextPath}/RaiseTicketServlet" method="post" class="space-y-5">
      
            <div>
                <label for="name" class="block text-sm font-semibold mb-1">Full Name</label>
                <input type="text" name="fullName" class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
            </div>
            <div>
                <label class="block text-gray-700 font-medium">Email Address</label>
                <input type="email" name="email"class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
            </div>
            <div>
		        <label for="phone" class="block text-sm font-semibold mb-1">Phone</label>
		        <input type="tel" id="phone" name="phone" class="w-full border border-gray-300 px-4 py-2 rounded-lg focus:ring focus:ring-blue-400" />
		    </div>
            
                        
            <div class="flex flex-col sm:flex-row gap-4">
		        <div class="flex-1">
		          <label for="date" class="block text-sm font-semibold mb-1">Date</label>
		          <input type="date" id="date" name="date" required
		            class="w-full border border-gray-300 px-4 py-2 rounded-lg" />
		        </div>
		        
		        <div class="flex-1">
		          <label for="time" class="block text-sm font-semibold mb-1">Time</label>
		          <input type="time" id="time" name="time" required
		            class="w-full border border-gray-300 px-4 py-2 rounded-lg" />
		        </div>
		      </div>
		      
		      <div>
                <label class="block text-sm font-semibold mb-1">Issue Category</label>
                <select name="issueCategory" class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-red-500 focus:border-red-500" required>
                    <option value="">-- Select an Issue --</option>
                    <option value="Appointment Issues">Appointment Issues</option>
                    <option value="Technical Problem">Technical Problem</option>
                    <option value="Medical Support">Medical Support</option>
                    <option value="Other">Other</option>
                </select>
            </div>
		      
		         
      
            <div>
                <label class="block text-gray-700 font-medium">Describe Your Issue</label>
                <textarea name="issueDescription" class="w-full border border-gray-300 rounded-md px-3 py-2 h-28 focus:outline-none focus:ring-red-500 focus:border-red-500" required></textarea>
            </div>
            
            
            <div class="text-center pt-4">
		        <button type="submit"
		          class="bg-red-600 hover:bg-black-600 text-white px-6 py-2 rounded-lg text-sm shadow">
		          <i class="fas fa-check-circle mr-2"></i>Confirm Tickets
		        </button>
		      </div>
		      <form action="TicketTable" method="post" class="flex justify-center mt-10">
  		</form>
        </form>
    </div>
</section>
</div>

       
        <script>
document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");

  form.addEventListener("submit", function (e) {
    let isValid = true;
    let errorMsg = "";

    const fullName = form.fullName.value.trim();
    const email = form.email.value.trim();
    const phone = form.phone.value.trim();
    const date = form.date.value;
    const time = form.time.value;
    const category = form.issueCategory.value;
    const description = form.issueDescription.value.trim();

    // Full Name validation
    if (fullName.length < 3) {
      isValid = false;
      errorMsg += "Full Name must be at least 3 characters long.\n";
    }

    // Email format validation
    if (!/^\S+@\S+\.\S+$/.test(email)) {
      isValid = false;
      errorMsg += "Invalid email format.\n";
    }

    // Phone number format
    if (!/^[0-9]{10}$/.test(phone)) {
      isValid = false;
      errorMsg += "Phone number must be 10 digits.\n";
    }

    // Date & time check
    if (!date || !time) {
      isValid = false;
      errorMsg += "Date and Time are required.\n";
    }

    // Category selection
    if (category === "") {
      isValid = false;
      errorMsg += "Please select an Issue Category.\n";
    }

    // Description length
    if (description.length < 10) {
      isValid = false;
      errorMsg += "Issue description should be at least 10 characters.\n";
    }

    if (!isValid) {
      e.preventDefault();
      alert(errorMsg);
    }
  });
});
</script>
        

<!-- Include Footer -->
<jsp:include page="footer.jsp" />
</body>
</html>