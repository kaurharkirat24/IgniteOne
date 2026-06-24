package com.igniteone.repository;

import com.igniteone.model.Donation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
    List<Donation> findByProjectId(Long projectId);
    List<Donation> findByDonorId(Long donorId);
}
