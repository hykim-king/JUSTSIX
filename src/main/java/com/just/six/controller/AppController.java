package com.just.six.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
    @GetMapping("/")
    public String index() {
        return "index";
    }
    @GetMapping("/intro")
    public String intro() {
    	return "intro";
    }
}
