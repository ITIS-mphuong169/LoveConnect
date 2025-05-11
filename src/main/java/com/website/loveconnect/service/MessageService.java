package com.website.loveconnect.service;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.website.loveconnect.model.Match;
import com.website.loveconnect.model.Message;
import com.website.loveconnect.model.User;
import com.website.loveconnect.repository.MatchRepository;
import com.website.loveconnect.repository.MessageRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MessageService {

    private final MessageRepository messageRepository;
    private final MatchRepository matchRepository;
    private final UserService userService;

    public List<Message> getMessagesByMatchId(Long matchId) {
        return messageRepository.findByMatchMatchIdOrderBySentAtAsc(matchId);
    }

    public Message getLastMessage(List<Message> messages) {
        return messages != null && !messages.isEmpty() ? messages.get(messages.size() - 1) : null;
    }

    public void sendMessage(Long matchId, String content) {
        // Get current authenticated user
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User sender = userService.findUserByEmail(auth.getName());
        
        // Find the match
        Match match = matchRepository.findById(matchId)
            .orElseThrow(() -> new IllegalArgumentException("Match not found with id: " + matchId));
        
        // Create and save the message
        Message message = Message.builder()
            .match(match)
            .sender(sender)
            .content(content)
            .isRead(false)
            .build();
        
        messageRepository.save(message);
    }
}