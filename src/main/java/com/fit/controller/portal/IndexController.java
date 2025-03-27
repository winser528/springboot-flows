package com.fit.controller.portal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    /**
     * 主页
     */
    @RequestMapping({"", "/", "/index"})
    public String index() {
        return "portal/index";
    }

    @RequestMapping("/about")
    public String about() {
        return "portal/about";
    }
}