<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Hẹn hò & Kết bạn</title>
    <link rel="stylesheet" href="/css/style.css">
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
            <a href="/login" class="login-btn">Đăng nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <section class="hero">
        <h1>QUẸT PHẢI</h1>
        <p>Tạo kết nối. Hẹn hò. Xây dựng mối quan hệ.</p>
        <img src="/images/backgrounds/match-hero.webp" alt="LoveConnect App Screenshot" class="hero-image">
    </section>

    <section class="features">
        <h2>Tại sao chọn LoveConnect?</h2>
        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">👋</div>
                <h3>Gặp gỡ những người mới</h3>
                <p>Mở rộng mạng lưới xã hội của bạn và gặp gỡ những người cùng quan điểm ở khu vực của bạn.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💬</div>
                <h3>Kết nối có ý nghĩa</h3>
                <p>Trò chuyện và kết nối với những người mới chia sẻ sở thích và niềm đam mê của bạn.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🌟</div>
                <h3>Tính năng độc đáo</h3>
                <p>Từ Swipe Night đến Passport, chúng tôi liên tục cập nhật các tính năng mới để nâng cao trải nghiệm
                    của bạn.</p>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <h2>Câu chuyện thành công</h2>
        <div class="testimonial-container">
            <div class="testimonial">
                <p>"Tôi đã gặp người yêu hiện tại của mình trên LoveConnect sau khi vuốt phải hồ sơ của anh ấy. Chúng
                    tôi đã
                    hẹn hò được 2 năm và đang lên kế hoạch cho tương lai!"</p>
                <div class="testimonial-author">- Minh Anh, 28</div>
            </div>
            <div class="testimonial">
                <p>"Tôi mới chuyển đến thành phố và không biết nhiều người. LoveConnect đã giúp tôi kết nối với những
                    người
                    tuyệt vời và tạo dựng được tình bạn bền vững."</p>
                <div class="testimonial-author">- Hoàng, 25</div>
            </div>
            <div class="testimonial">
                <p>"Tôi gặp vợ chưa cưới của mình trên LoveConnect trong thời gian cách ly vì COVID.
                    Chúng tôi đều theo Cơ đốc giáo và vướng "lưới tình" mà không tài nào
                    gỡ được."</p>
                <div class="testimonial-author">- Duy, 25</div>
            </div>
        </div>
    </section>

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
</body>

</html>