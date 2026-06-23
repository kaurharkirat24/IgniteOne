package com.igniteone.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // Map simple URL paths directly to JSP views to avoid creating empty controller methods (DRY Principle)
        registry.addViewController("/about").setViewName("about");
        registry.addViewController("/contact").setViewName("contact");
        registry.addViewController("/events").setViewName("events");
        registry.addViewController("/donations").setViewName("donations");
        registry.addViewController("/profile").setViewName("profile");
        registry.addViewController("/register_event").setViewName("register_event");
        registry.addViewController("/recruiters_dashboard").setViewName("recruiters_dashboard");
        registry.addViewController("/admin_dashboard").setViewName("admin_dashboard");
        registry.addViewController("/project_details").setViewName("project_details");
    }
}
