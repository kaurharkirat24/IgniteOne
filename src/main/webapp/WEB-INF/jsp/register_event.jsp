<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Register for Event</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background-color: #f9f9fb;
      color: #333;
    }

    /* Navbar */
    nav {
      background: #ff5722;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 6%;
      position: sticky;
      top: 0;
      z-index: 100;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }

    nav .logo {
      font-size: 1.5rem;
      font-weight: 700;
      letter-spacing: 1px;
    }

    nav ul {
      display: flex;
      list-style: none;
      gap: 1.5rem;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: 0.3s;
    }

    nav ul li a:hover {
      color: #ffe9e0;
    }

    nav ul li a.active {
      text-decoration: underline;
      text-underline-offset: 6px;
    }

    /* Registration Section */
    .register-container {
      width: 90%;
      max-width: 600px;
      margin: 3rem auto;
      background: white;
      padding: 2rem 2.5rem;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.05);
    }

    .register-container h1 {
      color: #ff5722;
      font-size: 1.8rem;
      text-align: center;
      margin-bottom: 0.5rem;
    }

    .register-container p {
      text-align: center;
      font-size: 0.95rem;
      color: #555;
      margin-bottom: 2rem;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 1.2rem;
    }

    label {
      font-weight: 600;
      color: #444;
    }

    input, select, textarea {
      padding: 0.8rem 1rem;
      border-radius: 10px;
      border: 1px solid #ddd;
      outline: none;
      font-size: 0.95rem;
    }

    input:focus, select:focus, textarea:focus {
      border-color: #ff5722;
    }

    .register-btn {
      margin-top: 1rem;
      background: #ff5722;
      border: none;
      color: white;
      border-radius: 10px;
      padding: 0.9rem;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
      font-size: 1rem;
    }

    .register-btn:hover {
      background: #e64a19;
    }

    .back-btn {
      display: inline-block;
      text-align: center;
      margin-top: 1.5rem;
      color: #ff5722;
      font-weight: 600;
      text-decoration: none;
      transition: 0.3s;
    }

    .back-btn:hover {
      text-decoration: underline;
    }

    footer {
      text-align: center;
      padding: 1.5rem;
      background: #111;
      color: white;
      font-size: 0.9rem;
      margin-top: 3rem;
    }

    @media (max-width: 768px) {
      .register-container { padding: 1.5rem; }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav>
    <div class="logo">IgniteOne</div>
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="project_showcase.jsp">Projects</a></li>
      <li><a href="events.jsp" class="active">Events</a></li>
      <li><a href="login.html">Login</a></li>
    </ul>
  </nav>

  <!-- Registration Form -->
  <div class="register-container">
    <h1 id="eventTitle">Event Registration</h1>
    <p>Fill in your details to participate in this exciting event!</p>

    <form id="registerForm" onsubmit="return handleSubmit(event)">
      <input type="hidden" id="eventName" name="eventName">

      <label for="name">Full Name</label>
      <input type="text" id="name" name="name" placeholder="Enter your full name" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>

      <label for="dept">Department</label>
      <select id="dept" name="dept" required>
        <option value="">Select Department</option>
        <option value="CSE">Computer Science</option>
        <option value="IT">Information Technology</option>
        <option value="ECE">Electronics & Communication</option>
        <option value="ME">Mechanical Engineering</option>
        <option value="EE">Electrical Engineering</option>
      </select>

      <label for="year">Year of Study</label>
      <select id="year" name="year" required>
        <option value="">Select Year</option>
        <option value="1st">1st Year</option>
        <option value="2nd">2nd Year</option>
        <option value="3rd">3rd Year</option>
        <option value="4th">4th Year</option>
      </select>

      <label for="message">Message (Optional)</label>
      <textarea id="message" name="message" rows="3" placeholder="Any message or query?"></textarea>

      <button type="submit" class="register-btn">Submit Registration</button>
    </form>

    <a href="events.jsp" class="back-btn">← Back to Events</a>
  </div>

  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

  <script>
    // Get event name from URL query parameter
    const urlParams = new URLSearchParams(window.location.search);
    const eventName = urlParams.get('event');
    const eventTitle = document.getElementById('eventTitle');
    const hiddenInput = document.getElementById('eventName');

    if (eventName) {
      eventTitle.textContent = "Register for " + eventName;
      hiddenInput.value = eventName;
    }

    // Form submission handling
    function handleSubmit(e) {
      e.preventDefault();

      const name = document.getElementById('name').value.trim();
      const email = document.getElementById('email').value.trim();
      const dept = document.getElementById('dept').value;
      const year = document.getElementById('year').value;

      if (!name || !email || !dept || !year) {
        alert("⚠️ Please fill all required fields!");
        return false;
      }

      alert("✅ Registration Successful!\n\nThank you, " + name + ", for registering for " + eventName + ".");
      window.location.href = "events.jsp";
      return false;
    }
  </script>
</body>
</html>
