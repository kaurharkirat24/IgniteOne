<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | Donate</title>
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
      background: linear-gradient(to right, #ff774c, #F99353);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #333;
    }

    .container {
      background: white;
      border-radius: 20px;
      padding: 2.5rem 2rem;
      box-shadow: 0 8px 25px rgba(0,0,0,0.2);
      width: 90%;
      max-width: 450px;
      text-align: center;
      position: relative;
      overflow: hidden;
    }

    .container::before {
      content: "";
      position: absolute;
      top: -40%;
      left: -40%;
      width: 200%;
      height: 200%;
      background: url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1000&q=80') center/cover no-repeat;
      opacity: 0.08;
      z-index: 0;
    }

    h1 {
      color: #ff5722;
      margin-bottom: 1.2rem;
      font-weight: 700;
      z-index: 1;
      position: relative;
    }

    p {
      color: #555;
      font-size: 0.95rem;
      margin-bottom: 1.5rem;
      position: relative;
      z-index: 1;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      position: relative;
      z-index: 1;
    }

    input, select {
      padding: 0.8rem 1rem;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 1rem;
      outline: none;
      width: 100%;
      transition: 0.3s;
    }

    input:focus {
      border-color: #ff5722;
      box-shadow: 0 0 6px rgba(255, 87, 34, 0.4);
    }

    button {
      background: #ff5722;
      border: none;
      color: white;
      padding: 0.9rem 1rem;
      border-radius: 10px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #e64a19;
    }

    /* Loader */
    .loader {
      display: none;
      margin-top: 1.5rem;
    }

    .loader div {
      width: 14px;
      height: 14px;
      background: #ff5722;
      border-radius: 50%;
      display: inline-block;
      margin: 0 5px;
      animation: bounce 0.6s infinite alternate;
    }

    .loader div:nth-child(2) { animation-delay: 0.2s; }
    .loader div:nth-child(3) { animation-delay: 0.4s; }

    @keyframes bounce {
      to { transform: translateY(-10px); }
    }

    /* Thank You Animation */
    .thankyou {
      display: none;
      text-align: center;
      position: relative;
      z-index: 2;
    }

    .heart {
      width: 80px;
      height: 80px;
      background: #ff5722;
      transform: rotate(-45deg);
      position: relative;
      margin: 1.5rem auto;
      animation: pulse 1s infinite;
    }

    .heart::before,
    .heart::after {
      content: '';
      width: 80px;
      height: 80px;
      background: #ff5722;
      border-radius: 50%;
      position: absolute;
    }

    .heart::before { top: -40px; left: 0; }
    .heart::after { top: 0; left: 40px; }

    @keyframes pulse {
      0% { transform: scale(1) rotate(-45deg); }
      50% { transform: scale(1.1) rotate(-45deg); }
      100% { transform: scale(1) rotate(-45deg); }
    }

    .thankyou h2 {
      color: #ff5722;
      margin-bottom: 0.5rem;
    }

    .thankyou p {
      color: #555;
      font-size: 0.95rem;
    }

    /* Confetti */
    .confetti {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      overflow: hidden;
      z-index: 999;
    }

    .confetti div {
      position: absolute;
      width: 8px;
      height: 8px;
      background: #ff5722;
      opacity: 0.8;
      animation: fall 3s linear infinite;
    }

    @keyframes fall {
      0% { transform: translateY(-10px) rotate(0deg); }
      100% { transform: translateY(100vh) rotate(360deg); }
    }

    @media (max-width: 500px) {
      .container { padding: 2rem 1.5rem; }
    }
    
        .back-btn {
      position: absolute;
      top: 20px;
      left: 20px;
      background: rgba(255, 255, 255, 0.15);
      border: 2px solid white;
      color: white;
      padding: 8px 14px;
      border-radius: 30px;
      font-size: 0.9rem;
      font-weight: 600;
      backdrop-filter: blur(5px);
      cursor: pointer;
      transition: 0.3s;
      z-index: 10;
    }

    .back-btn:hover {
      background: rgba(255, 255, 255, 0.25);
      transform: scale(1.05);
    }
  </style>
</head>
<body>
<button class="back-btn" onclick="window.location.href='project_showcase.jsp'">← Back to Projects</button>

  <div class="container" id="donationBox">
    <h1>Support a Project 💡</h1>
    <p>Your small contribution can make a big impact. Help students innovate and grow!</p>

    <form id="donationForm">
      <input type="text" id="donorName" placeholder="Your Name" required>
      <input type="email" id="donorEmail" placeholder="Email Address" required>
      <select id="projectSelect" required>
        <option value="">Select Project</option>
        <option value="ai_career">AI Career Recommender</option>
        <option value="iot_irrigation">Smart Irrigation System</option>
        <option value="web_portal">Campus Collaboration Hub</option>
        <option value="dbms_tool">DataVault - Student Records</option>
      </select>
      <input type="number" id="amount" placeholder="Donation Amount (₹)" required min="10">
      <button type="submit">Proceed to Payment</button>
    </form>

    <div class="loader" id="loader">
      <div></div><div></div><div></div>
      <p style="color:#ff5722; font-weight:600; margin-top:10px;">Processing payment...</p>
    </div>

    <div class="thankyou" id="thankYou">
      <div class="heart"></div>
      <h2>Thank You!</h2>
      <p>Your generous support helps students achieve their dreams ❤️</p>
    </div>
  </div>

  <div class="confetti" id="confetti"></div>

  <script>
    const form = document.getElementById("donationForm");
    const loader = document.getElementById("loader");
    const thankYou = document.getElementById("thankYou");
    const confettiContainer = document.getElementById("confetti");

    form.addEventListener("submit", (e) => {
      e.preventDefault();
      form.style.display = "none";
      loader.style.display = "block";

      // Simulate payment processing delay
      setTimeout(() => {
        loader.style.display = "none";
        thankYou.style.display = "block";
        launchConfetti();
      }, 2500);
    });

    // Confetti Generator
    function launchConfetti() {
      for (let i = 0; i < 50; i++) {
        const confetti = document.createElement("div");
        confetti.style.left = Math.random() * 100 + "vw";
        confetti.style.animationDuration = 2 + Math.random() * 2 + "s";
        confetti.style.background = ["#ff5722", "#ff9800", "#ffc107", "#4caf50", "#03a9f4"][Math.floor(Math.random() * 5)];
        confettiContainer.appendChild(confetti);

        setTimeout(() => confetti.remove(), 4000);
      }
    }
  </script>
</body>
</html>