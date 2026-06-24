package com.igniteone.service;

import com.igniteone.model.Donation;
import com.igniteone.repository.DonationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.igniteone.model.Project;
import com.igniteone.model.User;
import com.igniteone.repository.ProjectRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    @Autowired
    private ProjectRepository projectRepository;

    public List<Donation> getAllDonations() {
        return donationRepository.findAll();
    }

    @Transactional
    public void processDonation(Long projectId, User donor, Double amount) {
        Project project = projectRepository.findById(projectId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid project Id:" + projectId));
        
        Double currentFunding = project.getCurrentFunding() != null ? project.getCurrentFunding() : 0.0;
        project.setCurrentFunding(currentFunding + amount);
        projectRepository.save(project);
        
        Donation donation = new Donation();
        donation.setProject(project);
        donation.setDonor(donor);
        donation.setAmount(amount);
        donationRepository.save(donation);
    }
}
