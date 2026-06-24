package com.igniteone.repository;

import com.igniteone.model.Project;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
    
    @EntityGraph(attributePaths = {"owner"})
    List<Project> findAll();

    List<Project> findByOwnerId(Long ownerId);
}
