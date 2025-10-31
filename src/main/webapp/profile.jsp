<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>IgniteOne | My Profile</title>
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
      background: linear-gradient(to right, #ff774c, #ff5722);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #333;
    }

    .profile-container {
      width: 90%;
      max-width: 950px;
      background: white;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.2);
      overflow: hidden;
      display: flex;
      flex-wrap: wrap;
      position: relative;
    }

    .left-panel {
      flex: 1 1 35%;
      background: url('https://images.unsplash.com/photo-1522199710521-72d69614c702?auto=format&fit=crop&w=800&q=80') center/cover no-repeat;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      color: white;
      padding: 2rem;
      position: relative;
    }

    .overlay {
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.6);
      z-index: 0;
    }

    .left-panel-content {
      z-index: 1;
      text-align: center;
    }

    .profile-pic {
      width: 130px;
      height: 130px;
      border-radius: 50%;
      border: 4px solid white;
      object-fit: cover;
      margin-bottom: 1rem;
      box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }

    .left-panel-content h2 {
      font-size: 1.5rem;
      margin-bottom: 0.3rem;
    }

    .left-panel-content p {
      font-size: 0.95rem;
      opacity: 0.9;
    }

    .right-panel {
      flex: 1 1 65%;
      padding: 2rem;
    }

    h3 {
      color: #ff5722;
      margin-bottom: 1rem;
      font-weight: 700;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    label {
      font-weight: 600;
      font-size: 0.9rem;
      color: #555;
    }

    input, select, textarea {
      padding: 0.7rem 1rem;
      border-radius: 10px;
      border: 1px solid #ccc;
      outline: none;
      transition: 0.3s;
      font-size: 1rem;
      width: 100%;
    }

    input:focus, select:focus, textarea:focus {
      border-color: #ff5722;
      box-shadow: 0 0 6px rgba(255,87,34,0.3);
    }

    .update-btn {
      margin-top: 1rem;
      padding: 0.9rem;
      background: #ff5722;
      border: none;
      color: white;
      border-radius: 10px;
      font-weight: 600;
      font-size: 1rem;
      cursor: pointer;
      transition: 0.3s;
    }

    .update-btn:hover {
      background: #e64a19;
      transform: translateY(-2px);
    }

    .stats {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      margin-top: 1.8rem;
      background: #fff5f0;
      padding: 1rem;
      border-radius: 15px;
      box-shadow: 0 5px 10px rgba(0,0,0,0.05);
    }

    .stat-box {
      text-align: center;
      flex: 1 1 30%;
      margin: 0.5rem;
      padding: 0.8rem;
      background: white;
      border-radius: 10px;
      box-shadow: 0 3px 8px rgba(0,0,0,0.05);
      transition: 0.3s;
    }

    .stat-box:hover {
      transform: scale(1.05);
    }

    .stat-number {
      color: #ff5722;
      font-size: 1.6rem;
      font-weight: 700;
    }

    .stat-label {
      color: #555;
      font-size: 0.9rem;
    }

    @media (max-width: 800px) {
      .profile-container {
        flex-direction: column;
      }
      .left-panel {
        height: 280px;
      }
      .stats {
        flex-direction: column;
        gap: 0.8rem;
      }
    }
  </style>
</head>

<body>
  <div class="profile-container">

    <!-- LEFT PANEL -->
    <div class="left-panel">
      <div class="overlay"></div>
      <div class="left-panel-content">
        <img src="https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=800&q=80"
             alt="Profile Picture" class="profile-pic">
        <h2>Harkirat Kaur</h2>
        <p>Computer Science | Panjab University</p>
      </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">
      <h3>My Profile</h3>
      <form>
        <label>Full Name</label>
        <input type="text" value="Harkirat Kaur" required>

        <label>Email</label>
        <input type="email" value="harkirat@pu.ac.in" required>

        <label>Department</label>
        <select>
          <option selected>Computer Science</option>
          <option>Information Technology</option>
          <option>Electronics</option>
          <option>Mechanical</option>
        </select>

        <label>About Me</label>
        <textarea rows="3" placeholder="A short description about yourself...">Passionate developer and researcher focused on AI and community innovation.</textarea>

        <button type="submit" class="update-btn">Update Profile</button>
      </form>

      <!-- STATS -->
      <div class="stats">
        <div class="stat-box">
          <div class="stat-number">4</div>
          <div class="stat-label">My Projects</div>
        </div>
        <div class="stat-box">
          <div class="stat-number">₹12,500</div>
          <div class="stat-label">Funds Raised</div>
        </div>
        <div class="stat-box">
          <div class="stat-number">6</div>
          <div class="stat-label">Donations Made</div>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Success message simulation
    const form = document.querySelector("form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      alert("Profile updated successfully!");
    });
  </script>

</body>
</html>
