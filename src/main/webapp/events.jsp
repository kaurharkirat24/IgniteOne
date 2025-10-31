<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Department Events</title>
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

    /* Filter Bar */
    .filters {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
      gap: 1rem;
      background: white;
      padding: 1rem;
      box-shadow: 0 3px 10px rgba(0,0,0,0.05);
      border-radius: 15px;
      margin: 2rem auto;
      width: 90%;
      max-width: 900px;
    }

    .filters input, .filters select {
      padding: 0.7rem 1rem;
      border-radius: 10px;
      border: 1px solid #ddd;
      outline: none;
    }

    .filters button {
      padding: 0.7rem 1.5rem;
      background: #ff5722;
      border: none;
      border-radius: 10px;
      color: white;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    .filters button:hover {
      background: #e64a19;
    }

    /* Event Grid */
    .events {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.8rem;
      width: 90%;
      margin: 0 auto 4rem auto;
    }

    .event-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      overflow: hidden;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .event-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .event-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .card-content {
      padding: 1.2rem;
    }

    .card-content h3 {
      color: #ff5722;
      font-size: 1.2rem;
      margin-bottom: 0.3rem;
    }

    .card-content p {
      font-size: 0.9rem;
      color: #555;
      margin-bottom: 0.8rem;
      min-height: 45px;
    }

    .event-date {
      font-size: 0.85rem;
      color: #666;
      margin-bottom: 1rem;
      font-weight: 500;
    }

    .support-btn {
      margin-top: 1rem;
      background: #ff5722;
      border: none;
      color: white;
      border-radius: 10px;
      padding: 0.7rem 1.2rem;
      font-weight: 600;
      cursor: pointer;
      width: 100%;
      transition: 0.3s;
    }

    .support-btn:hover {
      background: #e64a19;
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
      .filters input { width: 100%; }
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

  <!-- Hero Section -->
  <section class="hero">
    <h1>Department Events & Fests</h1>
    <p>Explore and participate in hackathons, innovation fests, and campus tech initiatives that nurture young innovators!</p>
  </section>

  <!-- Filter Section -->
  <div class="filters">
    <input type="text" id="searchEvent" placeholder="Search events...">
    <select id="eventType">
      <option value="all">All Types</option>
      <option value="hackathon">Hackathon</option>
      <option value="seminar">Seminar</option>
      <option value="fest">Fest</option>
      <option value="workshop">Workshop</option>
    </select>
    <button id="filterBtn">Search</button>
  </div>

  <!-- Events Grid -->
  <div class="events" id="eventGrid">

    <div class="event-card" data-type="hackathon">
      <img src="https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800&q=80" alt="Hackathon">
      <div class="card-content">
        <h3>Hackathon '25</h3>
        <p>48-hour coding challenge where students build innovative real-world tech solutions.</p>
        <div class="event-date">📅 18 Dec 2025 | Venue: Main Auditorium</div>
        <button class="support-btn" onclick="registerEvent('Hackathon 25')">📝 Register / Participate</button>
      </div>
    </div>

    <div class="event-card" data-type="fest">
      <img src="https://images.unsplash.com/photo-1543269865-cbf427effbad?auto=format&fit=crop&w=800&q=80" alt="TechFest">
      <div class="card-content">
        <h3>TechFest 2025</h3>
        <p>Our annual technology fest celebrating innovation, creativity, and collaboration.</p>
        <div class="event-date">📅 12 Nov 2025 | Venue: CS Department Grounds</div>
        <button class="support-btn" onclick="registerEvent('TechFest 2025')">📝 Register / Participate</button>
      </div>
    </div>

    <div class="event-card" data-type="workshop">
      <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=800&q=80" alt="Workshop">
      <div class="card-content">
        <h3>AI Workshop</h3>
        <p>Hands-on session introducing machine learning basics and real-world project building.</p>
        <div class="event-date">📅 27 Oct 2025 | Venue: Lab 3</div>
        <button class="support-btn" onclick="registerEvent('AI Workshop')">📝 Register / Participate</button>
      </div>
    </div>

  </div>

  <!-- Footer -->
  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

  <script>
    // Filtering Functionality
    const filterBtn = document.getElementById("filterBtn");
    const eventType = document.getElementById("eventType");
    const searchEvent = document.getElementById("searchEvent");
    const eventCards = document.querySelectorAll(".event-card");

    filterBtn.addEventListener("click", () => {
      const term = searchEvent.value.toLowerCase();
      const type = eventType.value;

      eventCards.forEach(card => {
        const title = card.querySelector("h3").textContent.toLowerCase();
        const desc = card.querySelector("p").textContent.toLowerCase();
        const matchText = title.includes(term) || desc.includes(term);
        const matchType = type === "all" || card.dataset.type === type;
        card.style.display = (matchText && matchType) ? "block" : "none";
      });
    });

    // Registration function
    function registerEvent(name) {
      alert("You are registering for " + name + "! 🎉 Redirecting to registration page...");
      window.location.href = "register_event.jsp?event=" + encodeURIComponent(name);
    }
  </script>
</body>
</html>
