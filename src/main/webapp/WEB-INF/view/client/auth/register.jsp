<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Đăng ký</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <!-- header -->
    <header>
        <div class="logo">
            <img class="logo-icon" src="./images/logos/logo.svg" alt="LoveConnect Logo" width="200">
            <a href="/" class="logo-text">LoveConnect</a>
        </div>

        <nav>
            <ul>
                <li><a href="/products">Sản phẩm</a></li>
                <li><a href="/about">Tìm hiểu</a></li>
                <li><a href="/safe">An toàn</a></li>
                <li><a href="/support">Hỗ trợ</a></li>
                <li><a href="/download">Tải về</a></li>
            </ul>
        </nav>

        <div class="buttons">
            <a href="/login" class="login-btn">Đăng Nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <div class="register-container">
        <div class="register-card">
            <div class="register-header">
                <h2>Tạo Tài Khoản LoveConnect</h2>
                <p>Bắt đầu hành trình tìm kiếm và kết nối</p>
            </div>

            <form:form method="POST" action="/register" modelAttribute="registerDTO" class="register-form">
                <div class="form-group">
                    <label for="fullName">Họ và tên</label>
                    <c:set var="errorFullName">
                        <form:errors path="fullName" cssClass="error-message" />
                    </c:set>
                    <form:input path="fullName" id="fullName" class="${not empty errorFullName ? 'is-invalid' : ''}"
                        placeholder="Nhập họ và tên đầy đủ" />
                    ${errorFullName}
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <c:set var="errorPassword">
                            <form:errors path="password" cssClass="error-message" />
                        </c:set>
                        <div class="password-input">
                            <form:password path="password" id="password" placeholder="Tạo mật khẩu" />
                            <i class="fa-regular fa-eye-slash toggle-password"></i>
                        </div>
                        ${errorPassword}
                    </div>

                    <div class="form-group">
                        <label for="passwordConfirm">Xác nhận mật khẩu</label>
                        <div class="password-input">
                            <form:password path="passwordConfirm" id="passwordConfirm"
                                placeholder="Nhập lại mật khẩu" />
                            <i class="fa-regular fa-eye-slash toggle-password"></i>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="birthDate">Ngày sinh</label>
                    <c:set var="errorBirthDate">
                        <form:errors path="birthDate" cssClass="error-message" />
                    </c:set>
                    <form:input path="birthDate" type="date" id="birthDate" />
                    ${errorBirthDate}
                </div>

                <div class="form-group">
                    <label for="location">Địa điểm</label>
                    <c:set var="errorLocation">
                        <form:errors path="location" cssClass="error-message" />
                    </c:set>
                    <form:input path="location" id="location" class="${not empty errorLocation ? 'is-invalid' : ''}"
                        placeholder="Thành phố, Quốc gia" />
                    ${errorLocation}
                </div>

                <div class="form-group">
                    <label for="description">Giới thiệu về bạn</label>
                    <form:textarea path="description" id="description" rows="3"
                        placeholder="Viết vài dòng giới thiệu về bản thân" />
                </div>

                <div class="form-group interests-group">
                    <label>Sở thích</label>
                    <div class="interests-container">
                        <c:forEach items="${allInterests}" var="interest" varStatus="loop">
                            <div class="interest-tag">
                                <form:checkbox path="interests" value="${interest.name}" id="interest${loop.index}" />
                                <label for="interest${loop.index}">${interest.name}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại</label>
                        <form:input path="phoneNumber" id="phoneNumber" placeholder="Nhập số điện thoại" />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <c:set var="errorEmail">
                            <form:errors path="email" cssClass="error-message" />
                        </c:set>
                        <form:input path="email" type="email" id="email"
                            class="${not empty errorEmail ? 'is-invalid' : ''}" placeholder="Nhập địa chỉ email" />
                        ${errorEmail}
                    </div>
                </div>

                <div class="form-group">
                    <label>Giới tính</label>
                    <div class="gender-options">
                        <div class="gender-option">
                            <form:radiobutton path="gender" value="MALE" id="male" checked="checked" />
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-option">
                            <form:radiobutton path="gender" value="FEMALE" id="female" />
                            <label for="female">Nữ</label>
                        </div>
                        <div class="gender-option">
                            <form:radiobutton path="gender" value="OTHER" id="other" />
                            <label for="other">Khác</label>
                        </div>
                    </div>
                </div>

                <div class="form-group terms-container">
                    <div class="terms-check">
                        <input type="checkbox" id="terms" name="terms" required>
                        <label for="terms">Tôi đồng ý với <a href="#">Điều khoản</a> và <a href="#">Chính sách Quyền
                                riêng tư</a></label>
                    </div>
                </div>

                <button type="submit" class="register-submit-btn">Đăng ký</button>
            </form:form>

            <div class="register-divider">
                <span>Hoặc đăng ký với</span>
            </div>

            <div class="social-register">
                <button class="google-btn">
                    <i class="fab fa-google"></i>
                    <span>Google</span>
                </button>
                <button class="facebook-btn">
                    <i class="fab fa-facebook-f"></i>
                    <span>Facebook</span>
                </button>
            </div>

            <div class="register-footer">
                <p>Đã có tài khoản? <a href="/login">Đăng nhập ngay</a></p>
            </div>
        </div>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Pháp lý</h3>
                <ul>
                    <li><a href="#">Quyền Riêng Tư</a></li>
                    <li><a href="#">Chính sách Quyền riêng tư về <br>Dữ liệu Sức khỏe Người tiêu dùng</a></li>
                    <li><a href="#">Điều khoản</a></li>
                    <li><a href="#">Chính sách Cookie</a></li>
                    <li><a href="#">Sở Hữu Trí Tuệ</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Nghề Nghiệp</h3>
                <ul>
                    <li><a href="#">Cổng thông tin Nghề nghiệp</a></li>
                    <li><a href="#">Blog Công Nghệ</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Mạng Xã Hội</h3>
                <ul>
                    <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-tiktok"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Câu Hỏi Thường Gặp</h3>
                <ul>
                    <li><a href="#">Các điểm đến</a></li>
                    <li><a href="#">Khu Vực Báo Chí</a></li>
                    <li><a href="#">Liên Hệ</a></li>
                    <li><a href="#">Mã Khuyến Mãi</a></li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            © 2025 LoveConnect. Đã đăng ký Bản quyền.
        </div>
    </footer>

    <script>
        document.querySelectorAll('.toggle-password').forEach(function (eye) {
            eye.addEventListener('click', function () {
                const passwordInput = this.previousElementSibling;

                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    this.classList.remove('fa-eye-slash');
                    this.classList.add('fa-eye');
                } else {
                    passwordInput.type = 'password';
                    this.classList.remove('fa-eye');
                    this.classList.add('fa-eye-slash');
                }
            });
        });
    </script>
</body>

</html>