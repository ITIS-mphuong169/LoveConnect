package com.website.loveconnect.repository;

import com.website.loveconnect.model.Match;
import com.website.loveconnect.model.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MatchRepository extends JpaRepository<Match, Long> {

    Optional<Match> findByUser1AndUser2OrUser2AndUser1(User user1, User user2, User user3, User user4);

    @Query("SELECT m FROM Match m WHERE (m.user1.userId = :userId OR m.user2.userId = :userId) AND m.isActive = true")
    List<Match> findActiveMatchesByUserId(@Param("userId") Long userId);

    @Query("SELECT m FROM Match m WHERE (m.user1.userId = :userId OR m.user2.userId = :userId) " +
            "AND m.isActive = true AND m.messages IS EMPTY")
    List<Match> findNewMatchesByUserId(@Param("userId") Long userId);

    @Query(value = "SELECT m.* FROM matches m " +
            "WHERE (m.user1_id = :userId OR m.user2_id = :userId) " +
            "AND m.matched_at = (" +
            " SELECT MAX(m2.matched_at) FROM matches m2 " +
            " WHERE (m2.user1_id = m.user1_id AND m2.user2_id = m.user2_id) " +
            " OR (m2.user1_id = m.user2_id AND m2.user2_id = m.user1_id)" +
            ") " +
            "ORDER BY m.matched_at DESC", nativeQuery = true)
    List<Match> findUniqueMatchesByUserId(@Param("userId") Long userId);
}