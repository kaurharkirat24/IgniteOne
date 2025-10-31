<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>IgniteOne | Admin Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    * {margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}
    html {scroll-behavior: smooth;}
    body {
      display: flex;
      min-height: 100vh;
      background: linear-gradient(135deg, #f9fafc 0%, #f3f4f6 100%);
      color: #333;
    }

    /* SIDEBAR */
    .sidebar {
      width: 260px;
      background: linear-gradient(180deg, #ff7043 0%, #ff5722 100%);
      color: white;
      padding: 2rem 1rem;
      position: fixed;
      height: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      box-shadow: 4px 0 20px rgba(0,0,0,0.15);
      border-top-right-radius: 25px;
      border-bottom-right-radius: 25px;
      transition: width 0.3s ease;
    }

    .sidebar:hover { width: 280px; }

    .sidebar h2 {
      margin-bottom: 2rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-size: 1.4rem;
    }

    .sidebar a {
      color: white;
      text-decoration: none;
      display: block;
      width: 90%;
      text-align: left;
      padding: 0.9rem 1rem;
      border-radius: 12px;
      margin: 0.3rem 0;
      transition: all 0.3s ease;
      font-weight: 500;
      position: relative;
    }

    .sidebar a:hover, .sidebar a.active {
      background: rgba(255,255,255,0.15);
      transform: translateX(5px);
    }

    /* MAIN CONTENT */
    .main-content {
      margin-left: 260px;
      padding: 2rem 2.5rem;
      width: calc(100% - 260px);
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
      border-bottom: 2px solid #ffe5dc;
      padding-bottom: 1rem;
    }

    .header h1 { color: #ff5722; font-size: 1.9rem; }

    .profile {
      display: flex;
      align-items: center;
      gap: 1rem;
      background: white;
      padding: 0.5rem 1rem;
      border-radius: 30px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .profile img {
      width: 45px; height: 45px;
      border-radius: 50%;
      border: 2px solid #ff5722;
      transition: transform 0.3s;
    }

    .profile img:hover { transform: scale(1.1); }

    /* SECTION */
    .section { margin-bottom: 3rem; scroll-margin-top: 100px; }
    .section h2 {
      color: #ff5722;
      margin-bottom: 1rem;
      border-left: 5px solid #ff5722;
      padding-left: 10px;
      font-size: 1.3rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    /* TABLE */
    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      overflow: hidden;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from {opacity: 0;transform: translateY(15px);}
      to {opacity: 1;transform: translateY(0);}
    }

    th, td {
      padding: 1rem;
      text-align: left;
      border-bottom: 1px solid #f0f0f0;
      font-size: 0.95rem;
    }
    th { background: #fff3ee; color: #333; text-transform: uppercase; font-weight: 600; }
    tr:hover { background: #fff8f5; transition: 0.2s; }

    .status {
      padding: 0.3rem 0.8rem;
      border-radius: 30px;
      font-weight: 600;
      font-size: 0.85rem;
      text-transform: capitalize;
    }
    .active { background: #e2f9e5; color: #1a7a27; }
    .banned { background: #ffe2e2; color: #d50000; }
    .pending { background: #fff7da; color: #b67c00; }

    button.action {
      padding: 0.6rem 1.3rem;
      border: none;
      border-radius: 10px;
      background: linear-gradient(90deg, #ff7043, #ff5722);
      color: white;
      cursor: pointer;
      font-weight: 600;
      transition: 0.3s;
      box-shadow: 0 4px 10px rgba(255,87,34,0.3);
    }

    button.action:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 15px rgba(255,87,34,0.4);
    }

    /* MODAL */
    .modal {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0,0,0,0.5);
      justify-content: center;
      align-items: center;
      backdrop-filter: blur(4px);
      z-index: 100;
    }

    .modal-content {
      background: white;
      padding: 2rem;
      border-radius: 20px;
      width: 90%;
      max-width: 500px;
      position: relative;
      box-shadow: 0 6px 25px rgba(0,0,0,0.2);
      animation: fadeIn 0.5s ease-in-out;
    }

    .modal-content h3 { color: #ff5722; margin-bottom: 1.2rem; font-size: 1.4rem; text-align: center; }
    .modal-content input, .modal-content textarea {
      width: 100%;
      margin-bottom: 1rem;
      padding: 0.9rem;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 1rem;
      transition: 0.3s;
    }
    .modal-content input:focus, .modal-content textarea:focus {
      border-color: #ff5722;
      outline: none;
      box-shadow: 0 0 5px rgba(255,87,34,0.4);
    }

    .modal-content button {
      display: block; width: 100%;
      background: linear-gradient(90deg, #ff7043, #ff5722);
      border: none; color: white;
      padding: 0.8rem 1.5rem;
      border-radius: 12px;
      cursor: pointer; font-weight: 600; transition: 0.3s;
    }

    .modal-content button:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 15px rgba(255,87,34,0.4);
    }

    .close {
      position: absolute;
      top: 10px; right: 15px;
      font-size: 1.8rem;
      color: #999; cursor: pointer; transition: 0.3s;
    }
    .close:hover { color: #ff5722; }

    @media (max-width: 768px) {
      .sidebar { display: none; }
      .main-content { margin: 0; padding: 1rem; width: 100%; }
      table { font-size: 0.85rem; }
      .header h1 { font-size: 1.5rem; }
    }
  </style>
</head>

<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="#dashboard" class="active">Dashboard</a>
    <a href="#user-management">User Management</a>
    <a href="#project-approval">Project Approval</a>
    <a href="#donation-tracking">Donation Tracking</a>
    <a href="#event-showcase">Event Showcase</a>
    <a href="#reports">Reports</a>
    <a href="#logout" id="logout-link">Logout</a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <div id="dashboard" class="header">
      <h1>Welcome, Admin</h1>
      <div class="profile">
        <img src="https://images.unsplash.com/photo-1607746882042-944635dfe10e?auto=format&fit=crop&w=500&q=80" alt="Admin">
        <span>Department of Computer Science and Applications</span>
      </div>
    </div>

    <!-- User Management -->
    <div class="section" id="user-management">
      <h2>User Management</h2>
      <table>
        <tr><th>Name</th><th>Email</th><th>Role</th><th>Status</th><th>Action</th></tr>
        <tr><td>Harkirat Kaur</td><td>harkirat@pu.ac.in</td><td>Student</td><td><span class="status active">Active</span></td><td><button class="action">Ban</button></td></tr>
        <tr><td>Rohit Sharma</td><td>rohit@pu.ac.in</td><td>Student</td><td><span class="status banned">Banned</span></td><td><button class="action">Unban</button></td></tr>
        <tr><td>Jasleen Kaur</td><td>jasleen@pu.ac.in</td><td>Recruiter</td><td><span class="status pending">Pending</span></td><td><button class="action">Approve</button></td></tr>
      </table>
    </div>

    <!-- Project Approval -->
    <div class="section" id="project-approval">
      <h2>Project Approval</h2>
      <table>
        <tr><th>Project Title</th><th>Student</th><th>Category</th><th>Status</th><th>Action</th></tr>
        <tr><td>AI Career Recommender</td><td>Harkirat Kaur</td><td>AI/ML</td><td><span class="status pending">Pending</span></td><td><button class="action">Approve</button></td></tr>
        <tr><td>Smart Irrigation System</td><td>Ananya Gupta</td><td>IoT</td><td><span class="status active">Approved</span></td><td><button class="action">Revoke</button></td></tr>
      </table>
    </div>

    <!-- Donation Tracking -->
    <div class="section" id="donation-tracking">
      <h2>Donation Tracking</h2>
      <table>
        <tr><th>Donor</th><th>Project</th><th>Amount (₹)</th><th>Date</th><th>Status</th></tr>
        <tr><td>Rahul Mehta</td><td>Campus Event Portal</td><td>₹500</td><td>22 Oct 2025</td><td><span class="status active">Verified</span></td></tr>
        <tr><td>Sneha Kapoor</td><td>AI Chatbot</td><td>₹1000</td><td>21 Oct 2025</td><td><span class="status pending">Pending</span></td></tr>
      </table>
      <br><button class="action" id="exportBtn">Export Report</button>
    </div>

    <!-- Event Showcase -->
    <div class="section" id="event-showcase">
      <h2>Event Showcase</h2>
      <table>
        <tr><th>Event Name</th><th>Date</th><th>Status</th><th>Action</th></tr>
        <tr><td>TechFest 2025</td><td>12 Nov 2025</td><td><span class="status active">Active</span></td><td><button class="action" onclick="openModal()">Edit</button></td></tr>
        <tr><td>Hackathon '25</td><td>18 Dec 2025</td><td><span class="status pending">Upcoming</span></td><td><button class="action" onclick="openModal()">Edit</button></td></tr>
      </table>
      <br><button class="action" onclick="openModal()">+ Add Event</button>
    </div>

    <!-- Reports -->
    <div class="section" id="reports">
      <h2>Reports</h2>
      <p>Download user, project, and donation analytics in Excel or PDF format.</p>
      <button class="action">Download Report</button>
    </div>
  </div>

  <!-- Modal -->
  <div class="modal" id="eventModal">
    <div class="modal-content">
      <span class="close" onclick="closeModal()">&times;</span>
      <h3>Add / Edit Event</h3>
      <input type="text" placeholder="Event Name" required>
      <input type="date" required>
      <textarea rows="3" placeholder="Event Description"></textarea>
      <button>Save Event</button>
    </div>
  </div>

  <script>
    const modal = document.getElementById("eventModal");
    function openModal() { modal.style.display = "flex"; }
    function closeModal() { modal.style.display = "none"; }
    window.onclick = e => { if (e.target === modal) closeModal(); };

    document.getElementById("exportBtn").addEventListener("click", () => {
      alert("Donation report exported successfully!");
    });

    // Sidebar active link handler
    const links = document.querySelectorAll(".sidebar a");
    links.forEach(link => {
      link.addEventListener("click", function() {
        links.forEach(l => l.classList.remove("active"));
        this.classList.add("active");
      });
    });

    // Logout behavior (demo)
    document.getElementById("logout-link").addEventListener("click", e => {
      e.preventDefault();
      alert("Logged out successfully!");
    });
  </script>
</body>
</html>
