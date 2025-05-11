package com.website.loveconnect.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MessageDTO {
    private Long messageId;
    private String content;
    private Long senderId;
    private LocalDateTime sentAt;
    private boolean isRead;
}
