<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | About Us</title>
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
      position: relative;
      background: url('https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;
      color: white;
      text-align: center;
      padding: 5rem 1rem;
    }

    .hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0,0,0,0.6);
    }

    .hero-content {
      position: relative;
      z-index: 1;
      max-width: 800px;
      margin: auto;
    }

    .hero h1 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.1rem;
      opacity: 0.9;
    }

    /* Mission & Vision */
    .section {
      width: 90%;
      max-width: 1100px;
      margin: 3rem auto;
      text-align: center;
    }

    .section h2 {
      color: #ff5722;
      font-size: 1.8rem;
      margin-bottom: 1rem;
    }

    .section p {
      font-size: 1rem;
      color: #555;
      line-height: 1.7;
      max-width: 800px;
      margin: auto;
    }

    /* Stats Section */
    .stats {
      display: flex;
      justify-content: space-around;
      flex-wrap: wrap;
      background: linear-gradient(to right, #ff7a47, #ff5722);
      color: white;
      padding: 2.5rem 1rem;
      border-radius: 20px;
      margin-top: 3rem;
    }

    .stat {
      text-align: center;
      margin: 1rem;
    }

    .stat h3 {
      font-size: 2rem;
      margin-bottom: 0.5rem;
    }

    .stat p {
      font-size: 1rem;
      opacity: 0.9;
    }

    /* Team Section */
    .team {
      width: 90%;
      max-width: 900px;
      margin: 4rem auto;
      text-align: center;
    }

    .team h2 {
      color: #ff5722;
      font-size: 1.8rem;
      margin-bottom: 1.5rem;
    }

    .team-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2rem;
      margin-top: 2rem;
    }

    .team-member {
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      overflow: hidden;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .team-member:hover {
      transform: translateY(-8px);
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .team-member img {
      width: 100%;
      height: 250px;
      object-fit: cover;
    }

    .team-member h4 {
      color: #ff5722;
      margin: 1rem 0 0.2rem;
    }

    .team-member p {
      color: #555;
      font-size: 0.9rem;
      margin-bottom: 1rem;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 1.5rem;
      background: #111;
      color: white;
      font-size: 0.9rem;
      margin-top: 3rem;
    }

    @media (max-width: 768px) {
      .hero h1 { font-size: 2rem; }
      .hero p { font-size: 1rem; }
      .stats { flex-direction: column; gap: 1.5rem; }
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
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>About IgniteOne</h1>
      <p>Empowering students to turn their ideas into impactful innovations through collaboration, funding, and mentorship.</p>
    </div>
  </section>

  <!-- Mission Section -->
  <section class="section">
    <h2>Our Mission</h2>
    <p>
      IgniteOne is a crowdfunding platform designed exclusively for university students to bring their innovative campus projects to life. 
      We connect passionate creators with peers, mentors, recruiters, and donors who believe in the power of student innovation. 
      Our mission is to create a thriving ecosystem that supports learning by doing — where ideas are funded, showcased, and celebrated.
    </p>
  </section>

  <!-- Vision Section -->
  <section class="section">
    <h2>Our Vision</h2>
    <p>
      To become the leading digital hub for student-led innovations and departmental events, fostering a culture of creativity, entrepreneurship, and collaboration across campuses in India. 
      Through IgniteOne, we envision a future where every student with an idea has the opportunity to make it real.
    </p>
  </section>

  <!-- Impact Stats -->
  <section class="stats">
    <div class="stat">
      <h3>250+</h3>
      <p>Projects Funded</p>
    </div>
    <div class="stat">
      <h3>₹12L+</h3>
      <p>Funds Raised</p>
    </div>
    <div class="stat">
      <h3>50+</h3>
      <p>Recruiters Onboard</p>
    </div>
    <div class="stat">
      <h3>10+</h3>
      <p>Departments Connected</p>
    </div>
  </section>

  <!-- Team Section -->
  <section class="team">
    <h2>Meet Our Team</h2>
    <div class="team-grid">
      <div class="team-member">
        <img src="https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=800&q=80" alt="Harkirat Kaur">
        <h4>Harkirat Kaur</h4>
        <p>Founder & Design Lead</p>
      </div>
      <div class="team-member">
        <img src="https://images.unsplash.com/photo-1599834562135-b6fc90e642ca?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTE4fHxtYW58ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=600" alt="Ashutosh Thakur">
        <h4>Ashutosh Thakur</h4>
        <p>Founder & Technical Lead</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    © 2025 IgniteOne | Empowering Innovation Through Collaboration
  </footer>

</body>
</html>
