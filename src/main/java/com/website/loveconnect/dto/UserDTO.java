package com.website.loveconnect.dto;

import java.time.LocalDate;
import java.util.List;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import com.website.loveconnect.model.Photo;
import com.website.loveconnect.model.Preference;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {

    private Long userId;

    @NotBlank(message = "Họ và tên không được để trống")
    @Size(max = 100, message = "Họ và tên không được vượt quá 100 ký tự")
    private String fullName;

    @NotNull(message = "Ngày sinh không được để trống")
    @Past(message = "Ngày sinh phải là ngày trong quá khứ")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDate;

    @NotNull(message = "Giới tính không được để trống")
    private String gender;

    private String location;

    @Pattern(regexp = "(^$|^(0|\\+84)[0-9]{9,10}$)", message = "Số điện thoại không hợp lệ")
    private String phoneNumber;

    @Size(max = 500, message = "Giới thiệu không được vượt quá 500 ký tự")
    private String bio;

    private List<Integer> interestIds;

    private Preference preference;

    private String profilePictureUrl;

    private List<Photo> photos;

    private MultipartFile profilePhoto;
    private List<MultipartFile> additionalPhotos;

    private List<Long> deletePhotoIds;
    private Long primaryPhotoId;
}