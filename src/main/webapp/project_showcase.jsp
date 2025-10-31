<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Project Showcase</title>
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
      background: linear-gradient(180deg, #fff8f6 0%, #f9f9fb 100%);
      color: #333;
      overflow-x: hidden;
    }

    /* Navbar */
    nav {
      background: linear-gradient(90deg, #ff7043, #ff5722);
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 6%;
      position: sticky;
      top: 0;
      z-index: 100;
      box-shadow: 0 3px 10px rgba(0,0,0,0.15);
    }

    nav .logo {
      font-size: 1.7rem;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: uppercase;
    }

    nav ul {
      display: flex;
      list-style: none;
      gap: 1.8rem;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      position: relative;
      transition: 0.3s ease;
    }

    nav ul li a::after {
      content: "";
      position: absolute;
      bottom: -5px;
      left: 0;
      width: 0;
      height: 2px;
      background: #ffe9e0;
      transition: 0.3s ease;
    }

    nav ul li a:hover::after,
    nav ul li a.active::after {
      width: 100%;
    }

    /* Hero Section */
    .hero {
      text-align: center;
      padding: 4rem 1rem;
      background: radial-gradient(circle at center, #ff7043, #EFC4AF);
      color: white;
      animation: fadeIn 1s ease;
    }

    .hero h1 {
      font-size: 2.6rem;
      margin-bottom: 1rem;
      letter-spacing: 0.5px;
      text-shadow: 1px 2px 4px rgba(0,0,0,0.2);
    }

    .hero p {
      font-size: 1.1rem;
      opacity: 0.95;
      max-width: 700px;
      margin: auto;
      line-height: 1.6;
    }

    /* Filter Section */
    .filters {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
      gap: 1rem;
      background: white;
      padding: 1.5rem;
      box-shadow: 0 5px 20px rgba(0,0,0,0.05);
      border-radius: 15px;
      margin: 2.5rem auto;
      width: 90%;
      max-width: 1000px;
      transition: all 0.3s ease;
    }

    .filters input,
    .filters select {
      padding: 0.8rem 1rem;
      border-radius: 10px;
      border: 1px solid #ddd;
      outline: none;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    .filters input:focus,
    .filters select:focus {
      border-color: #ff7043;
      box-shadow: 0 0 8px rgba(255,87,34,0.2);
    }

    .filters button {
      padding: 0.8rem 1.6rem;
      background: linear-gradient(90deg, #ff7043, #ff5722);
      border: none;
      border-radius: 10px;
      color: white;
      font-weight: 600;
      cursor: pointer;
      letter-spacing: 0.3px;
      transition: transform 0.25s, background 0.3s;
    }

    .filters button:hover {
      transform: translateY(-2px);
      background: linear-gradient(90deg, #ff5722, #e64a19);
      box-shadow: 0 4px 15px rgba(255,87,34,0.3);
    }

    /* Project Grid */
    .projects {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2rem;
      width: 90%;
      margin: 0 auto 4rem auto;
    }

    .card {
      background: white;
      border-radius: 20px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.08);
      overflow: hidden;
      transition: transform 0.35s ease, box-shadow 0.35s ease;
      cursor: pointer;
    }

    .card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 30px rgba(0,0,0,0.12);
    }

    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
      transition: transform 0.5s ease;
    }

    .card:hover img {
      transform: scale(1.05);
    }

    .card-content {
      padding: 1.2rem 1.4rem;
    }

    .card-content h3 {
      color: #ff5722;
      font-size: 1.2rem;
      margin-bottom: 0.5rem;
      transition: color 0.3s ease;
    }

    .card-content h3:hover {
      color: #e64a19;
    }

    .card-content p {
      font-size: 0.93rem;
      color: #555;
      margin-bottom: 0.8rem;
      min-height: 45px;
      line-height: 1.5;
    }

    .progress-bar {
      background: #f0f0f0;
      border-radius: 10px;
      height: 10px;
      overflow: hidden;
      margin-bottom: 0.5rem;
    }

    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, #ff7043, #ff5722);
      width: 0%;
      border-radius: 10px;
      transition: width 1s ease-in-out;
    }

    .funding {
      display: flex;
      justify-content: space-between;
      font-size: 0.85rem;
      color: #666;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 1.8rem;
      background: #111;
      color: #fff;
      font-size: 0.9rem;
      letter-spacing: 0.3px;
      box-shadow: 0 -3px 10px rgba(0,0,0,0.1);
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(15px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2rem;
      }
      .filters input {
        width: 100%;
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
      <li><a href="project_showcase.jsp" class="active">Projects</a></li>
      <li><a href="events.jsp">Events</a></li>
      <li><a href="login.html">Login</a></li>
    </ul>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Explore Innovative Campus Projects</h1>
    <p>Support ideas that spark change. Browse, fund, and inspire future innovators!</p>
  </section>

  <!-- Filter Section -->
  <div class="filters">
    <input type="text" id="searchInput" placeholder="Search projects...">
    <select id="categoryFilter">
      <option value="all">All Categories</option>
      <option value="ai">AI / Machine Learning</option>
      <option value="iot">IoT</option>
      <option value="web">Web Development</option>
      <option value="dbms">Database Systems</option>
    </select>
    <button id="filterBtn">Search</button>
  </div>

  <!-- Project Grid -->
  <div class="projects" id="projectGrid">

    <div class="card" data-category="ai" onclick="openProject('ai_project')">
      <img src="https://images.unsplash.com/photo-1581093588401-22b8f8b7d6b9?auto=format&fit=crop&w=800&q=80" alt="AI Project">
      <div class="card-content">
        <h3>AI Career Recommender</h3>
        <p>Machine learning model that suggests personalized career paths for students.</p>
        <div class="progress-bar"><div class="progress-fill" style="width: 70%;"></div></div>
        <div class="funding"><span>₹7,000 raised</span><span>Goal: ₹10,000</span></div>
      </div>
    </div>

    <div class="card" data-category="web" onclick="openProject('web_portal')">
      <img src="https://images.unsplash.com/photo-1504805572947-34fad45aed93?auto=format&fit=crop&w=800&q=80" alt="Web Project">
      <div class="card-content">
        <h3>Campus Collaboration Hub</h3>
        <p>Platform connecting students and faculty for academic and innovation projects.</p>
        <div class="progress-bar"><div class="progress-fill" style="width: 80%;"></div></div>
        <div class="funding"><span>₹8,000 raised</span><span>Goal: ₹10,000</span></div>
      </div>
    </div>

    <div class="card" data-category="iot" onclick="openProject('smart_irrigation')">
      <img src="https://images.unsplash.com/photo-1603354350317-6f7aaa5911c5?auto=format&fit=crop&w=800&q=80" alt="IoT Project">
      <div class="card-content">
        <h3>Smart Irrigation System</h3>
        <p>IoT-powered automation for optimizing farm irrigation and water conservation.</p>
        <div class="progress-bar"><div class="progress-fill" style="width: 55%;"></div></div>
        <div class="funding"><span>₹5,500 raised</span><span>Goal: ₹10,000</span></div>
      </div>
    </div>

    <div class="card" data-category="dbms" onclick="openProject('dbms_tool')">
      <img src="https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=800&q=80" alt="Database Project">
      <div class="card-content">
        <h3>DataVault - Student Records</h3>
        <p>Secure, scalable database system for managing student academic records.</p>
        <div class="progress-bar"><div class="progress-fill" style="width: 40%;"></div></div>
        <div class="funding"><span>₹4,000 raised</span><span>Goal: ₹10,000</span></div>
      </div>
    </div>

  </div>

  <!-- Footer -->
  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

  <script>
    // Filtering Function
    const filterBtn = document.getElementById("filterBtn");
    const categoryFilter = document.getElementById("categoryFilter");
    const searchInput = document.getElementById("searchInput");
    const cards = document.querySelectorAll(".card");

    filterBtn.addEventListener("click", () => {
      const term = searchInput.value.toLowerCase();
      const category = categoryFilter.value;
      cards.forEach(card => {
        const title = card.querySelector("h3").textContent.toLowerCase();
        const desc = card.querySelector("p").textContent.toLowerCase();
        const matchText = title.includes(term) || desc.includes(term);
        const matchCategory = category === "all" || card.dataset.category === category;
        card.style.display = (matchText && matchCategory) ? "block" : "none";
      });
    });

    // Redirect to project details
    function openProject(id) {
      window.location.href = "project_details.jsp?projectId=" + id;
    }

    // Animate progress bars
    window.addEventListener("load", () => {
      document.querySelectorAll(".progress-fill").forEach(bar => {
        const width = bar.style.width;
        bar.style.width = "0";
        setTimeout(() => bar.style.width = width, 300);
      });
    });
  </script>
</body>
</html>
