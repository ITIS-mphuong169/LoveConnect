package com.website.loveconnect.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MessageController {
    @GetMapping("/client/message")
    public String getMessage() {
        return "client/homepage/message";
    }

    @GetMapping("/client/message/{id}")
    public String getMessageById(Model model, @PathVariable Long id) {
        return "client/homepage/message";
    }
}
