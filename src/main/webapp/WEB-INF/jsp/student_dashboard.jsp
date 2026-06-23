<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>IgniteOne | Student Dashboard</title>
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
      display: flex;
      min-height: 100vh;
    }

    /* Sidebar */
    .sidebar {
      width: 250px;
      background: linear-gradient(180deg, #ff5722, #ff7043);
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
      background: rgba(255,255,255,0.25);
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

    .profile span {
      font-weight: 600;
    }

    /* Sections */
    .section {
      display: none;
      animation: fadeIn 0.4s ease;
    }

    .section.active {
      display: block;
    }

    @keyframes fadeIn {
      from {opacity: 0; transform: translateY(10px);}
      to {opacity: 1; transform: translateY(0);}
    }

    /* Cards Layout */
    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
    }

    .card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.1);
      overflow: hidden;
      transition: transform 0.3s;
      cursor: pointer;
      position: relative;
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

    .progress-bar {
      background: #eee;
      border-radius: 10px;
      height: 10px;
      width: 100%;
      margin: 0.6rem 0;
      overflow: hidden;
    }

    .progress-fill {
      height: 100%;
      background: #ff5722;
      width: 0%;
      border-radius: 10px;
      transition: width 1s ease-in-out;
    }

    .funding {
      font-size: 0.9rem;
      color: #666;
      display: flex;
      justify-content: space-between;
    }

    /* Add Project Button */
    .add-project-btn {
      position: fixed;
      bottom: 30px;
      right: 40px;
      background: #ff5722;
      color: white;
      padding: 1rem 1.5rem;
      border-radius: 50px;
      font-weight: 600;
      box-shadow: 0 4px 15px rgba(0,0,0,0.2);
      cursor: pointer;
      border: none;
      transition: 0.3s;
    }

    .add-project-btn:hover {
      background: #e64a19;
      transform: scale(1.05);
    }

    /* Modal */
    .modal {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.6);
      justify-content: center;
      align-items: center;
    }

    .modal-content {
      background: white;
      padding: 2rem;
      border-radius: 15px;
      width: 90%;
      max-width: 500px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.2);
      position: relative;
      animation: popIn 0.3s ease;
    }

    @keyframes popIn {
      from {transform: scale(0.8); opacity: 0;}
      to {transform: scale(1); opacity: 1;}
    }

    .modal-content h3 {
      color: #ff5722;
      margin-bottom: 1rem;
    }

    .modal-content input,
    .modal-content textarea {
      width: 100%;
      padding: 0.8rem;
      margin-bottom: 1rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
    }

    .modal-content button {
      background: #ff5722;
      border: none;
      color: white;
      padding: 0.8rem 1.5rem;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 600;
      transition: 0.3s;
    }

    .modal-content button:hover {
      background: #e64a19;
    }

    .close {
      position: absolute;
      top: 15px;
      right: 20px;
      font-size: 1.5rem;
      cursor: pointer;
      color: #999;
    }

    @media (max-width: 768px) {
      .sidebar {
        display: none;
      }
      .main-content {
        margin: 0;
        padding: 1.5rem;
      }
    }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <h2>IgniteOne</h2>
    <a href="/">Home</a>
    <a href="#" class="active">Dashboard</a>
    <a href="#">My Projects</a>
    <a href="#">Funding</a>
    <a href="#">Notifications</a>
    <a href="/profile">Profile</a>
    <a href="#">Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h1>Welcome, <c:out value="${user.username}" default="Harkirat"/> 👋</h1>
      <div class="profile">
        <img src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?auto=format&fit=crop&w=500&q=80" alt="profile" />
        <span>Student</span>
      </div>
    </div>

    <!-- Dashboard Section -->
    <section id="dashboard" class="section active">
      <h2>Your Projects</h2>
      <div class="cards">
        <c:forEach var="project" items="${projects}">
        <div class="card">
          <img src="<c:out value='${project.imageUrl}' default='https://media.istockphoto.com/id/1494104649/photo/ai-chatbot-artificial-intelligence-digital-concept.webp?a=1&b=1&s=612x612&w=0&k=20&c=bSNvWwiLdPpa57uxQdncwcpu9Xt-NJSsmIBMxNxLQfw='/>" alt="Project Image" />
          <div class="card-content">
            <h3><c:out value="${project.title}"/></h3>
            <p><c:out value="${project.description}"/></p>
            <div class="progress-bar"><div class="progress-fill" style="width: 0%;"></div></div>
            <div class="funding"><span>₹<c:out value="${project.currentFunding}"/> raised</span><span>Goal: ₹<c:out value="${project.fundingGoal}"/></span></div>
          </div>
        </div>
        </c:forEach>
        <c:if test="${empty projects}">
          <p>No projects found. Add one below!</p>
        </c:if>
      </div>
    </section>

    <!-- My Projects Section -->
    <section id="my-projects" class="section">
      <h2>My Projects</h2>
      <p>You have submitted ${userProjectsCount} project(s) for funding. Keep up the good work!</p>
    </section>

    <!-- Funding Section -->
    <section id="funding" class="section">
      <h2>Funding Overview</h2>
      <p><strong>Total Raised:</strong> ₹${totalRaised}<br><strong>Goal:</strong> ₹${totalGoal}</p>
      <p>You're ${progressPercentage}% of the way there — great progress!</p>
    </section>

    <!-- Notifications Section -->
    <section id="notifications" class="section">
      <h2>Notifications</h2>
      <ul>
        <li>🎉 Your project “AI Chatbot” received ₹1,000 funding!</li>
        <li>📢 New hackathon announced on campus.</li>
        <li>💡 “Smart Waste Segregator” reached 50% goal.</li>
      </ul>
    </section>

    <!-- Profile Section -->
    <section id="profile" class="section">
      <h2>My Profile</h2>
      <p><strong>Name:</strong> ${user.username}</p>
      <p><strong>Role:</strong> ${user.role}</p>
      <p><strong>Email:</strong> ${user.email}</p>
    </section>

    <!-- Logout Section -->
    <section id="logout" class="section">
      <h2>Logout</h2>
      <p>You have been logged out successfully.</p>
    </section>
  </div>

  <!-- Add Project Floating Button -->
  <button class="add-project-btn" id="openModal">+ Add New Project</button>

  <!-- Modal -->
  <div class="modal" id="projectModal">
    <div class="modal-content">
      <span class="close" id="closeModal">&times;</span>
      <h3>Add New Project</h3>
      <form action="/add_project" method="POST" enctype="multipart/form-data">
        <input name="title" type="text" placeholder="Project Title" required />
        <textarea name="description" rows="3" placeholder="Project Description" required></textarea>
        <input name="goal" type="number" placeholder="Funding Goal (₹)" required />
        <label style="font-size: 0.9rem; margin-bottom: 5px; display: block; color: #555;">Upload Project Image (S3)</label>
        <input name="image" type="file" accept="image/*" />
        <button type="submit">Add Project</button>
      </form>
    </div>
  </div>

  <script>
    // Modal logic
    const openModal = document.getElementById("openModal");
    const closeModal = document.getElementById("closeModal");
    const projectModal = document.getElementById("projectModal");

    openModal.onclick = () => projectModal.style.display = "flex";
    closeModal.onclick = () => projectModal.style.display = "none";
    window.onclick = (e) => { if (e.target == projectModal) projectModal.style.display = "none"; };

    // Sidebar section switching
    const sidebarLinks = document.querySelectorAll('.sidebar a');
    const sections = document.querySelectorAll('.section');

    sidebarLinks.forEach(link => {
      link.addEventListener('click', e => {
        const sectionId = link.textContent.trim().toLowerCase().replace(' ', '-');
        const sectionExists = document.getElementById(sectionId);

        if (sectionExists) {
          e.preventDefault();
          sidebarLinks.forEach(l => l.classList.remove('active'));
          link.classList.add('active');
          sections.forEach(sec => sec.classList.remove('active'));
          sectionExists.classList.add('active');
        }
        // If no matching section (like Home), default navigation occurs
      });
    });

    // Animate progress bars on load
    window.addEventListener('load', () => {
      document.querySelectorAll('.progress-fill').forEach(bar => {
        const width = bar.style.width;
        bar.style.width = '0';
        setTimeout(() => { bar.style.width = width; }, 300);
      });
    });

    // Add project is now handled by standard form submission


    function escapeHtml(text) {
      if (!text) return '';
      return text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#039;');
    }
  </script>
</body>
</html>
    