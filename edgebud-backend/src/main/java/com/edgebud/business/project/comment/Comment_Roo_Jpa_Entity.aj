// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.project.comment;

import com.edgebud.business.project.comment.Comment;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Comment_Roo_Jpa_Entity {
    
    declare @type: Comment: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_")
    private Long Comment.id_;
    
    @Version
    @Column(name = "version")
    private Integer Comment.version;
    
    public Long Comment.getId_() {
        return this.id_;
    }
    
    public void Comment.setId_(Long id) {
        this.id_ = id;
    }
    
    public Integer Comment.getVersion() {
        return this.version;
    }
    
    public void Comment.setVersion(Integer version) {
        this.version = version;
    }
    
}
