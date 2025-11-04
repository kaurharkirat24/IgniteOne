<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <a href="index.html">Home</a>
    <a href="#" class="active">Dashboard</a>
    <a href="#">My Projects</a>
    <a href="#">Funding</a>
    <a href="#">Notifications</a>
    <a href="profile.jsp">Profile</a>
    <a href="#">Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h1>Welcome, Harkirat 👋</h1>
      <div class="profile">
        <img src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?auto=format&fit=crop&w=500&q=80" alt="profile" />
        <span>Student</span>
      </div>
    </div>

    <!-- Dashboard Section -->
    <section id="dashboard" class="section active">
      <h2>Your Projects</h2>
      <div class="cards">
        <div class="card">
          <img src="https://media.istockphoto.com/id/1494104649/photo/ai-chatbot-artificial-intelligence-digital-concept.webp?a=1&b=1&s=612x612&w=0&k=20&c=bSNvWwiLdPpa57uxQdncwcpu9Xt-NJSsmIBMxNxLQfw=" alt="AI Project" />
          <div class="card-content">
            <h3>AI Chatbot Assistant</h3>
            <p>An intelligent chatbot built with NLP for student helpdesk automation.</p>
            <div class="progress-bar"><div class="progress-fill" style="width: 70%;"></div></div>
            <div class="funding"><span>₹7,000 raised</span><span>Goal: ₹10,000</span></div>
          </div>
        </div>
        <div class="card">
          <img src="https://images.unsplash.com/photo-1593642532973-d31b6557fa68?auto=format&fit=crop&w=800&q=80" alt="IoT Project" />
          <div class="card-content">
            <h3>Smart Waste Segregator</h3>
            <p>IoT-based automatic waste sorter using ultrasonic sensors.</p>
            <div class="progress-bar"><div class="progress-fill" style="width: 50%;"></div></div>
            <div class="funding"><span>₹5,000 raised</span><span>Goal: ₹10,000</span></div>
          </div>
        </div>
        <div class="card">
          <img src="https://media.istockphoto.com/id/1486287149/photo/group-of-multiracial-asian-business-participants-casual-chat-after-successful-conference-event.webp?a=1&b=1&s=612x612&w=0&k=20&c=w6LTgtP8zZnJgg9g7jemKYcmAWjv4lxNlPyZ-PjVwkE=" alt="Web Project" />
          <div class="card-content">
            <h3>Campus Event Portal</h3>
            <p>Web app to organize and manage all university events digitally.</p>
            <div class="progress-bar"><div class="progress-fill" style="width: 90%;"></div></div>
            <div class="funding"><span>₹9,000 raised</span><span>Goal: ₹10,000</span></div>
          </div>
        </div>
      </div>
    </section>

    <!-- My Projects Section -->
    <section id="my-projects" class="section">
      <h2>My Projects</h2>
      <p>You have submitted 3 projects for funding. Keep up the good work!</p>
    </section>

    <!-- Funding Section -->
    <section id="funding" class="section">
      <h2>Funding Overview</h2>
      <p><strong>Total Raised:</strong> ₹21,000<br><strong>Goal:</strong> ₹30,000</p>
      <p>You're 70% of the way there — great progress!</p>
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
      <p><strong>Name:</strong> Harkirat Kaur</p>
      <p><strong>Role:</strong> Student</p>
      <p><strong>Email:</strong> harkirat@igniteone.edu</p>
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
      <input id="projectTitle" type="text" placeholder="Project Title" required />
      <textarea id="projectDesc" rows="3" placeholder="Project Description" required></textarea>
      <input id="projectGoal" type="number" placeholder="Funding Goal (₹)" required />
      <input id="projectImg" type="url" placeholder="Project Image URL (optional)" />
      <button id="modalAddBtn">Add Project</button>
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

    // Add Project functionality
    const modalAddBtn = document.getElementById('modalAddBtn');
    const titleInput = document.getElementById('projectTitle');
    const descInput = document.getElementById('projectDesc');
    const goalInput = document.getElementById('projectGoal');
    const imgInput = document.getElementById('projectImg');

    modalAddBtn.addEventListener('click', (e) => {
      e.preventDefault();

      const title = titleInput.value.trim();
      const desc = descInput.value.trim();
      const goal = goalInput.value.trim();
      const imgUrl = imgInput.value.trim();

      if (!title) { alert('Please enter a project title.'); titleInput.focus(); return; }
      if (!goal || isNaN(goal) || Number(goal) <= 0) { alert('Please enter a valid funding goal (greater than 0).'); goalInput.focus(); return; }

      const fallbackImg = 'https://images.unsplash.com/photo-1614850523290-9f5d10b4c358?auto=format&fit=crop&w=800&q=80';
      const imageSrc = imgUrl || fallbackImg;

      const card = document.createElement('div');
      card.className = 'card';
      card.innerHTML = `
        <img src="${imageSrc}" alt="${escapeHtml(title)}" />
        <div class="card-content">
          <h3>${escapeHtml(title)}</h3>
          <p>${escapeHtml(desc || 'No description provided.')}</p>
          <div class="progress-bar"><div class="progress-fill" style="width: 0%;"></div></div>
          <div class="funding"><span>₹0 raised</span><span>Goal: ₹${Number(goal).toLocaleString('en-IN')}</span></div>
        </div>
      `;

      const cardsGrid = document.querySelector('#dashboard .cards');
      document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
      document.getElementById('dashboard').classList.add('active');
      cardsGrid?.appendChild(card);

      projectModal.style.display = 'none';
      titleInput.value = '';
      descInput.value = '';
      goalInput.value = '';
      imgInput.value = '';

      const newBar = card.querySelector('.progress-fill');
      setTimeout(() => { newBar.style.width = '0%'; }, 50);
    });

    function escapeHtml(text) {
      if (!text) return '';
      return text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#039;');
    }
  </script>
</body>
</html>
    