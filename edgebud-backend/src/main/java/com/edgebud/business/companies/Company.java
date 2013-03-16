package com.edgebud.business.companies;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Company {

    @NotNull
    private String id;

    @NotNull
    @Size(max = 24)
    private String name;

    @Size(max = 1024)
    private String description;

    private String email;

    private String url;
}
