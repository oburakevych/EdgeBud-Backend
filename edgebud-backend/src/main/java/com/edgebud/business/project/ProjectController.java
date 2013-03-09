package com.edgebud.business.project;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Project.class)
@Controller
@RequestMapping("/projects")
public class ProjectController {
}
