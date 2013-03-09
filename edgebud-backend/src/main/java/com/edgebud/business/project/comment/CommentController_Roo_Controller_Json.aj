// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.project.comment;

import com.edgebud.business.project.comment.Comment;
import com.edgebud.business.project.comment.CommentController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect CommentController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id_}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CommentController.showJson(@PathVariable("id_") Long id_) {
        Comment comment = Comment.findComment(id_);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (comment == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(comment.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CommentController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Comment> result = Comment.findAllComments();
        return new ResponseEntity<String>(Comment.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CommentController.createFromJson(@RequestBody String json) {
        Comment comment = Comment.fromJsonToComment(json);
        comment.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CommentController.createFromJsonArray(@RequestBody String json) {
        for (Comment comment: Comment.fromJsonArrayToComments(json)) {
            comment.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CommentController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Comment comment = Comment.fromJsonToComment(json);
        if (comment.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CommentController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Comment comment: Comment.fromJsonArrayToComments(json)) {
            if (comment.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CommentController.deleteFromJson(@PathVariable("id_") Long id_) {
        Comment comment = Comment.findComment(id_);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (comment == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        comment.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
