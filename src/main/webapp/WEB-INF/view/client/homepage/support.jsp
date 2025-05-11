<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Hỗ trợ</title>
    <link rel="stylesheet" href="/css/support.css">
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
                <li><a href="/client/support" class="active">Hỗ trợ</a></li>
                <li><a href="/client/download">Tải về</a></li>
            </ul>
        </nav>

        <div class="buttons">
            <a href="/login" class="login-btn">Đăng nhập</a>
            <a href="/register" class="signup-btn">Tạo tài khoản</a>
        </div>
    </header>

    <section class="support-hero">
        <h1>CHÚNG TÔI LUÔN SẴN SÀNG HỖ TRỢ BẠN</h1>
        <p>Tìm câu trả lời cho câu hỏi của bạn hoặc liên hệ với đội ngũ hỗ trợ của chúng tôi khi bạn cần trợ giúp.</p>
        <div class="search-container">
            <input type="text" class="search-input" placeholder="Tìm kiếm câu hỏi...">
            <button class="search-btn"><i class="fas fa-search"></i></button>
        </div>
    </section>

    <section class="help-topics">
        <h2>Chủ đề trợ giúp phổ biến</h2>
        <div class="topics-grid">
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-user"></i>
                </div>
                <h3>Tài khoản & Đăng nhập</h3>
                <p>Các vấn đề về đăng nhập, xác minh và quản lý tài khoản.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-cog"></i>
                </div>
                <h3>Cài đặt & Riêng tư</h3>
                <p>Quản lý thông tin cá nhân và tùy chỉnh tài khoản của bạn.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-heart"></i>
                </div>
                <h3>Trận đấu & Tin nhắn</h3>
                <p>Xử lý sự cố khi ghép đôi và nhắn tin với người phù hợp.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-credit-card"></i>
                </div>
                <h3>Thanh toán & Nâng cấp</h3>
                <p>Giải quyết các vấn đề thanh toán và thông tin đăng ký.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-bell"></i>
                </div>
                <h3>Thông báo</h3>
                <p>Quản lý thông báo đẩy, email và cài đặt cảnh báo.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3>An toàn & Báo cáo</h3>
                <p>Báo cáo hành vi đáng ngờ và giữ an toàn khi hẹn hò trực tuyến.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-bug"></i>
                </div>
                <h3>Lỗi kỹ thuật</h3>
                <p>Khắc phục sự cố kỹ thuật và vấn đề với ứng dụng.</p>
            </div>
            <div class="topic-card">
                <div class="topic-icon">
                    <i class="fas fa-question-circle"></i>
                </div>
                <h3>Câu hỏi chung</h3>
                <p>Các câu hỏi thường gặp khác về ứng dụng LoveConnect.</p>
            </div>
        </div>
    </section>

    <section class="contact-section">
        <h2>Liên hệ với chúng tôi</h2>
        <div class="contact-container">
            <div class="contact-method">
                <div class="contact-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <h3>Trò chuyện trực tiếp</h3>
                <p>Nhận trợ giúp ngay lập tức từ một trong những đại diện hỗ trợ của chúng tôi.</p>
                <a href="#" class="contact-btn">Bắt đầu trò chuyện</a>
            </div>
            <div class="contact-method">
                <div class="contact-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <h3>Gửi email cho chúng tôi</h3>
                <p>Gửi câu hỏi của bạn và chúng tôi sẽ trả lời qua email trong vòng 24 giờ.</p>
                <a href="#" class="contact-btn">Gửi email</a>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h2>Câu hỏi thường gặp</h2>
        <div class="faq-item">
            <div class="faq-question">Làm thế nào để tôi có thể thay đổi vị trí của mình?</div>
            <div class="faq-answer">
                <p>Để thay đổi vị trí của bạn, hãy làm theo các bước sau:</p>
                <ol>
                    <li>Mở ứng dụng LoveConnect và đăng nhập vào tài khoản của bạn</li>
                    <li>Nhấn vào biểu tượng Hồ sơ ở góc dưới cùng bên phải</li>
                    <li>Nhấn vào "Cài đặt"</li>
                    <li>Cuộn xuống và chọn "Vị trí"</li>
                    <li>Từ đây, bạn có thể bật hoặc tắt "Vị trí tự động" hoặc nhập vị trí thủ công</li>
                </ol>
                <p>Lưu ý: Nếu bạn là người dùng LoveConnect Plus hoặc Gold, bạn có thể sử dụng tính năng Passport để đặt
                    vị trí của mình ở bất kỳ đâu trên thế giới.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Làm cách nào để tôi xác minh ảnh hồ sơ của mình?</div>
            <div class="faq-answer">
                <p>Xác minh ảnh giúp tăng độ tin cậy của hồ sơ của bạn. Để xác minh ảnh hồ sơ:</p>
                <ol>
                    <li>Mở ứng dụng LoveConnect và đăng nhập</li>
                    <li>Nhấn vào biểu tượng Hồ sơ</li>
                    <li>Chọn "Chỉnh sửa Hồ sơ"</li>
                    <li>Nhấn vào "Xác minh ảnh"</li>
                    <li>Làm theo hướng dẫn để chụp ảnh selfie tạo dáng như mẫu được hiển thị</li>
                </ol>
                <p>Sau khi gửi, nhóm của chúng tôi sẽ xem xét và xác minh ảnh của bạn trong vòng 24 giờ.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Tôi có thể hủy đăng ký LoveConnect Plus/Gold của mình như thế nào?</div>
            <div class="faq-answer">
                <p>Để hủy đăng ký LoveConnect Plus hoặc Gold:</p>
                <p><strong>Đối với người dùng iOS:</strong></p>
                <ol>
                    <li>Mở Cài đặt trên iPhone của bạn</li>
                    <li>Nhấn vào Apple ID của bạn ở trên cùng</li>
                    <li>Chọn "Đăng ký"</li>
                    <li>Tìm và chọn đăng ký LoveConnect</li>
                    <li>Nhấn "Hủy đăng ký"</li>
                </ol>
                <p><strong>Đối với người dùng Android:</strong></p>
                <ol>
                    <li>Mở Google Play Store</li>
                    <li>Nhấn vào biểu tượng menu (3 gạch ngang)</li>
                    <li>Chọn "Đăng ký"</li>
                    <li>Tìm và chọn đăng ký LoveConnect</li>
                    <li>Nhấn "Hủy đăng ký"</li>
                </ol>
                <p>Lưu ý: Việc hủy đăng ký sẽ ngừng gia hạn tự động, nhưng bạn vẫn có thể sử dụng dịch vụ đã thanh toán
                    cho đến khi hết thời hạn đăng ký hiện tại.</p>
            </div>
        </div>
        <div class="faq-item">
            <div class="faq-question">Tôi có thể chặn hoặc báo cáo người dùng khác không?</div>
            <div class="faq-answer">
                <p>Có, bạn có thể chặn hoặc báo cáo người dùng mà bạn cảm thấy không thoải mái hoặc vi phạm điều khoản
                    dịch vụ của chúng tôi:</p>
                <p><strong>Để chặn hoặc báo cáo người dùng:</strong></p>
                <ol>
                    <li>Mở hồ sơ của người dùng mà bạn muốn chặn hoặc báo cáo</li>
                    <li>Nhấn vào biểu tượng "..." hoặc "Menu" ở góc trên cùng bên phải</li>
                    <li>Chọn "Chặn" hoặc "Báo cáo"</li>
                    <li>Nếu báo cáo, hãy chọn lý do báo cáo từ danh sách được cung cấp</li>
                    <li>Xác nhận lựa chọn của bạn</li>
                </ol>
                <p>Chúng tôi xem xét mọi báo cáo một cách nghiêm túc và sẽ hành động phù hợp để đảm bảo an toàn cho cộng
                    đồng LoveConnect.</p>
            </div>
        </div>
    </section>

    <section class="community-section">
        <h2>Kết nối với cộng đồng của chúng tôi</h2>
        <p>Tham gia cộng đồng LoveConnect trên các nền tảng mạng xã hội để nhận các mẹo hẹn hò, cập nhật về tính năng
            mới, và chia sẻ câu chuyện thành công của bạn.</p>
        <div class="social-links">
            <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-link"><i class="fab fa-tiktok"></i></a>
            <a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
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

    <script>
        // Simple script to toggle FAQ items
        document.addEventListener('DOMContentLoaded', function () {
            const faqItems = document.querySelectorAll('.faq-item');

            faqItems.forEach(item => {
                const question = item.querySelector('.faq-question');

                question.addEventListener('click', () => {
                    // Close all other FAQ items
                    faqItems.forEach(otherItem => {
                        if (otherItem !== item && otherItem.classList.contains(
                                'active')) {
                            otherItem.classList.remove('active');
                        }
                    });

                    // Toggle current FAQ item
                    item.classList.toggle('active');
                });
            });
        });
    </script>
</body>

</html>