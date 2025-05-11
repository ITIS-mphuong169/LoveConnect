package com.website.loveconnect.controller.client;

import java.io.IOException;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.security.core.Authentication;
import com.website.loveconnect.dto.UserDTO;
import com.website.loveconnect.model.User;
import com.website.loveconnect.service.InterestService;
import com.website.loveconnect.service.PhotoService;
import com.website.loveconnect.service.UserService;

import jakarta.validation.Valid;

@Controller
public class ProfileController {
    private final UserService userService;
    private final InterestService interestService;
    private final PhotoService photoService;

    public ProfileController(UserService userService, InterestService interestService, PhotoService photoService) {
        this.userService = userService;
        this.interestService = interestService;
        this.photoService = photoService;
    }

    /**
     * Hiển thị trang hồ sơ người dùng
     */
    @GetMapping("/client/profile")
    public String showProfile(Model model) {
        User currentUser = getCurrentUser();
        model.addAttribute("user", currentUser);
        return "client/homepage/profile";
    }

    /**
     * Hiển thị form chỉnh sửa hồ sơ
     */
    @GetMapping("/client/profile/edit")
    public String showEditProfileForm(Model model) {
        User currentUser = getCurrentUser();
        UserDTO userDto = userService.convertToDTO(currentUser);

        model.addAttribute("userDto", userDto);
        model.addAttribute("user", currentUser);
        model.addAttribute("allInterests", interestService.getAllInterests());

        return "client/homepage/edit-profile";
    }

    /**
     * Xử lý cập nhật hồ sơ người dùng
     */
    @PostMapping("/client/profile/update")
    public String updateProfile(
            @Valid @ModelAttribute("userDto") UserDTO userDto,
            BindingResult bindingResult,
            @RequestParam(value = "profilePhoto", required = false) MultipartFile profilePhoto,
            @RequestParam(value = "additionalPhotos", required = false) MultipartFile[] additionalPhotos,
            @RequestParam(value = "deletePhotoIds", required = false) List<Long> deletePhotoIds,
            @RequestParam(value = "primaryPhotoId", required = false) Long primaryPhotoId,
            Model model,
            RedirectAttributes redirectAttributes) {

        // Kiểm tra lỗi validation
        if (bindingResult.hasErrors()) {
            model.addAttribute("user", getCurrentUser());
            model.addAttribute("allInterests", interestService.getAllInterests());
            return "client/homepage/edit-profile";
        }

        try {
            // Cập nhật thông tin cơ bản
            User updatedUser = userService.updateUserProfile(userDto);

            // Xử lý ảnh đại diện
            if (profilePhoto != null && !profilePhoto.isEmpty()) {
                photoService.updateProfilePicture(updatedUser, profilePhoto);
            }

            // Xử lý ảnh bổ sung
            if (additionalPhotos != null) {
                for (MultipartFile photo : additionalPhotos) {
                    if (!photo.isEmpty()) {
                        photoService.addPhoto(updatedUser, photo);
                    }
                }
            }

            // Xử lý xóa ảnh
            if (deletePhotoIds != null && !deletePhotoIds.isEmpty()) {
                photoService.deletePhotos(deletePhotoIds, updatedUser.getUserId());
            }

            // Xử lý đặt ảnh chính
            if (primaryPhotoId != null) {
                photoService.setPrimaryPhoto(updatedUser.getUserId(), primaryPhotoId);
            }

            redirectAttributes.addFlashAttribute("successMessage", "Hồ sơ đã được cập nhật thành công!");
            return "redirect:/client/profile";

        } catch (IOException e) {
            model.addAttribute("user", getCurrentUser());
            model.addAttribute("allInterests", interestService.getAllInterests());
            model.addAttribute("errorMessage", "Có lỗi xảy ra khi xử lý ảnh: " + e.getMessage());
            return "client/edit-profile";
        } catch (Exception e) {
            model.addAttribute("user", getCurrentUser());
            model.addAttribute("allInterests", interestService.getAllInterests());
            model.addAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            return "client/homepage/edit-profile";
        }
    }

    /**
     * Xóa ảnh bằng AJAX
     */
    @PostMapping("/profile/photos/{photoId}/delete")
    @ResponseBody
    public String deletePhoto(@PathVariable Long photoId) {
        try {
            User currentUser = getCurrentUser();
            boolean success = photoService.deletePhoto(photoId, currentUser.getUserId());

            if (success) {
                return "{\"success\": true}";
            } else {
                return "{\"success\": false, \"message\": \"Không thể xóa ảnh\"}";
            }
        } catch (Exception e) {
            return "{\"success\": false, \"message\": \"" + e.getMessage() + "\"}";
        }
    }

    /**
     * Đặt ảnh chính bằng AJAX
     */
    @PostMapping("/profile/photos/{photoId}/primary")
    @ResponseBody
    public String setPrimaryPhoto(@PathVariable Long photoId) {
        try {
            User currentUser = getCurrentUser();
            boolean success = photoService.setPrimaryPhoto(currentUser.getUserId(), photoId);

            if (success) {
                return "{\"success\": true}";
            } else {
                return "{\"success\": false, \"message\": \"Không thể đặt ảnh chính\"}";
            }
        } catch (Exception e) {
            return "{\"success\": false, \"message\": \"" + e.getMessage() + "\"}";
        }
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
