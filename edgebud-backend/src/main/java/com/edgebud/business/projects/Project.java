package com.edgebud.business.projects;

import com.edgebud.business.companies.Company;
import com.edgebud.business.projects.comments.Comment;
import com.edgebud.business.projects.opportunities.Opportunity;

import flexjson.JSONSerializer;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
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

    @OneToMany(cascade = CascadeType.ALL)
    @OrderBy("created")
    private Set<Comment> comments = new HashSet<Comment>();

    private String imageName;

    private String videoName;

    @NotNull
    @Enumerated
    private ProjectStatus status;

    @ManyToOne(cascade = CascadeType.PERSIST)
    private Company company;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Opportunity> opportunities = new HashSet<Opportunity>();
    
    public static String toJsonArray(Collection<Project> collection) {
        return new JSONSerializer().exclude("*.class").include("opportunities").serialize(collection);
    }
}
