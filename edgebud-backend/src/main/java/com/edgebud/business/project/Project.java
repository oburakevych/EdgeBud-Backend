package com.edgebud.business.project;

import com.edgebud.business.company.Company;
import com.edgebud.business.project.comment.Comment;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Project {

    @NotNull
    private String id;

    @NotNull
    private String name;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date created = new Date();

    @Size(max = 8192)
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Comment> comments = new HashSet<Comment>();

    private String imageName;

    private String videoName;

    @NotNull
    @Enumerated
    private ProjectStatus status;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Company company;
}
