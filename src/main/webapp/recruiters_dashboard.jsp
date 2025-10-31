<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>IgniteOne | Recruiter Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: #f7f8fa;
      display: flex;
      min-height: 100vh;
      color: #333;
    }

    /* Sidebar */
    .sidebar {
      width: 250px;
      background: #ff5722;
      color: white;
      padding: 2rem 1rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      position: fixed;
      height: 100%;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
    }

    .sidebar h2 {
      margin-bottom: 2rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .sidebar a {
      color: white;
      text-decoration: none;
      margin: 0.8rem 0;
      display: block;
      width: 100%;
      text-align: center;
      padding: 0.6rem;
      border-radius: 10px;
      transition: 0.3s;
      font-weight: 500;
    }

    .sidebar a:hover,
    .sidebar a.active {
      background: rgba(255,255,255,0.2);
    }

    /* Main Content */
    .main-content {
      margin-left: 250px;
      padding: 2rem;
      flex-grow: 1;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
    }

    .header h1 {
      font-size: 1.8rem;
      color: #ff5722;
    }

    .profile {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .profile img {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      border: 2px solid #ff5722;
    }

    /* Search & Filter */
    .filter-bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: white;
      padding: 1rem 1.5rem;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      margin-bottom: 2rem;
    }

    .filter-bar input, select {
      padding: 0.6rem 1rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      outline: none;
      font-size: 0.95rem;
    }

    .filter-bar button {
      background: #ff5722;
      border: none;
      color: white;
      padding: 0.7rem 1.2rem;
      border-radius: 10px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    .filter-bar button:hover {
      background: #e64a19;
    }

    /* Project Cards */
    .projects {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
    }

    .card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.08);
      overflow: hidden;
      transition: transform 0.3s;
      cursor: pointer;
    }

    .card:hover {
      transform: translateY(-8px);
    }

    .card img {
      width: 100%;
      height: 160px;
      object-fit: cover;
    }

    .card-content {
      padding: 1rem 1.5rem;
    }

    .card-content h3 {
      color: #ff5722;
      margin-bottom: 0.5rem;
    }

    .card-content p {
      font-size: 0.9rem;
      color: #555;
      margin-bottom: 1rem;
      min-height: 50px;
    }

    .card-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .card-footer button {
      background: #ff5722;
      border: none;
      color: white;
      padding: 0.6rem 1rem;
      border-radius: 8px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    .card-footer button:hover {
      background: #e64a19;
    }

    .student-info {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      font-size: 0.9rem;
      color: #666;
    }

    .student-info img {
      width: 30px;
      height: 30px;
      border-radius: 50%;
    }

    @media (max-width: 768px) {
      .sidebar { display: none; }
      .main-content { margin-left: 0; padding: 1rem; }
      .filter-bar { flex-direction: column; gap: 1rem; }
    }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <h2>IgniteOne</h2>
    <a href="#" class="active">Dashboard</a>
    <a href="index.html">Home</a>
    <a href="project_showcase.jsp">Browse Projects</a>
    <a href="#">Search Talent</a>
    <a href="#">Shortlisted</a>
    <a href="#">Post Internship</a>
    <a href="#">Profile</a>
    <a href="#">Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h1>Welcome, Recruiter 👋</h1>
      <div class="profile">
        <img src="https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=500&q=80" alt="Recruiter">
        <span>ABC Tech Ltd.</span>
      </div>
    </div>

    <!-- Filter Bar -->
    <div class="filter-bar">
      <input type="text" placeholder="Search projects..." id="search">
      <select id="filter">
        <option value="all">All Categories</option>
        <option value="ai">AI / ML</option>
        <option value="web">Web Development</option>
        <option value="iot">IoT</option>
        <option value="dbms">Database</option>
      </select>
      <button id="searchBtn">Search</button>
    </div>

    <!-- Projects Grid -->
    <div class="projects" id="projectList">
      <div class="card" data-category="ai">
        <img src="https://images.unsplash.com/photo-1581092334504-7f3c5d0b4f65?auto=format&fit=crop&w=800&q=80" alt="AI Project">
        <div class="card-content">
          <h3>AI Career Recommender</h3>
          <p>Machine learning-based system that suggests career paths based on student skills.</p>
          <div class="card-footer">
            <div class="student-info">
              <img src="https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=500&q=80" alt="student">
              <span>Harkirat Kaur</span>
            </div>
            <button>View Profile</button>
          </div>
        </div>
      </div>

      <div class="card" data-category="web">
        <img src="https://images.unsplash.com/photo-1504805572947-34fad45aed93?auto=format&fit=crop&w=800&q=80" alt="Web Project">
        <div class="card-content">
          <h3>Campus Collaboration Hub</h3>
          <p>Full-stack web platform enabling students to collaborate on academic projects.</p>
          <div class="card-footer">
            <div class="student-info">
              <img src="https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=500&q=80" alt="student">
              <span>Rohit Sharma</span>
            </div>
            <button>View Profile</button>
          </div>
        </div>
      </div>

      <div class="card" data-category="iot">
        <img src="https://images.unsplash.com/photo-1603354350317-6f7aaa5911c5?auto=format&fit=crop&w=800&q=80" alt="IoT Project">
        <div class="card-content">
          <h3>Smart Irrigation System</h3>
          <p>IoT solution that optimizes water usage in farms using sensors and data analytics.</p>
          <div class="card-footer">
            <div class="student-info">
              <img src="https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=500&q=80" alt="student">
              <span>Ananya Gupta</span>
            </div>
            <button>View Profile</button>
          </div>
        </div>
      </div>

      <div class="card" data-category="dbms">
        <img src="https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=800&q=80" alt="Database Project">
        <div class="card-content">
          <h3>DataVault - Student Record System</h3>
          <p>Secure and scalable student record management system using MySQL.</p>
          <div class="card-footer">
            <div class="student-info">
              <img src="https://images.unsplash.com/photo-1603415526960-f8f0a8e8c7c5?auto=format&fit=crop&w=500&q=80" alt="student">
              <span>Aditya Verma</span>
            </div>
            <button>View Profile</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    const searchBtn = document.getElementById('searchBtn');
    const filter = document.getElementById('filter');
    const search = document.getElementById('search');
    const projects = document.querySelectorAll('.card');

    searchBtn.addEventListener('click', () => {
      const term = search.value.toLowerCase();
      const category = filter.value;

      projects.forEach(card => {
        const title = card.querySelector('h3').textContent.toLowerCase();
        const desc = card.querySelector('p').textContent.toLowerCase();
        const matchesText = title.includes(term) || desc.includes(term);
        const matchesCategory = category === 'all' || card.dataset.category === category;

        if (matchesText && matchesCategory) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });
  </script>
</body>
</html>
