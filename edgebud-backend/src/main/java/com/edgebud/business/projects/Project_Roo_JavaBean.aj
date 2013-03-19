// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.projects;

import com.edgebud.business.companies.Company;
import com.edgebud.business.projects.Project;
import com.edgebud.business.projects.ProjectStatus;
import com.edgebud.business.projects.challenges.Challenge;
import com.edgebud.business.projects.comments.Comment;
import com.edgebud.business.projects.opportunities.Opportunity;
import java.util.Date;
import java.util.Set;

privileged aspect Project_Roo_JavaBean {
    
    public String Project.getId() {
        return this.id;
    }
    
    public void Project.setId(String id) {
        this.id = id;
    }
    
    public String Project.getName() {
        return this.name;
    }
    
    public void Project.setName(String name) {
        this.name = name;
    }
    
    public Date Project.getCreated() {
        return this.created;
    }
    
    public void Project.setCreated(Date created) {
        this.created = created;
    }
    
    public Date Project.getStartDate() {
        return this.startDate;
    }
    
    public void Project.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date Project.getEndDate() {
        return this.endDate;
    }
    
    public void Project.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public String Project.getDescription() {
        return this.description;
    }
    
    public void Project.setDescription(String description) {
        this.description = description;
    }
    
    public Set<Comment> Project.getComments() {
        return this.comments;
    }
    
    public void Project.setComments(Set<Comment> comments) {
        this.comments = comments;
    }
    
    public String Project.getImageName() {
        return this.imageName;
    }
    
    public void Project.setImageName(String imageName) {
        this.imageName = imageName;
    }
    
    public String Project.getVideoName() {
        return this.videoName;
    }
    
    public void Project.setVideoName(String videoName) {
        this.videoName = videoName;
    }
    
    public ProjectStatus Project.getStatus() {
        return this.status;
    }
    
    public void Project.setStatus(ProjectStatus status) {
        this.status = status;
    }
    
    public Company Project.getCompany() {
        return this.company;
    }
    
    public void Project.setCompany(Company company) {
        this.company = company;
    }
    
    public Set<Opportunity> Project.getOpportunities() {
        return this.opportunities;
    }
    
    public void Project.setOpportunities(Set<Opportunity> opportunities) {
        this.opportunities = opportunities;
    }
    
    public Set<Challenge> Project.getChallenges() {
        return this.challenges;
    }
    
    public void Project.setChallenges(Set<Challenge> challenges) {
        this.challenges = challenges;
    }
    
}
