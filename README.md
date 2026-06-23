# IgniteOne 🚀

**IgniteOne** is a web-based crowdfunding and project showcase platform built specifically for students, alumni, and recruiters. It empowers students to pitch innovative ideas, receive funding support, and gain visibility among potential mentors and employers. Recruiters can discover talented individuals and support real-world innovation right from campus.

## 🌟 Key Features

*   **💡 Project Showcasing:** Students can upload their project details, media, and tech stack, allowing the world to see their innovation.
*   **💰 Crowdfunding:** Receive small donations from peers, alumni, and sponsors to bring ideas to life.
*   **🎯 Recruiter Connect:** Companies can browse projects and connect with students for internships and career opportunities.
*   **🤝 Alumni Mentorship:** Alumni can fund or mentor projects, strengthening the bond within the campus community.
*   **📊 Role-Based Dashboards:** Dedicated dashboards for Students, Recruiters, and Administrators.

## 🛠️ Tech Stack

*   **Frontend:** HTML5, CSS3, JSP (JavaServer Pages)
*   **Backend:** Java (Servlets/JSP architecture)
*   **Database:** MariaDB (via JDBC)
*   **IDE Support:** Eclipse (Native `.project` and `.classpath` configuration included)

## 🚀 Getting Started

Follow these instructions to get the project up and running on your local machine for development and testing purposes.

### Prerequisites

*   **Java Development Kit (JDK):** Version 8 or higher.
*   **Web Server:** Apache Tomcat (version 9+ recommended).
*   **Database:** MariaDB Server.
*   **IDE:** Eclipse IDE for Enterprise Java and Web Developers (recommended).

### Database Setup

1.  Ensure your MariaDB server is running.
2.  Create a new database named `igniteone_db`:
    ```sql
    CREATE DATABASE igniteone_db;
    ```
3.  The application connects using the default credentials. If your MariaDB setup uses different credentials, update `src/main/java/com/igniteone/dao/DBConnection.java`:
    ```java
    private static final String URL = "jdbc:mariadb://localhost:3306/igniteone_db";
    private static final String USER = "root";  
    private static final String PASSWORD = "root"; 
    ```
4.  *(Note: You may need to create the required tables depending on the DB schema. Check the source files or provided SQL scripts if available).*

### Installation & Execution

1.  **Clone / Download** the repository to your local machine.
2.  **Import into Eclipse:**
    *   Open Eclipse and navigate to `File -> Import`.
    *   Select `General -> Existing Projects into Workspace`.
    *   Browse to the directory where you cloned/downloaded IgniteOne and select it.
    *   Click `Finish`.
3.  **Add Server Runtime:**
    *   Right-click the project in the Project Explorer -> `Properties` -> `Targeted Runtimes`.
    *   Select your Apache Tomcat server.
4.  **Run the Project:**
    *   Right-click the project -> `Run As` -> `Run on Server`.
    *   Select your Tomcat server and click `Finish`.
    *   The application should launch in your default browser at `http://localhost:8080/IgniteOne/` (or similar depending on your Tomcat config).

## 📁 Project Structure

```text
IgniteOne/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/igniteone/dao/      # Database Connection and DAO layer
│       │       └── DBConnection.java
│       └── webapp/                     # Frontend JSP, HTML, CSS files
│           ├── index.html              # Main Landing Page
│           ├── login.jsp               # Authentication Page
│           ├── student_dashboard.jsp   # Student Portal
│           ├── recruiters_dashboard.jsp# Recruiter Portal
│           ├── admin_dashboard.jsp     # Admin Portal
│           ├── project_showcase.jsp    # Browse Projects
│           ├── project_details.jsp     # Individual Project View
│           ├── events.jsp              # Event Listing
│           ├── donations.jsp           # Crowdfunding Page
│           └── ...
```

## 👥 Authors

*   **Harkirat** 
*   **Ashutosh**

---
© 2025 IgniteOne. All rights reserved.
