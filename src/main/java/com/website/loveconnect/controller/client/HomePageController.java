package com.website.loveconnect.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.website.loveconnect.dto.RegisterDTO;
import com.website.loveconnect.model.User;
import com.website.loveconnect.service.InterestService;
import com.website.loveconnect.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final InterestService interestService;

    public HomePageController(UserService userService, PasswordEncoder passwordEncoder,
            InterestService interestService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.interestService = interestService;
    }

    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/index";
    }

    @GetMapping("/client/products")
    public String getProducts() {
        return "client/homepage/products";
    }

    @GetMapping("/client/about")
    public String getAbout() {
        return "client/homepage/about";
    }

    @GetMapping("/client/safe")
    public String getSafe() {
        return "client/homepage/safe";
    }

    @GetMapping("/client/support")
    public String getSupport() {
        return "client/homepage/support";
    }

    @GetMapping("/client/download")
    public String getDownload() {
        return "client/homepage/download";
    }

    @GetMapping("/register")
    public String getRegister(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        loadInterest(model);
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("registerDTO") RegisterDTO registerDTO,
            BindingResult result,
            Model model) {
        if (!registerDTO.getPassword().equals(registerDTO.getPasswordConfirm())) {
            result.rejectValue("passwordConfirm", "error.passwordConfirm", "Mật khẩu không khớp");
        }
        if (result.hasErrors()) {
            loadInterest(model);
            return "client/auth/register";
        }
        User user = this.userService.registerDTOtoUser(registerDTO);
        user.setPasswordHash(this.passwordEncoder.encode(user.getPasswordHash()));
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginPage(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            @RequestParam(value = "expired", required = false) String expired,
            Model model) {

        if (error != null) {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
        }

        if (logout != null) {
            model.addAttribute("message", "Bạn đã đăng xuất thành công");
        }

        if (expired != null) {
            model.addAttribute("message", "Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại");
        }
        return "client/auth/login";
    }

    private void loadInterest(Model model) {
        model.addAttribute("allInterests", interestService.getAllInterests());
    }
}
