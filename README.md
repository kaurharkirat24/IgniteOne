# IgniteOne 🚀

**IgniteOne** is a web-based crowdfunding and project showcase platform built specifically for students, alumni, and recruiters. It empowers students to pitch innovative ideas, receive funding support, and gain visibility among potential mentors and employers. Recruiters can discover talented individuals and support real-world innovation right from campus.

## 🌟 Key Features

*   **💡 Project Showcasing:** Students can upload their project details, media, and tech stack, allowing the world to see their innovation. Images are securely hosted on AWS S3.
*   **💰 Dynamic Crowdfunding:** Process real donations from peers, alumni, and sponsors that dynamically update project funding goals in real-time.
*   **🎯 Recruiter Connect:** Companies can browse projects, search by categories (AI, IoT, Web), and connect with students for internships and career opportunities.
*   **📅 Event Registrations:** Discover department fests, hackathons, and easily register with a single click.
*   **📊 Role-Based Dashboards:** Secure, intercepted dashboards for Students, Recruiters, and Administrators.
*   **👤 Custom Profiles:** Users can update their personal information, organizations, and "About Me" biographies.

## 🛠️ Tech Stack

*   **Frontend:** HTML5, CSS3, JSP (JavaServer Pages), JSTL, Vanilla JavaScript
*   **Backend:** Java 17, Spring Boot 3, Spring MVC, Spring Data JPA, Hibernate
*   **Database:** MySQL (JDBC)
*   **Cloud Storage:** Amazon S3 (AWS SDK for Java)
*   **Build Tool:** Maven

## 🚀 Getting Started

Follow these instructions to get the project up and running on your local machine for development and testing purposes.

### Prerequisites

*   **Java Development Kit (JDK):** Version 17 or higher.
*   **Maven:** Installed and configured in your system PATH.
*   **Database:** MySQL Server.
*   **AWS Account:** For S3 Image Uploads.

### Environment & Database Setup

1.  Ensure your MySQL server is running.
2.  Create a new database named `igniteone_db`:
    ```sql
    CREATE DATABASE igniteone_db;
    ```
3.  Create a `.env` file in the root directory (`IgniteOne/.env`) to configure your secure environment variables:
    ```env
    MYSQL_PASSWORD=your_mysql_password
    AWS_ACCESS_KEY_ID=your_aws_key
    AWS_SECRET_ACCESS_KEY=your_aws_secret
    AWS_REGION=your_aws_region
    AWS_S3_BUCKET=your_s3_bucket_name
    ```
4.  *(Note: Hibernate `ddl-auto=update` is enabled in `application.properties`, meaning the application will automatically create all necessary database tables for you upon startup!).*

### Installation & Execution

1.  **Clone / Download** the repository to your local machine.
2.  **Open Terminal / Command Prompt** and navigate to the project root directory.
3.  **Compile the Project:**
    ```bash
    mvn clean compile
    ```
4.  **Run the Spring Boot Application:**
    ```bash
    mvn spring-boot:run
    ```
5.  **Access the Application:**
    *   The application will launch with an embedded Tomcat server. Open your browser and navigate to `http://localhost:8080`.

## 📁 Project Structure

```text
IgniteOne/
├── src/
│   ├── main/
│   │   ├── java/com/igniteone/
│   │   │   ├── config/          # Spring MVC & Interceptor Configurations
│   │   │   ├── controller/      # Spring MVC Controllers (DashboardController, AuthController)
│   │   │   ├── interceptor/     # Security Interceptors (AuthInterceptor)
│   │   │   ├── model/           # JPA Entities (User, Project, Event, Donation)
│   │   │   ├── repository/      # Spring Data JPA Interfaces
│   │   │   └── service/         # Business Logic & AWS S3 Uploads
│   │   │
│   │   ├── resources/           
│   │   │   └── application.properties # Spring Boot configuration
│   │   │
│   │   └── webapp/WEB-INF/jsp/  # Frontend Views
│   │       ├── index.jsp              # Main Landing Page
│   │       ├── login.jsp / register.jsp # Authentication
│   │       ├── student_dashboard.jsp  # Student Portal
│   │       ├── recruiters_dashboard.jsp# Recruiter Portal
│   │       ├── project_showcase.jsp   # Browse Projects
│   │       └── ...
│   │
├── pom.xml                      # Maven Dependencies
└── .env                         # Environment Variables (Ignored by Git)
```

## 👥 Authors

*   **Harkirat** 
*   **Ashutosh**

---
© 2026 IgniteOne. All rights reserved.
