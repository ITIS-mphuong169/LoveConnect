package com.website.loveconnect.model;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "preferences")
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Preference {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long preferenceId;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private User user;

    @Column(name = "min_age", columnDefinition = "INT DEFAULT 18")
    private Integer minAge = 18;

    @Column(name = "max_age", columnDefinition = "INT DEFAULT 99")
    private Integer maxAge = 99;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender_preference", columnDefinition = "ENUM('MALE', 'FEMALE', 'OTHER', 'ANY') DEFAULT 'ANY'")
    private GenderPreference genderPreference = GenderPreference.ANY;

    @Column(name = "max_distance")
    private Integer maxDistance; // in km

    public enum GenderPreference {
        MALE, FEMALE, OTHER, ANY
    }
}