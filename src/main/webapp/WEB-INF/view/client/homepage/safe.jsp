<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | An toàn</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/safe.css">
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
                <li><a href="/client/safe" class="active">An toàn</a></li>
                <li><a href="/client/support">Hỗ trợ</a></li>
                <li><a href="/client/download">Tải về</a></li>
            </ul>
        </nav>

        <div class="buttons">
            <a href="/login" class="login-btn">Đăng nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <section class="safety-hero">
        <div class="safety-hero-content">
            <h1>An toàn là ưu tiên hàng đầu của chúng tôi</h1>
        </div>
    </section>

    <section class="safety-features">
        <h2>Các tính năng an toàn của chúng tôi</h2>
        <div class="safety-grid">
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-shield-halved"></i>
                </div>
                <h3>Xác minh danh tính</h3>
                <p>Xác minh hồ sơ để đảm bảo bạn đang trò chuyện với người thật, không phải kẻ giả mạo.</p>
            </div>
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-user-lock"></i>
                </div>
                <h3>Quyền riêng tư</h3>
                <p>Bạn kiểm soát hoàn toàn ai có thể thấy bạn và thông tin nào được chia sẻ trên hồ sơ của bạn.</p>
            </div>
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-video"></i>
                </div>
                <h3>Video Call an toàn</h3>
                <p>Trò chuyện video với đối tượng tiềm năng trước khi gặp gỡ để đảm bảo sự thoải mái và an toàn.</p>
            </div>
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-bell"></i>
                </div>
                <h3>Báo cáo và chặn</h3>
                <p>Dễ dàng báo cáo hành vi đáng ngờ và chặn người dùng mà không cần lý do.</p>
            </div>
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-location-dot"></i>
                </div>
                <h3>Chia sẻ vị trí</h3>
                <p>Tùy chọn chia sẻ vị trí của bạn với bạn bè khi đi hẹn hò đầu tiên.</p>
            </div>
            <div class="safety-card">
                <div class="safety-icon">
                    <i class="fa-solid fa-comment-slash"></i>
                </div>
                <h3>Lọc tin nhắn</h3>
                <p>Công nghệ AI của chúng tôi phát hiện và lọc các tin nhắn có nội dung không phù hợp hoặc quấy rối.</p>
            </div>
        </div>
    </section>

    <section class="safety-tips">
        <h2>Mẹo hẹn hò an toàn</h2>
        <div class="tips-container">
            <div class="tip">
                <div class="tip-number">01</div>
                <h3>Gặp ở nơi công cộng</h3>
                <p>Luôn sắp xếp các cuộc hẹn đầu tiên ở những nơi công cộng đông người như quán cà phê, nhà hàng hoặc
                    công viên.</p>
            </div>
            <div class="tip">
                <div class="tip-number">02</div>
                <h3>Thông báo cho bạn bè</h3>
                <p>Cho bạn bè hoặc gia đình biết kế hoạch của bạn, bao gồm thời gian, địa điểm và thông tin về người bạn
                    sẽ gặp.</p>
            </div>
            <div class="tip">
                <div class="tip-number">03</div>
                <h3>Tin vào trực giác của bạn</h3>
                <p>Nếu bạn cảm thấy không thoải mái hoặc có điều gì đó không ổn, hãy có kế hoạch thoát khỏi tình huống
                    một cách an toàn.</p>
            </div>
            <div class="tip">
                <div class="tip-number">04</div>
                <h3>Tránh chia sẻ thông tin cá nhân</h3>
                <p>Đừng chia sẻ địa chỉ nhà, nơi làm việc hoặc thông tin tài chính cho đến khi bạn thực sự tin tưởng
                    người đó.</p>
            </div>
        </div>
    </section>

    <section class="safety-resources">
        <h2>Tài nguyên an toàn</h2>
        <p class="resources-intro">Chúng tôi hợp tác với các tổ chức để đảm bảo bạn luôn có sự hỗ trợ khi cần thiết.</p>
        <div class="resources-grid">
            <div class="resource-card">
                <h3>Đường dây nóng hỗ trợ</h3>
                <p>Gọi 1800-xxx-xxx để được hỗ trợ khẩn cấp hoặc báo cáo các vấn đề liên quan đến an toàn.</p>
                <a href="#" class="resource-link">Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="resource-card">
                <h3>Trung tâm An toàn</h3>
                <p>Truy cập trung tâm an toàn trực tuyến của chúng tôi để biết các hướng dẫn chi tiết và tài liệu hữu
                    ích.</p>
                <a href="#" class="resource-link">Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="resource-card">
                <h3>Hỗ trợ tâm lý</h3>
                <p>Đội ngũ chuyên gia tư vấn tâm lý sẵn sàng hỗ trợ nếu bạn gặp phải trải nghiệm tiêu cực.</p>
                <a href="#" class="resource-link">Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>
    </section>

    <section class="safety-commitment">
        <div class="commitment-content">
            <h2>Cam kết của chúng tôi</h2>
            <p>LoveConnect cam kết liên tục cải thiện các tính năng an toàn và bảo mật để bảo vệ người dùng. Chúng tôi
                đầu tư vào công nghệ AI tiên tiến để phát hiện và ngăn chặn hành vi có hại trên nền tảng của mình.</p>
            <p>Đội ngũ an toàn của chúng tôi làm việc 24/7 để kiểm tra các báo cáo và đảm bảo môi trường hẹn hò an toàn
                cho tất cả người dùng.</p>
            <a href="#" class="safety-report-btn">Báo cáo vấn đề</a>
        </div>
        <img src="/images/users/safety.webp" alt="Cam kết an toàn" class="commitment-image">
    </section>

    <section class="safety-faq">
        <h2>Câu hỏi thường gặp về an toàn</h2>
        <div class="faq-container">
            <div class="faq-item">
                <h3>Làm thế nào để báo cáo người dùng đáng ngờ?</h3>
                <p>Bạn có thể báo cáo người dùng bằng cách nhấp vào biểu tượng "..." trong ứng dụng và chọn "Báo cáo".
                    Chúng tôi sẽ xem xét báo cáo của bạn trong vòng 24 giờ.</p>
            </div>
            <div class="faq-item">
                <h3>LoveConnect có xác minh danh tính người dùng không?</h3>
                <p>Có, chúng tôi cung cấp tính năng xác minh tùy chọn cho phép người dùng xác nhận danh tính của họ
                    thông qua ảnh selfie. Hồ sơ đã xác minh được đánh dấu bằng huy hiệu xanh.</p>
            </div>
            <div class="faq-item">
                <h3>Thông tin cá nhân của tôi có an toàn không?</h3>
                <p>Chúng tôi sử dụng mã hóa tiên tiến để bảo vệ dữ liệu của bạn và không bao giờ chia sẻ thông tin cá
                    nhân của bạn với các bên thứ ba mà không có sự đồng ý của bạn.</p>
            </div>
            <div class="faq-item">
                <h3>Làm cách nào để chặn người dùng?</h3>
                <p>Bạn có thể chặn người dùng bất kỳ lúc nào bằng cách truy cập hồ sơ của họ và nhấp vào tùy chọn
                    "Chặn". Người dùng bị chặn sẽ không thể liên hệ với bạn hoặc xem hồ sơ của bạn.</p>
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