package com.website.loveconnect.dto;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterDTO {

    @NotBlank(message = "Họ và tên không được để trống")
    @Size(min = 5, max = 100, message = "Họ và tên phải từ 5 đến 100 ký tự")
    private String fullName;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    private String email;

    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 8, message = "Mật khẩu phải có ít nhất 8 ký tự")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$", message = "Mật khẩu phải chứa ít nhất 1 chữ hoa, 1 chữ thường và 1 số")
    private String password;

    @NotBlank(message = "Xác nhận mật khẩu không được để trống")
    private String passwordConfirm;

    @NotNull(message = "Ngày sinh không được để trống")
    @Past(message = "Ngày sinh phải là ngày trong quá khứ")
    private LocalDate birthDate;

    @NotBlank(message = "Địa điểm không được để trống")
    private String location;

    @Size(max = 500, message = "Giới thiệu không quá 500 ký tự")
    private String description;

    private List<String> interests = new ArrayList<>();

    @Pattern(regexp = "(^$|[0-9]{10})", message = "Số điện thoại phải có 10 chữ số")
    private String phoneNumber;

    @NotBlank(message = "Giới tính không được để trống")
    private String gender; 

    // Phương thức kiểm tra mật khẩu khớp
    public boolean isPasswordMatching() {
        return password != null && password.equals(passwordConfirm);
    }
}
