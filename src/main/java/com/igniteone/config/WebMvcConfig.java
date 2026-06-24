package com.igniteone.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import com.igniteone.interceptor.AuthInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private AuthInterceptor authInterceptor;

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // Map simple URL paths directly to JSP views to avoid creating empty controller methods (DRY Principle)
        registry.addViewController("/about").setViewName("about");
        registry.addViewController("/contact").setViewName("contact");
        registry.addViewController("/project_details").setViewName("project_details");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/student_dashboard", "/recruiters_dashboard", "/admin_dashboard", 
                                 "/add_project", "/donate", "/profile/update", "/profile", 
                                 "/register_event", "/register_event_submit");
    }
}
