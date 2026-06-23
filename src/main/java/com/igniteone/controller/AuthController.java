package com.igniteone.controller;

import com.igniteone.model.User;
import com.igniteone.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {
        
        User user = userService.authenticate(username, password);
        
        if (user == null) {
            model.addAttribute("error", "Invalid username or password.");
            return "login";
        }

        session.setAttribute("loggedInUser", user);

        // Route based on role
        if ("student".equalsIgnoreCase(user.getRole())) {
            return "redirect:/student_dashboard";
        } else if ("recruiter".equalsIgnoreCase(user.getRole())) {
            return "redirect:/recruiters_dashboard";
        } else if ("admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/admin_dashboard";
        }

        return "redirect:/";
    }

    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";
    }

    @PostMapping("/register")
    public String processRegister(@RequestParam("username") String username,
                                  @RequestParam("email") String email,
                                  @RequestParam("password") String password,
                                  @RequestParam("role") String role,
                                  @RequestParam("organization") String organization,
                                  @RequestParam(value = "phoneNumber", required = false) String phoneNumber,
                                  Model model) {
        
        // Validation
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            role == null || role.trim().isEmpty() ||
            organization == null || organization.trim().isEmpty()) {
            model.addAttribute("error", "All required fields must be filled!");
            return "register";
        }

        if (password.length() < 6) {
            model.addAttribute("error", "Password must be at least 6 characters long.");
            return "register";
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            model.addAttribute("error", "Invalid email format.");
            return "register";
        }

        if (userService.findByUsername(username) != null) {
            model.addAttribute("error", "Username already exists.");
            return "register";
        }
        
        if (userService.findByEmail(email) != null) {
            model.addAttribute("error", "Email already exists.");
            return "register";
        }

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password); // Insecure demo password
        user.setRole(role);
        user.setOrganization(organization);
        if (phoneNumber != null && !phoneNumber.trim().isEmpty()) {
            user.setPhoneNumber(phoneNumber);
        }
        
        userService.registerUser(user);

        // Optional: you can redirect to login with a success parameter or message
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
