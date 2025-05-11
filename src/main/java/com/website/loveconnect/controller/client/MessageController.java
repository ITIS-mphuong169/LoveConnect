package com.website.loveconnect.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.website.loveconnect.model.Match;
import com.website.loveconnect.model.Message;
import com.website.loveconnect.model.User;
import com.website.loveconnect.service.MatchService;
import com.website.loveconnect.service.MessageService;
import com.website.loveconnect.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/client/message")
public class MessageController {

    private final MatchService matchService;
    private final MessageService messageService;
    private final UserService userService;

    // ✅ Hỗ trợ cả /client/message và /client/message/{matchId}
    @GetMapping({ "", "/{matchId}" })
    public String viewMessages(@PathVariable(required = false) Long matchId,
                               @RequestParam(value = "matchId", required = false) Long matchIdParam,
                               Model model) {

        Long effectiveMatchId = (matchId != null) ? matchId : matchIdParam;

        // Get current user for the view
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = userService.findUserByEmail(auth.getName());
        model.addAttribute("currentUser", currentUser);
        
        // Get matches list
        List<Match> matches = matchService.getMatchesForCurrentUser();
        model.addAttribute("matches", matches);
        
        // Map to store last messages for each match
        Map<Long, Message> lastMessagesMap = new HashMap<>();
        
        // Get all selected messages and add to model
        List<Message> selectedMessages = new ArrayList<>();
        if (effectiveMatchId != null) {
            Match selectedMatch = matchService.getMatchById(effectiveMatchId);
            selectedMessages = messageService.getMessagesByMatchId(effectiveMatchId);
            model.addAttribute("selectedMatch", selectedMatch);
        }
        model.addAttribute("selectedMessages", selectedMessages);
        
        // Get last message for each match for previews
        for (Match match : matches) {
            List<Message> messages = messageService.getMessagesByMatchId(match.getMatchId());
            if (!messages.isEmpty()) {
                lastMessagesMap.put(match.getMatchId(), messages.get(messages.size() - 1));
            }
        }
        model.addAttribute("lastMessagesMap", lastMessagesMap);

        return "messages";
    }

    @PostMapping("/send")
    public String sendMessage(@RequestParam Long matchId,
                              @RequestParam String content) {
        messageService.sendMessage(matchId, content);
        return "redirect:/client/message/" + matchId;
    }
}
