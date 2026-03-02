package com.fundacionescolombia.backend.foundations;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "foundations")
public class Foundation {

    @Id
    private String id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String department;

    @Column(nullable = false)
    private String city;

    private String logo;

    @Column(name = "linked_in")
    @JsonProperty("linkedIn")
    private String linkedIn;

    private String instagram;
    private String website;
    private String facebook;
    private String youtube;

    @Column(name = "instagram_secondary")
    @JsonProperty("instagram-secondary")
    private String instagramSecondary;

    private Boolean corporate;

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(columnDefinition = "jsonb", nullable = false)
    private List<String> causes = new ArrayList<>();

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(columnDefinition = "jsonb", nullable = false)
    private List<String> beneficiaries = new ArrayList<>();

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(name = "intervention_sites", columnDefinition = "jsonb", nullable = false)
    @JsonProperty("intervention-sites")
    private List<String> interventionSites = new ArrayList<>();

    @JdbcTypeCode(SqlTypes.JSON)
    @Column(columnDefinition = "jsonb", nullable = false)
    private List<String> interventions = new ArrayList<>();

    public Foundation() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getLinkedIn() {
        return linkedIn;
    }

    public void setLinkedIn(String linkedIn) {
        this.linkedIn = linkedIn;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getYoutube() {
        return youtube;
    }

    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }

    public String getInstagramSecondary() {
        return instagramSecondary;
    }

    public void setInstagramSecondary(String instagramSecondary) {
        this.instagramSecondary = instagramSecondary;
    }

    public Boolean getCorporate() {
        return corporate;
    }

    public void setCorporate(Boolean corporate) {
        this.corporate = corporate;
    }

    public List<String> getCauses() {
        return causes;
    }

    public void setCauses(List<String> causes) {
        this.causes = causes;
    }

    public List<String> getBeneficiaries() {
        return beneficiaries;
    }

    public void setBeneficiaries(List<String> beneficiaries) {
        this.beneficiaries = beneficiaries;
    }

    public List<String> getInterventionSites() {
        return interventionSites;
    }

    public void setInterventionSites(List<String> interventionSites) {
        this.interventionSites = interventionSites;
    }

    public List<String> getInterventions() {
        return interventions;
    }

    public void setInterventions(List<String> interventions) {
        this.interventions = interventions;
    }
}

