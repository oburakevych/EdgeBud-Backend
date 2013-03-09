// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.project;

import com.edgebud.business.company.Company;
import com.edgebud.business.project.Project;
import com.edgebud.business.project.ProjectStatus;
import com.edgebud.business.project.comment.Comment;

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
    
    public String Project.getDescription() {
        return this.description;
    }
    
    public void Project.setDescription(String description) {
        this.description = description;
    }
    
    public Company Project.getCompany() {
        return this.company;
    }
    
    public void Project.setCompany(Company company) {
        this.company = company;
    }
    
    public Set<Comment> Project.getComments() {
        return this.comments;
    }
    
    public void Project.setComments(Set<Comment> comments) {
        this.comments = comments;
    }
    
    public String Project.getImageUrl() {
        return this.imageUrl;
    }
    
    public void Project.setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    public String Project.getVideoUrl() {
        return this.videoUrl;
    }
    
    public void Project.setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
    
    public ProjectStatus Project.getStatus() {
        return this.status;
    }
    
    public void Project.setStatus(ProjectStatus status) {
        this.status = status;
    }
    
}
