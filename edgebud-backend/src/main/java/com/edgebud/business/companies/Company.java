package com.edgebud.business.companies;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Company {
    @NotNull
    @Size(max = 24)
    private String name;

    @Size(max = 1024)
    private String description;

    private String email;

    private String url;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<com.edgebud.business.companies.figures.Figure> figures = new HashSet<com.edgebud.business.companies.figures.Figure>();
    
    
    public static String toJsonArray(Collection<Company> collection) {
        return new JSONSerializer().exclude("*.class").include("figures").serialize(collection);
    }
}
