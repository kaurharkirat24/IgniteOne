<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Contact Us</title>
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

    /* Hero Section */
    .hero {
      text-align: center;
      padding: 3rem 1rem;
      background: linear-gradient(to right, #ff7a47, #ff5722);
      color: white;
    }

    .hero h1 {
      font-size: 2.2rem;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.1rem;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto;
    }

    /* Contact Section */
    .contact-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: flex-start;
      gap: 2rem;
      padding: 3rem 2rem;
      max-width: 1100px;
      margin: auto;
    }

    /* Left Side - Info */
    .contact-info {
      flex: 1 1 40%;
      background: white;
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    }

    .contact-info h2 {
      color: #ff5722;
      margin-bottom: 1rem;
    }

    .info-item {
      display: flex;
      align-items: center;
      gap: 1rem;
      margin-bottom: 1.2rem;
    }

    .info-item i {
      font-size: 1.4rem;
      color: #ff5722;
    }

    .info-item p {
      font-size: 0.95rem;
      color: #555;
    }

    /* Right Side - Form */
    .contact-form {
      flex: 1 1 50%;
      background: white;
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      background-image: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800&q=80');
      background-size: cover;
      background-position: center;
      position: relative;
      overflow: hidden;
    }

    .overlay {
      position: absolute;
      inset: 0;
      background: rgba(255,255,255,0.9);
    }

    form {
      position: relative;
      z-index: 1;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    label {
      font-weight: 600;
      font-size: 0.9rem;
      color: #444;
    }

    input, textarea {
      padding: 0.8rem 1rem;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 1rem;
      outline: none;
      transition: 0.3s;
    }

    input:focus, textarea:focus {
      border-color: #ff5722;
      box-shadow: 0 0 6px rgba(255,87,34,0.3);
    }

    textarea {
      resize: none;
    }

    button {
      background: #ff5722;
      color: white;
      border: none;
      padding: 0.9rem 1rem;
      border-radius: 10px;
      font-weight: 600;
      font-size: 1rem;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #e64a19;
      transform: translateY(-2px);
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 1.5rem;
      background: #111;
      color: white;
      font-size: 0.9rem;
    }

    @media (max-width: 768px) {
      .contact-container {
        flex-direction: column;
        padding: 2rem 1rem;
      }
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
      <li><a href="events.jsp">Events</a></li>
      <li><a href="contact.jsp" class="active">Contact</a></li>
    </ul>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Get in Touch With Us</h1>
    <p>Have a question, suggestion, or partnership idea? We’d love to hear from you!</p>
  </section>

  <!-- Contact Section -->
  <section class="contact-container">

    <!-- Info -->
    <div class="contact-info">
      <h2>Contact Information</h2>

      <div class="info-item">
        <i class="fas fa-map-marker-alt"></i>
        <p>Department of Computer Science, Panjab University, Chandigarh</p>
      </div>

      <div class="info-item">
        <i class="fas fa-envelope"></i>
        <p>igniteone@pu.ac.in</p>
      </div>

      <div class="info-item">
        <i class="fas fa-phone-alt"></i>
        <p>+91 98765 43210</p>
      </div>

      <div class="info-item">
        <i class="fas fa-clock"></i>
        <p>Mon – Fri | 9:00 AM – 5:00 PM</p>
      </div>

      <div class="info-item">
        <i class="fab fa-instagram"></i>
        <p>@igniteone_pu</p>
      </div>
    </div>

    <!-- Form -->
    <div class="contact-form">
      <div class="overlay"></div>
      <form id="contactForm">
        <label>Name</label>
        <input type="text" placeholder="Your full name" required>

        <label>Email</label>
        <input type="email" placeholder="Your email address" required>

        <label>Subject</label>
        <input type="text" placeholder="Subject" required>

        <label>Message</label>
        <textarea rows="4" placeholder="Write your message here..." required></textarea>

        <button type="submit">Send Message</button>
      </form>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

  <script src="https://kit.fontawesome.com/a2d04a4d64.js" crossorigin="anonymous"></script>

  <script>
    // Form Submission Simulation
    const form = document.getElementById("contactForm");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      alert("Thank you for contacting us! We'll get back to you soon 😊");
      form.reset();
    });
  </script>

</body>
</html>
