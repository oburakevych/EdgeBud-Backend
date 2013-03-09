// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.edgebud.business.project.comment;

import com.edgebud.business.project.comment.Comment;
import com.edgebud.business.project.comment.CommentDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CommentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CommentDataOnDemand: @Component;
    
    private Random CommentDataOnDemand.rnd = new SecureRandom();
    
    private List<Comment> CommentDataOnDemand.data;
    
    public Comment CommentDataOnDemand.getNewTransientComment(int index) {
        Comment obj = new Comment();
        setCreated(obj, index);
        setId(obj, index);
        setText(obj, index);
        return obj;
    }
    
    public void CommentDataOnDemand.setCreated(Comment obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }
    
    public void CommentDataOnDemand.setId(Comment obj, int index) {
        String id = "id_" + index;
        obj.setId(id);
    }
    
    public void CommentDataOnDemand.setText(Comment obj, int index) {
        String text = "text_" + index;
        obj.setText(text);
    }
    
    public Comment CommentDataOnDemand.getSpecificComment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Comment obj = data.get(index);
        Long id = obj.getId_();
        return Comment.findComment(id);
    }
    
    public Comment CommentDataOnDemand.getRandomComment() {
        init();
        Comment obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId_();
        return Comment.findComment(id);
    }
    
    public boolean CommentDataOnDemand.modifyComment(Comment obj) {
        return false;
    }
    
    public void CommentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Comment.findCommentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Comment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Comment>();
        for (int i = 0; i < 10; i++) {
            Comment obj = getNewTransientComment(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}