package com.fundacionescolombia.backend.foundations;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/foundations")
public class FoundationController {

    private final FoundationService foundationService;

    public FoundationController(FoundationService foundationService) {
        this.foundationService = foundationService;
    }

    @GetMapping
    public List<Foundation> getFoundations() {
        return foundationService.findAll();
    }
}

