package com.website.loveconnect.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TopPickController {
    @GetMapping("/client/toppick")
    public String getTopPick() {
        return "client/homepage/toppick";
    }
}
