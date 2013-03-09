package com.edgebud.business.project;

import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RooWebJson(jsonObject = Project.class)
@Controller
@RequestMapping("/projects")
public class ProjectController {
	Logger LOG = LoggerFactory.getLogger(getClass());

	@RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public @ResponseBody ResponseEntity<String> createFromJson(@RequestBody String json) {
    	LOG.debug("Request to create a new Project");
    	
        Project project = Project.fromJsonToProject(json);
        
        if (project.getId() == null) {
        	project.setId(UUID.randomUUID().toString());
        }
        project.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        headers.set("Access-Control-Allow-Origin", "*");
        headers.set("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
        headers.set("Access-Control-Max-Age", "86400");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
}
