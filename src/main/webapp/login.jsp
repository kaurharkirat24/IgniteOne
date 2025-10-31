<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>IgniteOne | Login</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
  }
  body {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: radial-gradient(circle at top, #0a0a0a, #1a0a0a, #111111);
    overflow: hidden;
    color: white;
  }

  /* Floating particles */
  .particle {
    position: absolute;
    width: 6px;
    height: 6px;
    background: radial-gradient(circle, #0ff, #0af);
    border-radius: 50%;
    opacity: 0.7;
    animation: rise 6s linear infinite;
  }
  @keyframes rise {
    0% { transform: translateY(0) scale(1); opacity: 1; }
    100% { transform: translateY(-800px) scale(0.2); opacity: 0; }
  }

  /* Container */
  .container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 50px;
    width: 90%;
    max-width: 1000px;
  }

  /* Robot mascot */
  .robot {
    position: relative;
    width: 220px;
    height: 400px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
  }

  .robot-head {
    width: 120px;
    height: 120px;
    background: #222;
    border: 3px solid #0ff;
    border-radius: 20px;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 0 20px #0ff;
  }

  .eye {
    width: 30px;
    height: 30px;
    background: #fff;
    border-radius: 50%;
    margin: 0 15px;
    position: relative;
    overflow: hidden;
  }
  .pupil {
    width: 14px;
    height: 14px;
    background: #0ff;
    border-radius: 50%;
    position: absolute;
    top: 8px;
    left: 8px;
    transition: transform 0.1s linear;
  }
  .eye.closed {
    height: 6px;
    border-radius: 3px;
    background: #0ff;
  }

  .antenna {
    width: 4px;
    height: 20px;
    background: #0ff;
    position: absolute;
    top: -20px;
  }
  .antenna.left { left: 20px; }
  .antenna.right { right: 20px; }

  .robot-body {
    position: relative;
    width: 100px;
    height: 150px;
    background: #222;
    border: 3px solid #0ff;
    margin-top: 10px;
    border-radius: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 0 20px #0ff;
  }

  .arm {
    position: absolute;
    top: 50%;
    width: 20px;
    height: 80px;
    background: #222;
    border: 3px solid #0ff;
    border-radius: 10px;
    box-shadow: 0 0 15px #0ff;
    transform: translateY(-50%);
    transition: transform 0.3s;
  }
  .left-arm { left: -25px; }
  .right-arm { right: -25px; }
  .robot:hover .arm { transform: translateY(-50%) rotate(-10deg); }

  .legs {
    width: 120px;
    display: flex;
    justify-content: space-between;
    margin-top: 5px;
  }
  .leg {
    width: 25px;
    height: 80px;
    background: #222;
    border: 3px solid #0ff;
    border-radius: 10px;
    box-shadow: 0 0 15px #0ff;
  }

  /* Form */
  .auth-container {
    width: 400px;
    background: rgba(0, 0, 0, 0.8);
    border-radius: 25px;
    padding: 40px 35px;
    box-shadow: 0 0 40px rgba(0, 255, 255, 0.4);
    backdrop-filter: blur(10px);
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .auth-container h2 {
    color: #0ff;
    margin-bottom: 20px;
    text-shadow: 0 0 10px #0ff;
  }

  input, select {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.05);
    font-size: 1rem;
    margin-bottom: 10px;
  }
  input { color: white; }
  select { color: grey; }
  input:focus, select:focus {
    background: rgba(255, 255, 255, 0.15);
    outline: none;
    box-shadow: 0 0 10px #0ff;
  }

  button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(90deg, #0ff, #0aa);
    color: white;
    font-size: 1.1rem;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
  }
  button:hover {
    transform: scale(1.05);
    box-shadow: 0 0 15px #0ff;
  }

  .toggle {
    color: #0ff;
    cursor: pointer;
    text-align: center;
    font-size: 0.9rem;
  }
  .toggle:hover { text-decoration: underline; }
</style>
</head>
<body>
  <!-- Floating Particles -->
  <script>
    for (let i = 0; i < 40; i++) {
      const p = document.createElement("div");
      p.classList.add("particle");
      p.style.left = Math.random() * window.innerWidth + "px";
      p.style.bottom = Math.random() * -200 + "px";
      p.style.animationDelay = Math.random() * 5 + "s";
      document.body.appendChild(p);
    }
  </script>

  <div class="container">
    <!-- Robot Mascot -->
    <div class="robot">
      <div class="robot-head">
        <div class="antenna left"></div>
        <div class="antenna right"></div>
        <div class="eye" id="eye-left"><div class="pupil" id="pupil-left"></div></div>
        <div class="eye" id="eye-right"><div class="pupil" id="pupil-right"></div></div>
      </div>
      <div class="robot-body">
        <div class="arm left-arm"></div>
        <div class="arm right-arm"></div>
      </div>
      <div class="legs">
        <div class="leg"></div>
        <div class="leg"></div>
      </div>
    </div>

    <!-- Auth Form -->
    <form class="auth-container" id="auth-container" onsubmit="return validateForm()">
      <h2 id="form-title">Login to IgniteOne</h2>
      <input type="text" id="username" placeholder="Username" required />
      <input type="email" id="email" placeholder="Email" required />
      <input type="password" id="password" placeholder="Password" required />
      <select id="role" required>
        <option value="" disabled selected>Select Role</option>
        <option value="student">Student</option>
        <option value="recruiter">Recruiter</option>
        <option value="admin">Admin</option>
      </select>
      <button type="submit" id="auth-button">Login</button>
      <div class="toggle" id="toggle">Don't have an account? Register</div>
    </form>
  </div>

<script>
  // Eye movement (works correctly)
  const eyes = document.querySelectorAll(".eye");

  document.addEventListener("mousemove", (e) => {
    eyes.forEach((eye) => {
      const pupil = eye.querySelector(".pupil");
      const rect = eye.getBoundingClientRect();
      const eyeCenterX = rect.left + rect.width / 2;
      const eyeCenterY = rect.top + rect.height / 2;

      const dx = e.clientX - eyeCenterX;
      const dy = e.clientY - eyeCenterY;

      const maxMove = 6; // pupil movement limit
      const moveX = Math.max(-maxMove, Math.min(maxMove, dx / 15));
      const moveY = Math.max(-maxMove, Math.min(maxMove, dy / 15));

      pupil.style.transform = `translate(${moveX}px, ${moveY}px)`;
    });
  });

  // Eyes close on password focus
  const passwordField = document.getElementById("password");
  passwordField.addEventListener("focus", () => eyes.forEach(e => e.classList.add("closed")));
  passwordField.addEventListener("blur", () => eyes.forEach(e => e.classList.remove("closed")));

  // Toggle login/register
  const toggle = document.getElementById("toggle");
  const formTitle = document.getElementById("form-title");
  const authButton = document.getElementById("auth-button");
  let isLogin = true;
  toggle.addEventListener("click", () => {
    isLogin = !isLogin;
    formTitle.textContent = isLogin ? "Login to IgniteOne" : "Register for IgniteOne";
    authButton.textContent = isLogin ? "Login" : "Register";
    toggle.textContent = isLogin
      ? "Don't have an account? Register"
      : "Already have an account? Login";
  });

  // Form validation
  function validateForm() {
    const username = document.getElementById("username").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const role = document.getElementById("role").value;

    if (!username || !email || !password || !role) {
      alert("All fields are mandatory!");
      return false;
    }

    if (role === "student") window.location.href = "student_dashboard.jsp";
    else if (role === "recruiter") window.location.href = "recruiters_dashboard.jsp";
    else if (role === "admin") window.location.href = "admin_dashboard.jsp";

    return false; // prevent actual form submission
  }
</script>
</body>
</html>
