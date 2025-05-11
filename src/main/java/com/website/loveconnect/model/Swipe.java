package com.website.loveconnect.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "swipes", uniqueConstraints = @UniqueConstraint(columnNames = { "swiper_id", "swiped_id" }))
public class Swipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long swipeId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "swiper_id", nullable = false)
    private User swiper;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "swiped_id", nullable = false)
    private User swiped;

    @Column(name = "is_like", nullable = false)
    private boolean isLike;

    @CreationTimestamp
    private LocalDateTime swipedAt;
}
