<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Đăng nhập</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <!-- header -->
    <header>
        <div class="logo">
            <img class="logo-icon" src="/images/logos/logo.svg" alt="LoveConnect Logo" width="200">
            <a href="/" class="logo-text">LoveConnect</a>
        </div>

        <nav>
            <ul>
                <li><a href="/client/products">Sản phẩm</a></li>
                <li><a href="/client/about">Tìm hiểu</a></li>
                <li><a href="/client/safe">An toàn</a></li>
                <li><a href="/client/support">Hỗ trợ</a></li>
                <li><a href="/client/download">Tải về</a></li>
            </ul>
        </nav>

        <div class="buttons">
            <a href="/login" class="login-btn">Đăng Nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h2>Đăng Nhập Vào LoveConnect</h2>
                <p>Chào mừng trở lại! Đăng nhập để tiếp tục kết nối</p>
            </div>

            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <p>Tên đăng nhập hoặc mật khẩu không đúng</p>
                </div>
            </c:if>

            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>Bạn đã đăng xuất thành công</p>
                </div>
            </c:if>

            <form method="POST" action="/login" class="login-form">
                <div class="form-group">
                    <label for="username">Email</label>
                    <c:set var="errorEmail">
                        <form:errors path="username" cssClass="error-message" />
                    </c:set>
                    <input type="email" id="username" name="username"
                        class="${not empty errorEmail ? 'is-invalid' : ''}" placeholder="Nhập email của bạn" required>
                    ${errorEmail}
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <c:set var="errorPassword">
                        <form:errors path="password" cssClass="error-message" />
                    </c:set>
                    <div class="password-input">
                        <input type="password" id="password" name="password"
                            class="${not empty errorPassword ? 'is-invalid' : ''}" placeholder="Nhập mật khẩu" required>
                        <i class="fa-regular fa-eye-slash toggle-password"></i>
                    </div>
                    ${errorPassword}
                </div>

                <div class="form-options">
                    <div class="remember-me">
                        <input type="checkbox" id="remember-me" name="remember-me">
                        <label for="remember-me">Ghi nhớ đăng nhập</label>
                    </div>
                    <a href="/forgot-password" class="forgot-password">Quên mật khẩu?</a>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="login-submit-btn">Đăng nhập</button>
            </form>

            <div class="login-divider">
                <span>Hoặc đăng nhập với</span>
            </div>

            <div class="social-login">
                <button class="google-btn">
                    <i class="fab fa-google"></i>
                    <span>Google</span>
                </button>
                <button class="facebook-btn">
                    <i class="fab fa-facebook-f"></i>
                    <span>Facebook</span>
                </button>
            </div>

            <div class="login-footer">
                <p>Chưa có tài khoản? <a href="/register">Đăng ký ngay</a></p>
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
        document.querySelector('.toggle-password').addEventListener('click', function () {
            const passwordInput = document.getElementById('password');
            const icon = this;

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        });
    </script>
</body>

</html>