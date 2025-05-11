package com.website.loveconnect.controller.client;

// import org.springframework.stereotype.Controller;
// import org.springframework.web.bind.annotation.GetMapping;

// @Controller
// public class MatchesController {
//     @GetMapping("/client/matches")
//     public String getMatches() {
//         return "client/homepage/matches";
//     }
// }

import com.website.loveconnect.model.Match;
import com.website.loveconnect.model.User;
import com.website.loveconnect.service.MatchService;
import com.website.loveconnect.service.MessageService;
import com.website.loveconnect.service.UserService;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
@Controller
public class MatchesController {

    private final MatchService matchService;
    private final UserService userService;
    private final MessageService messageService;

    public MatchesController(MatchService matchService,
            UserService userService,
            MessageService messageService) {
        this.matchService = matchService;
        this.userService = userService;
        this.messageService = messageService;
    }

    @GetMapping("/client/matches")
    public String getMatchesPage(Model model, Authentication authentication) {
        User currentUser = userService.getUserByEmail(authentication.getName());
        List<Match> matches = matchService.getAllMatches(currentUser.getUserId());

        // Tạo map lưu thông tin match có tin nhắn hay không
        Map<Long, Boolean> hasMessagesMap = new HashMap<>();
        for (Match match : matches) {
            // Use MessageService instead of directly accessing lazy-loaded collection
            List<?> messagesList = messageService.getMessagesByMatchId(match.getMatchId());
            hasMessagesMap.put(match.getMatchId(), messagesList != null && !messagesList.isEmpty());
        }

        model.addAttribute("user", currentUser);
        model.addAttribute("matches", matches);
        model.addAttribute("hasMessagesMap", hasMessagesMap);  // Thêm dòng này

        return "client/homepage/matches";
    }

    @GetMapping("/client/view-profile/{id}")
    public String getViewProfile(Model model, @PathVariable Long id) {
        User user = getCurrentUser();
        User sender = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("sender", sender);
        return "client/homepage/view-profile";
    }

    /**
     * Helper method để lấy user hiện tại
     */
    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return userService.findUserByEmail(username);
    }
}
