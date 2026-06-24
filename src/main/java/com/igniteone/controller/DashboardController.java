package com.igniteone.controller;

import com.igniteone.model.Project;
import com.igniteone.model.User;
import com.igniteone.service.ProjectService;
import com.igniteone.service.UserService;
import com.igniteone.service.EventService;
import com.igniteone.service.DonationService;
import com.igniteone.service.EventRegistrationService;
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
    private UserService userService;

    @Autowired
    private EventService eventService;

    @Autowired
    private DonationService donationService;

    @Autowired
    private EventRegistrationService eventRegistrationService;

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
        
        List<Project> userProjects = projects.stream()
                .filter(p -> p.getOwner() != null && p.getOwner().getId().equals(user.getId()))
                .toList();
                
        double totalRaised = userProjects.stream()
                .mapToDouble(p -> p.getCurrentFunding() != null ? p.getCurrentFunding() : 0.0).sum();
        double totalGoal = userProjects.stream()
                .mapToDouble(p -> p.getFundingGoal() != null ? p.getFundingGoal() : 0.0).sum();
        int progressPercentage = totalGoal > 0 ? (int) ((totalRaised / totalGoal) * 100) : 0;

        model.addAttribute("user", user);
        model.addAttribute("projects", projects);
        model.addAttribute("userProjectsCount", userProjects.size());
        model.addAttribute("totalRaised", totalRaised);
        model.addAttribute("totalGoal", totalGoal);
        model.addAttribute("progressPercentage", progressPercentage);
        
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

    @GetMapping("/recruiters_dashboard")
    public String recruitersDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"recruiter".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        model.addAttribute("projects", projectService.getAllProjects());
        return "recruiters_dashboard";
    }

    @GetMapping("/admin_dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }
        model.addAttribute("user", user);
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("projects", projectService.getAllProjects());
        model.addAttribute("events", eventService.getAllEvents());
        model.addAttribute("donations", donationService.getAllDonations());
        return "admin_dashboard";
    }

    @GetMapping("/events")
    public String events(Model model) {
        model.addAttribute("events", eventService.getAllEvents());
        return "events";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/donations")
    public String donations(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
        model.addAttribute("projects", projectService.getAllProjects());
        return "donations";
    }

    @PostMapping("/donate")
    public String processDonation(@RequestParam("projectId") Long projectId,
                                  @RequestParam("amount") Double amount,
                                  HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        donationService.processDonation(projectId, user, amount);
        return "redirect:/donations?success=true";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam("email") String email,
                                @RequestParam("organization") String organization,
                                @RequestParam(value = "aboutMe", required = false) String aboutMe,
                                HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        // Assuming we are updating the current user object in session
        user.setEmail(email);
        user.setOrganization(organization);
        user.setAboutMe(aboutMe);
        userService.registerUser(user); // Reuse registerUser for saving updates
        session.setAttribute("loggedInUser", user);
        return "redirect:/profile?success=true";
    }

    @GetMapping("/project_details")
    public String projectDetails(@RequestParam(value = "projectId", required = false) String projectId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
        // In the future, use the projectId to fetch dynamic project details from projectService
        return "project_details";
    }

    @GetMapping("/register_event")
    public String registerEvent(@RequestParam(value = "event", required = false) String event, 
                                @RequestParam(value = "eventId", required = false) Long eventId,
                                HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
        model.addAttribute("eventId", eventId);
        return "register_event";
    }

    @PostMapping("/register_event_submit")
    public String registerEventSubmit(@RequestParam("eventId") Long eventId, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        eventRegistrationService.registerForEvent(eventId, user);
        return "redirect:/events?success=true";
    }
}
