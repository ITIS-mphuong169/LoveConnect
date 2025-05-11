package com.website.loveconnect.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.website.loveconnect.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User user);

    User findById(long id);

    List<User> findAll();

    Page<User> findAll(Pageable pageable);

    List<User> findOneByEmail(String email);

    void deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
