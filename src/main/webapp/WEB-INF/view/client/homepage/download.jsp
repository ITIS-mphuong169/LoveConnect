<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Tải về</title>
    <link rel="stylesheet" href="/css/download.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <!-- header -->
    <header>
        <div class="logo">
            <img class="logo-icon" src="/images/logos/logo.svg" alt="LoveConnect Logo">
            <a href="/" class="logo-text">LoveConnect</a>
        </div>

        <nav>
            <ul>
                <li><a href="/client/products">Sản phẩm</a></li>
                <li><a href="/client/about">Tìm hiểu</a></li>
                <li><a href="/client/safe">An toàn</a></li>
                <li><a href="/client/support">Hỗ trợ</a></li>
                <li><a href="/client/download" class="active">Tải về</a></li>
            </ul>
        </nav>

        <div class="buttons">
            <a href="/login" class="login-btn">Đăng nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <section class="download-hero">
        <h1>TẢI LOVECONNECT NGAY</h1>
        <p>Hẹn hò tốt hơn bắt đầu với ứng dụng tốt hơn. Tải xuống LoveConnect và bắt đầu hành trình kết nối của bạn ngay
            hôm nay!</p>
    </section>

    <section class="download-options">
        <h2>Chọn nền tảng của bạn</h2>
        <div class="platform-grid">
            <div class="platform-card">
                <div class="platform-icon">
                    <i class="fab fa-apple"></i>
                </div>
                <h3>iOS</h3>
                <p>Tương thích với iPhone và iPad chạy iOS 13.0 trở lên.</p>
                <a href="#" class="download-btn">Tải từ App Store</a>
            </div>
            <div class="platform-card">
                <div class="platform-icon">
                    <i class="fab fa-android"></i>
                </div>
                <h3>Android</h3>
                <p>Tương thích với thiết bị Android chạy phiên bản 7.0 trở lên.</p>
                <a href="#" class="download-btn">Tải từ Google Play</a>
            </div>
            <div class="platform-card">
                <div class="platform-icon">
                    <i class="fas fa-desktop"></i>
                </div>
                <h3>Web</h3>
                <p>Truy cập LoveConnect từ trình duyệt của bạn trên máy tính hoặc laptop.</p>
                <a href="#" class="download-btn">Truy cập phiên bản web</a>
            </div>
        </div>
    </section>

    <section class="qr-section">
        <h2>Quét mã QR để tải xuống</h2>
        <p>Quét mã QR bên dưới để tải xuống ứng dụng từ cửa hàng trực tiếp vào thiết bị của bạn.</p>
        <div class="qr-container">
            <div class="qr-code">
                <img src="/images/qr/appstoreqr.png" alt="App Store QR Code">
                <span>App Store</span>
            </div>
            <div class="qr-code">
                <img src="/images/qr/googleplayqr.png" alt="Google Play QR Code">
                <span>Google Play</span>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h2>Câu hỏi thường gặp</h2>
        <div class="faq-item">
            <div class="faq-question">LoveConnect có miễn phí không?</div>
            <div class="faq-answer">Vâng, LoveConnect có thể được tải xuống và sử dụng miễn phí. Tuy nhiên, chúng tôi
                cũng cung cấp các tính năng cao cấp thông qua các gói đăng ký LoveConnect Plus và LoveConnect Gold.
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Tôi có thể sử dụng LoveConnect trên cả điện thoại và máy tính không?</div>
            <div class="faq-answer">Có, bạn có thể truy cập LoveConnect từ ứng dụng di động trên iOS và Android, cũng
                như từ phiên bản web trên máy tính của bạn. Tài khoản của bạn và tất cả dữ liệu sẽ được đồng bộ hóa trên
                tất cả các thiết bị.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Làm cách nào để cập nhật LoveConnect?</div>
            <div class="faq-answer">Đối với phiên bản di động, ứng dụng thường tự động cập nhật thông qua App Store hoặc
                Google Play Store. Bạn cũng có thể vào cửa hàng ứng dụng và cập nhật thủ công nếu có bản cập nhật mới.
                Đối với phiên bản web, nó luôn được cập nhật tự động.</div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Tôi gặp vấn đề khi tải xuống ứng dụng, tôi nên làm gì?</div>
            <div class="faq-answer">Nếu bạn gặp vấn đề khi tải xuống, hãy thử các bước sau: kiểm tra kết nối internet
                của bạn, đảm bảo thiết bị của bạn đáp ứng yêu cầu hệ thống tối thiểu, hoặc thử khởi động lại thiết bị
                của bạn. Nếu vấn đề vẫn tiếp diễn, vui lòng liên hệ với bộ phận hỗ trợ của chúng tôi.</div>
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