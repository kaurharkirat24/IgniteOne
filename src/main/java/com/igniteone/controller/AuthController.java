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
                               @RequestParam("role") String role,
                               @RequestParam(value = "email", required = false) String email,
                               HttpSession session,
                               Model model) {
        
        // Temporarily, we can auto-register the user if they don't exist for demo purposes
        // or just validate
        User user = userService.authenticate(username, password);
        
        if (user == null) {
            // Auto register for ease of use in demo
            user = new User();
            user.setUsername(username);
            user.setPassword(password); // insecure, but ok for demo
            user.setEmail(email != null && !email.isEmpty() ? email : username + "@test.com");
            user.setRole(role);
            user = userService.registerUser(user);
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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
