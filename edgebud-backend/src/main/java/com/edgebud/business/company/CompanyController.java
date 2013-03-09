package com.edgebud.business.company;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Company.class)
@Controller
@RequestMapping("/companys")
public class CompanyController {
}
