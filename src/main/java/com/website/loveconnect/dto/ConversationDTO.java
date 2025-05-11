package com.website.loveconnect.dto;

import java.time.LocalDateTime;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ConversationDTO {
    private Long matchId;
    private Long userId;
    private String username;
    private String profileImage;
    private String lastMessage;
    private LocalDateTime lastMessageTime;
    private long unreadCount;
}