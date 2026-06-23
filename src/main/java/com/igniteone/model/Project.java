package com.igniteone.model;

import jakarta.persistence.*;

@Entity
@Table(name = "projects")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(length = 1000)
    private String description;

    private Double fundingGoal;
    private Double currentFunding = 0.0;
    private String imageUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User owner;

    // Default constructor
    public Project() {}

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Double getFundingGoal() { return fundingGoal; }
    public void setFundingGoal(Double fundingGoal) { this.fundingGoal = fundingGoal; }

    public Double getCurrentFunding() { return currentFunding; }
    public void setCurrentFunding(Double currentFunding) { this.currentFunding = currentFunding; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public User getOwner() { return owner; }
    public void setOwner(User owner) { this.owner = owner; }
}
