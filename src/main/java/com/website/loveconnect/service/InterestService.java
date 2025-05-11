package com.website.loveconnect.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.website.loveconnect.model.Interest;
import com.website.loveconnect.repository.InterestRepository;

@Service
public class InterestService {
    private final InterestRepository interestRepository;

    public InterestService(InterestRepository interestRepository) {
        this.interestRepository = interestRepository;
    }

    public List<Interest> getAllInterests() {
        return this.interestRepository.findAll();
    }

}
