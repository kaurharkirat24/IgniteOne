package com.igniteone.controller;

import com.igniteone.model.Project;
import com.igniteone.model.User;
import com.igniteone.service.ProjectService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.igniteone.service.S3FileUploadService;

import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private S3FileUploadService s3FileUploadService;

    @GetMapping("/")
    public String home() {
        return "index"; // Maps to /WEB-INF/jsp/index.jsp
    }

    @GetMapping("/student_dashboard")
    public String studentDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"student".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }
        
        List<Project> projects = projectService.getAllProjects(); // For now showing all
        model.addAttribute("user", user);
        model.addAttribute("projects", projects);
        
        return "student_dashboard";
    }

    @PostMapping("/add_project")
    public String addProject(@RequestParam("title") String title,
                             @RequestParam("description") String description,
                             @RequestParam("goal") Double goal,
                             @RequestParam(value = "image", required = false) MultipartFile image,
                             HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null && "student".equalsIgnoreCase(user.getRole())) {
            Project p = new Project();
            p.setTitle(title);
            p.setDescription(description);
            p.setFundingGoal(goal);
            
            try {
                if (image != null && !image.isEmpty()) {
                    String imageUrl = s3FileUploadService.uploadFile(image);
                    p.setImageUrl(imageUrl);
                }
            } catch (Exception e) {
                e.printStackTrace(); // In production, add proper error handling
            }
            
            p.setOwner(user);
            projectService.saveProject(p);
        }
        return "redirect:/student_dashboard";
    }

    @GetMapping("/project_showcase")
    public String projectShowcase(Model model) {
        List<Project> projects = projectService.getAllProjects();
        model.addAttribute("projects", projects);
        return "project_showcase";
    }
}
