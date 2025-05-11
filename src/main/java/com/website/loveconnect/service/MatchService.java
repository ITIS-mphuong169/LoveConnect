package com.website.loveconnect.service;

import com.website.loveconnect.model.Match;
import com.website.loveconnect.repository.MatchRepository;
import com.website.loveconnect.repository.UserRepository;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MatchService {

    private final MatchRepository matchRepository;
    private final UserRepository userRepository;

    public MatchService(MatchRepository matchRepository, UserRepository userRepository) {
        this.matchRepository = matchRepository;
        this.userRepository = userRepository;
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

    public List<Match> getAllMatches(Long userId) {
        return this.matchRepository.findUniqueMatchesByUserId(userId);
    }
}