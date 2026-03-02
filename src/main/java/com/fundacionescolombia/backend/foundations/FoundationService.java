package com.fundacionescolombia.backend.foundations;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoundationService {

    private final FoundationRepository foundationRepository;

    public FoundationService(FoundationRepository foundationRepository) {
        this.foundationRepository = foundationRepository;
    }

    public List<Foundation> findAll() {
        return foundationRepository.findAll();
    }
}

