<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Project Details</title>
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

    /* Banner */
    .banner {
      position: relative;
      height: 320px;
      background: url('https://images.unsplash.com/photo-1581090700227-1e37b190418e?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      text-align: center;
    }

    .banner::after {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,0.4);
    }

    .banner h1 {
      position: relative;
      font-size: 2rem;
      z-index: 1;
      font-weight: 700;
    }

    /* Main Content */
    .container {
      max-width: 1100px;
      margin: 3rem auto;
      padding: 2rem 1rem;
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 20px rgba(0,0,0,0.05);
    }

    .project-info {
      display: flex;
      flex-wrap: wrap;
      gap: 2rem;
    }

    .project-left {
      flex: 1 1 60%;
    }

    .project-right {
      flex: 1 1 35%;
      background: #fff5f0;
      border-radius: 15px;
      padding: 1.5rem;
      height: fit-content;
      box-shadow: 0 3px 10px rgba(0,0,0,0.05);
    }

    h2 {
      color: #ff5722;
      margin-bottom: 0.8rem;
    }

    p {
      line-height: 1.6;
      color: #555;
      margin-bottom: 1rem;
    }

    .tags {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem;
      margin-bottom: 1.5rem;
    }

    .tag {
      background: #ffe1d5;
      color: #ff5722;
      padding: 0.4rem 0.8rem;
      border-radius: 20px;
      font-size: 0.85rem;
      font-weight: 600;
    }

    .progress-bar {
      background: #eee;
      border-radius: 10px;
      height: 12px;
      overflow: hidden;
      margin-bottom: 1rem;
    }

    .progress-fill {
      height: 100%;
      background: #ff5722;
      width: 70%;
      transition: width 1s ease-in-out;
    }

    .fund-stats {
      display: flex;
      justify-content: space-between;
      font-size: 0.9rem;
      color: #666;
      margin-bottom: 1rem;
    }

    .donate-btn {
      width: 100%;
      background: #ff5722;
      border: none;
      color: white;
      padding: 0.9rem;
      border-radius: 10px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    .donate-btn:hover {
      background: #e64a19;
    }

    /* Team & Tech Section */
    .team-tech {
      margin-top: 2rem;
    }

    .team {
      display: flex;
      flex-wrap: wrap;
      gap: 1rem;
      margin-bottom: 1rem;
    }

    .member {
      background: #f8f9fb;
      padding: 0.8rem 1rem;
      border-radius: 10px;
      font-size: 0.9rem;
    }

    /* Related Projects */
    .related {
      margin-top: 3rem;
    }

    .related h3 {
      color: #ff5722;
      margin-bottom: 1rem;
    }

    .related-projects {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 1.5rem;
    }

    .related-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      overflow: hidden;
      transition: transform 0.3s;
      cursor: pointer;
    }

    .related-card:hover {
      transform: translateY(-5px);
    }

    .related-card img {
      width: 100%;
      height: 140px;
      object-fit: cover;
    }

    .related-card div {
      padding: 0.8rem;
    }

    footer {
      text-align: center;
      background: #111;
      color: white;
      padding: 1.5rem;
      margin-top: 3rem;
    }

    @media (max-width: 768px) {
      .project-info { flex-direction: column; }
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
      <li><a href="#">Events</a></li>
      <li><a href="login.jsp">Login</a></li>
    </ul>
  </nav>

  <!-- Banner -->
  <section class="banner">
    <h1>AI Career Recommender</h1>
  </section>

  <!-- Main Content -->
  <div class="container">
    <div class="project-info">
      <div class="project-left">
        <h2>Project Overview</h2>
        <p>
          The AI Career Recommender is a machine learning-based system designed to suggest 
          personalized career paths to students by analyzing their skills, interests, and 
          academic performance. This project aims to reduce career confusion and align 
          learning goals with market demand.
        </p>

        <div class="tags">
          <span class="tag">AI</span>
          <span class="tag">Machine Learning</span>
          <span class="tag">Python</span>
          <span class="tag">Flask</span>
        </div>

        <h2>Team Members</h2>
        <div class="team">
          <div class="member">Ashutosh Thakur</div>
          <div class="member">Harkirat Kaur</div>
          <div class="member">Ustat</div>
        </div>

        <div class="team-tech">
          <h2>Technologies Used</h2>
          <p>Python, Scikit-learn, Flask, MySQL, HTML/CSS, JavaScript</p>
        </div>
      </div>

      <div class="project-right">
        <h2>Funding Progress</h2>
        <div class="progress-bar"><div class="progress-fill" style="width:70%;"></div></div>
        <div class="fund-stats">
          <span>₹7,000 Raised</span>
          <span>Goal: ₹10,000</span>
        </div>
        <button class="donate-btn" onclick="donateRedirect()">💖 Donate Now</button>
      </div>
    </div>

    <!-- Related Projects -->
    <div class="related">
      <h3>Related Projects</h3>
      <div class="related-projects">
        <div class="related-card" onclick="window.location.href='project_details.jsp?projectId=web_portal'">
          <img src="https://images.unsplash.com/photo-1504805572947-34fad45aed93?auto=format&fit=crop&w=800&q=80">
          <div><h4>Campus Collaboration Hub</h4></div>
        </div>
        <div class="related-card" onclick="window.location.href='project_details.jsp?projectId=iot_irrigation'">
          <img src="https://images.unsplash.com/photo-1603354350317-6f7aaa5911c5?auto=format&fit=crop&w=800&q=80">
          <div><h4>Smart Irrigation System</h4></div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

  <script>
    // Redirect user to donation page with project name
    function donateRedirect() {
      window.location.href = "donations.jsp?project=AI_Career_Recommender";
    }

    // Animate progress bar
    window.addEventListener("load", () => {
      const fill = document.querySelector(".progress-fill");
      const width = fill.style.width;
      fill.style.width = "0";
      setTimeout(() => fill.style.width = width, 300);
    });
  </script>

</body>
</html>
