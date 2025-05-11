package com.website.loveconnect.service;

import com.website.loveconnect.model.Match;
import com.website.loveconnect.model.User;
import com.website.loveconnect.repository.MatchRepository;
import com.website.loveconnect.repository.UserRepository;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class MatchService {

    private final MatchRepository matchRepository;
    private final UserRepository userRepository;
    private final UserService userService;

    public MatchService(MatchRepository matchRepository, UserRepository userRepository, UserService userService) {
        this.matchRepository = matchRepository;
        this.userRepository = userRepository;
        this.userService = userService;
    }

    @Transactional
    public void createMatch(Match match) {
        matchRepository.save(match);
    }

    @Transactional(readOnly = true)
    public List<Match> findActiveMatchesForUser(Long userId) {
        return matchRepository.findActiveMatchesByUserId(userId);
    }

    @Transactional(readOnly = true)
    public List<Match> findNewMatchesForUser(Long userId) {
        return matchRepository.findNewMatchesByUserId(userId);
    }

    @Transactional
    public Match deactivateMatch(Long matchId) {
        Match match = matchRepository.findById(matchId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy kết nối"));

        match.setActive(false);
        return matchRepository.save(match);
    }

    @Transactional(readOnly = true)
    public List<Match> getAllMatches(Long userId) {
        if (userId == null) {
            return new ArrayList<>();
        }
        
        // Get matches without attempting to initialize collections
        List<Match> matches = this.matchRepository.findUniqueMatchesByUserId(userId);
        
        // Don't try to force initialize the collections here
        // Let Hibernate handle the lazy loading when needed
        return matches;
    }

    @Transactional(readOnly = true)
    public List<Match> getMatchesForCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || "anonymousUser".equals(auth.getName())) {
            return new ArrayList<>();
        }
        
        User currentUser = userService.findUserByEmail(auth.getName());
        if (currentUser == null) {
            return new ArrayList<>();
        }
        
        return this.getAllMatches(currentUser.getUserId());
    }

    @Transactional(readOnly = true)
    public Match getMatchById(Long matchId) {
        if (matchId == null) {
            throw new IllegalArgumentException("Match ID không được để trống");
        }
        
        return matchRepository.findById(matchId)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy kết nối với ID: " + matchId));
    }
}