package com.website.loveconnect.repository;

import com.website.loveconnect.model.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PhotoRepository extends JpaRepository<Photo, Long> {

    List<Photo> findByUser_UserIdOrderByUploadedAtDesc(Long userId);

    List<Photo> findByUser_UserId(Long userId);

    Optional<Photo> findByUser_UserIdAndIsPrimaryTrue(Long userId);

    long countByUser_UserId(Long userId);

    void deleteByUser_UserId(Long userId);
}