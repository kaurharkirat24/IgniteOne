<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>IgniteOne | Register</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
  }
  body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #0b0d14;
    overflow-x: hidden;
    color: white;
    padding: 20px 0;
  }

  /* Ambient Glowing Background Orbs */
  .bg-orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(100px);
    z-index: 0;
    animation: floatOrb 12s ease-in-out infinite alternate;
  }
  .orb-1 { width: 50vw; height: 50vw; background: rgba(255, 87, 34, 0.15); top: -20vh; left: -20vw; }
  .orb-2 { width: 40vw; height: 40vw; background: rgba(255, 112, 67, 0.1); bottom: -10vh; right: -10vw; animation-delay: -6s; }
  
  @keyframes floatOrb {
    0% { transform: translate(0, 0) scale(1); }
    100% { transform: translate(50px, 50px) scale(1.1); }
  }

  /* Container */
  .container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 80px;
    width: 90%;
    max-width: 1100px;
    z-index: 10;
  }

  /* Sleek Drone Avatar */
  .drone {
    position: relative;
    width: 200px;
    height: 250px;
    display: flex;
    flex-direction: column;
    align-items: center;
    animation: hoverDrone 4s ease-in-out infinite;
  }
  
  @keyframes hoverDrone {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
  }

  .drone-body {
    width: 170px;
    height: 170px;
    background: linear-gradient(145deg, #ffffff, #d5dce6);
    border-radius: 45%;
    box-shadow: 
      inset -10px -10px 20px rgba(0,0,0,0.1),
      inset 10px 10px 20px rgba(255,255,255,0.8),
      0 20px 40px rgba(0,0,0,0.3),
      0 0 20px rgba(255, 87, 34, 0.2);
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 2;
  }

  /* Glowing Ears/Antennas */
  .drone-body::before, .drone-body::after {
    content: '';
    position: absolute;
    top: 50%;
    width: 16px;
    height: 50px;
    background: linear-gradient(to bottom, #ff7043, #ff5722);
    border-radius: 8px;
    transform: translateY(-50%);
    box-shadow: 0 0 15px #ff5722;
  }
  .drone-body::before { left: -8px; }
  .drone-body::after { right: -8px; }

  /* Visor Screen */
  .visor {
    width: 140px;
    height: 80px;
    background: linear-gradient(135deg, #0a0a0a, #1a1c23);
    border-radius: 40px;
    box-shadow: 
      inset 0 4px 10px rgba(0,0,0,0.8), 
      0 4px 8px rgba(255,255,255,0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 18px;
    position: relative;
    overflow: hidden;
  }

  /* Glass Reflection on Visor */
  .visor::after {
    content: '';
    position: absolute;
    top: 2px;
    left: 10px;
    width: 70px;
    height: 25px;
    background: linear-gradient(to bottom, rgba(255,255,255,0.2), transparent);
    border-radius: 20px;
    transform: rotate(-10deg);
    pointer-events: none;
  }

  /* Glowing Eyes */
  .eye {
    width: 26px;
    height: 38px;
    background: #ff5722;
    border-radius: 50%;
    box-shadow: 0 0 15px #ff5722, 0 0 30px #ff7043;
    position: relative;
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  }

  /* Inner pupil for tracking */
  .pupil {
    width: 10px;
    height: 14px;
    background: #fff;
    border-radius: 50%;
    position: absolute;
    top: 6px;
    left: 8px;
    box-shadow: 0 0 8px #fff;
    transition: transform 0.05s linear;
  }

  /* Anime "Happy/Squint" Eyes */
  .eye.closed {
    height: 12px;
    width: 28px;
    border-radius: 0 0 20px 20px;
    background: transparent;
    border: 5px solid #ff5722;
    border-top: none;
    box-shadow: none;
    filter: drop-shadow(0 0 10px #ff5722);
    margin-top: 10px;
  }
  .eye.closed .pupil { display: none; }

  /* Thruster Engine */
  .thruster {
    width: 60px;
    height: 25px;
    background: #2a2d35;
    border-radius: 0 0 30px 30px;
    margin-top: -10px;
    z-index: 1;
    position: relative;
    box-shadow: inset 0 -3px 5px rgba(0,0,0,0.5);
  }

  /* Exhaust Flame */
  .flame {
    width: 36px;
    height: 55px;
    background: linear-gradient(to bottom, #ffeb3b, #ff5722, transparent);
    border-radius: 50%;
    position: absolute;
    top: 20px;
    left: 12px;
    animation: flicker 0.1s infinite alternate;
    filter: blur(4px);
    opacity: 0.9;
  }

  @keyframes flicker {
    0% { transform: scaleY(1) scaleX(0.9); opacity: 0.8; }
    100% { transform: scaleY(1.3) scaleX(1.1); opacity: 1; }
  }

  /* Glassmorphism Form */
  .auth-container {
    width: 480px;
    background: rgba(25, 28, 36, 0.6);
    border-radius: 25px;
    padding: 40px 40px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.5), inset 0 0 0 1px rgba(255, 87, 34, 0.2);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    display: flex;
    flex-direction: column;
    gap: 15px;
    position: relative;
  }
  
  .auth-container::before {
    content: '';
    position: absolute;
    top: 0; left: 0; width: 100%; height: 5px;
    background: linear-gradient(90deg, #ff5722, #ff8a65, #ff5722);
    background-size: 200% 100%;
    animation: gradientMove 3s linear infinite;
  }
  
  @keyframes gradientMove {
    0% { background-position: 100% 0; }
    100% { background-position: -100% 0; }
  }

  .auth-container h2 {
    color: #fff;
    margin-bottom: 5px;
    font-size: 1.8rem;
    font-weight: 700;
    text-shadow: 0 2px 10px rgba(255, 87, 34, 0.3);
  }
  .auth-container h2 span {
    color: #ff5722;
  }

  .error-msg {
    color: #ff5252;
    background: rgba(255, 82, 82, 0.1);
    border: 1px solid rgba(255, 82, 82, 0.3);
    padding: 10px;
    border-radius: 8px;
    text-align: center;
    font-size: 0.9rem;
  }

  .input-row {
    display: flex;
    gap: 15px;
  }
  .input-row > input { flex: 1; }

  input, select {
    width: 100%;
    padding: 14px 16px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    background: rgba(0, 0, 0, 0.3);
    font-size: 0.95rem;
    color: #fff;
    transition: all 0.3s;
  }
  select { color: #ccc; cursor: pointer; }
  select option { background: #191c24; color: #fff; }
  
  input:focus, select:focus {
    background: rgba(0, 0, 0, 0.5);
    border-color: #ff5722;
    outline: none;
    box-shadow: 0 0 15px rgba(255, 87, 34, 0.3);
  }
  input::placeholder { color: #888; }

  button {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #ff5722, #e64a19);
    color: white;
    font-size: 1.15rem;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    margin-top: 5px;
    box-shadow: 0 8px 20px rgba(255, 87, 34, 0.3);
  }
  button:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 25px rgba(255, 87, 34, 0.5);
  }

  .toggle {
    color: #aaa;
    text-align: center;
    font-size: 0.95rem;
    margin-top: 5px;
  }
  .toggle a { 
    color: #ff5722; 
    text-decoration: none;
    transition: 0.3s;
  }
  .toggle a:hover {
    text-decoration: underline;
  }

  @media (max-width: 768px) {
    .container { flex-direction: column; gap: 40px; }
    .drone { transform: scale(0.8); }
    .auth-container { width: 100%; max-width: 400px; }
    .input-row { flex-direction: column; gap: 15px; }
  }
</style>
</head>
<body>
  <!-- Ambient Orbs -->
  <div class="bg-orb orb-1"></div>
  <div class="bg-orb orb-2"></div>

  <div class="container">
    <!-- Sleek Anime/Sci-Fi Drone -->
    <div class="drone">
      <div class="drone-body">
        <div class="visor">
          <div class="eye"><div class="pupil"></div></div>
          <div class="eye"><div class="pupil"></div></div>
        </div>
      </div>
      <div class="thruster">
        <div class="flame"></div>
      </div>
    </div>

    <!-- Register Form -->
    <form class="auth-container" id="auth-container" action="/register" method="POST">
      <h2>Join <span>IgniteOne</span></h2>
      
      <% String error = (String) request.getAttribute("error"); %>
      <% if (error != null) { %>
        <div class="error-msg"><%= error %></div>
      <% } %>

      <div class="input-row">
        <input type="text" id="username" name="username" placeholder="Username" required />
        <input type="email" id="email" name="email" placeholder="Email Address" required />
      </div>

      <input type="text" id="organization" name="organization" placeholder="University / School / Organization" required />
      
      <div class="input-row">
        <select id="role" name="role" required>
          <option value="" disabled selected>Select Role</option>
          <option value="student">Student</option>
          <option value="recruiter">Recruiter</option>
          <option value="admin">Admin</option>
        </select>
        <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number (Optional)" />
      </div>

      <input type="password" id="password" name="password" placeholder="Password (Min 6 chars)" minlength="6" required />
      
      <button type="submit">Create Account</button>
      <div class="toggle">Already have an account? <a href="/login">Login here</a></div>
    </form>
  </div>

<script>
  // Advanced Eye Tracking
  const eyes = document.querySelectorAll(".eye");
  const droneBody = document.querySelector(".drone-body");

  document.addEventListener("mousemove", (e) => {
    const rotateY = (e.clientX - window.innerWidth / 2) / 15; 
    const rotateX = -(e.clientY - window.innerHeight / 2) / 15;
    droneBody.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;

    eyes.forEach((eye) => {
      const pupil = eye.querySelector(".pupil");
      if (!pupil) return; 
      
      const rect = eye.getBoundingClientRect();
      const eyeCenterX = rect.left + rect.width / 2;
      const eyeCenterY = rect.top + rect.height / 2;

      const dx = e.clientX - eyeCenterX;
      const dy = e.clientY - eyeCenterY;

      const maxDistance = 10;
      const angle = Math.atan2(dy, dx);
      const distance = Math.min(maxDistance, Math.hypot(dx, dy) / 10);

      const moveX = Math.cos(angle) * distance;
      const moveY = Math.sin(angle) * distance;

      pupil.style.transform = `translate(${moveX}px, ${moveY}px)`;
    });
  });

  // Anime "Happy/Squint" eyes on password focus
  const passwordField = document.getElementById("password");
  passwordField.addEventListener("focus", () => eyes.forEach(e => e.classList.add("closed")));
  passwordField.addEventListener("blur", () => eyes.forEach(e => e.classList.remove("closed")));
</script>
</body>
</html>
