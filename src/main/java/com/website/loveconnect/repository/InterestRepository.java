package com.website.loveconnect.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.website.loveconnect.model.Interest;

@Repository
public interface InterestRepository extends JpaRepository<Interest, Integer> {
    Optional<Interest> findByName(String name);

    @SuppressWarnings("null")
    Optional<Interest> findById(Integer id);
}
