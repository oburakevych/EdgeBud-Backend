// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.projects.comments;

import com.edgebud.business.projects.comments.Comment;
import java.util.Date;

privileged aspect Comment_Roo_JavaBean {
    
    public Date Comment.getCreated() {
        return this.created;
    }
    
    public void Comment.setCreated(Date created) {
        this.created = created;
    }
    
    public String Comment.getText() {
        return this.text;
    }
    
    public void Comment.setText(String text) {
        this.text = text;
    }
    
}
