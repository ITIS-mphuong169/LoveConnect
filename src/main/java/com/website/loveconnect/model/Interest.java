package com.website.loveconnect.model;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "interests")
public class Interest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer interestId;

    @Column(nullable = false, unique = true)
    private String name;

    private String iconClass;

    @ManyToMany(mappedBy = "interests")
    private Set<User> users = new HashSet<>();
}
