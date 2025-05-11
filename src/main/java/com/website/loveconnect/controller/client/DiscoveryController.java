package com.website.loveconnect.controller.client;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.website.loveconnect.model.*;
import com.website.loveconnect.service.MatchService;
import com.website.loveconnect.service.UserService;
import java.util.List;

@Controller
public class DiscoveryController {
    private final UserService userService;
    private final MatchService matchService;

    public DiscoveryController(UserService userService, MatchService matchService) {
        this.userService = userService;
        this.matchService = matchService;
    }

    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return userService.findUserByEmail(username);
    }

    @GetMapping("/client/discovery")
    public String getDiscovery(Model model) {
        User currentUser = getCurrentUser();
        model.addAttribute("user", currentUser);
        model.addAttribute("myid", currentUser.getUserId());
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "client/homepage/discovery";
    }

    @GetMapping("/client/discovery/matches/{id}")
    public String getMatches(Model model, @PathVariable Long id) {
        User sender = getCurrentUser();
        User receiver = this.userService.getUserById(id);
        Match match = new Match();
        match.setUser1(sender);
        match.setUser2(receiver);
        match.setActive(false);
        this.matchService.createMatch(match);
        return "redirect:/client/discovery";
    }
}
