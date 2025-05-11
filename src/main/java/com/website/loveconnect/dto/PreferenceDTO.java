package com.website.loveconnect.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PreferenceDTO {
    private String genderPreference;
    private Integer minAge;
    private Integer maxAge;
    private Integer maxDistance;
}
