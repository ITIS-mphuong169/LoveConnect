<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Sản phẩm</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/products.css">
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
                <li><a href="/client/products" class="active">Sản phẩm</a></li>
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

    <section class="products-hero">
        <div class="products-hero-content">
            <h1>Chọn gói phù hợp với bạn</h1>
            <p>Khám phá các gói dịch vụ của LoveConnect và tìm kiếm người phù hợp với mình</p>
        </div>
    </section>

    <section class="pricing-plans">
        <h2>Gói dịch vụ</h2>
        <div class="pricing-toggle">
            <span class="pricing-period active" data-period="monthly">Thanh toán hàng tháng</span>
            <label class="toggle-switch">
                <input type="checkbox" id="pricing-switch">
                <span class="toggle-slider"></span>
            </label>
            <span class="pricing-period" data-period="yearly">Thanh toán hàng năm</span>
            <span class="save-badge">Tiết kiệm 40%</span>
        </div>

        <div class="pricing-grid">
            <div class="pricing-card">
                <div class="pricing-header">
                    <h3>Gói cơ bản</h3>
                    <div class="price-container">
                        <div class="price monthly-price">
                            <span class="price-amount">Miễn phí</span>
                        </div>
                        <div class="price yearly-price hidden">
                            <span class="price-amount">Miễn phí</span>
                        </div>
                    </div>
                </div>
                <div class="pricing-features">
                    <ul>
                        <li><i class="fa-solid fa-check"></i> Tạo hồ sơ cá nhân</li>
                        <li><i class="fa-solid fa-check"></i> Kết nối với 10 người mỗi ngày</li>
                        <li><i class="fa-solid fa-check"></i> Nhắn tin cơ bản</li>
                        <li><i class="fa-solid fa-check"></i> Tìm kiếm theo vị trí</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i> Lượt thích không giới hạn</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i> Xem ai thích bạn</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i> Ưu tiên hiển thị</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i> Tìm kiếm nâng cao</li>
                    </ul>
                </div>
                <a href="/register" class="pricing-btn">Bắt đầu ngay</a>
            </div>

            <div class="pricing-card popular">
                <div class="popular-badge">Phổ biến nhất</div>
                <div class="pricing-header">
                    <h3>Gói Premium</h3>
                    <div class="price-container">
                        <div class="price monthly-price">
                            <span class="price-amount">99K</span>
                            <span class="price-period">/ tháng</span>
                        </div>
                        <div class="price yearly-price hidden">
                            <span class="price-amount">59K</span>
                            <span class="price-period">/ tháng</span>
                        </div>
                    </div>
                </div>
                <div class="pricing-features">
                    <ul>
                        <li><i class="fa-solid fa-check"></i> Tất cả tính năng cơ bản</li>
                        <li><i class="fa-solid fa-check"></i> Lượt thích không giới hạn</li>
                        <li><i class="fa-solid fa-check"></i> Xem ai đã thích bạn</li>
                        <li><i class="fa-solid fa-check"></i> 5 Super Likes mỗi tuần</li>
                        <li><i class="fa-solid fa-check"></i> 1 Boost mỗi tháng</li>
                        <li><i class="fa-solid fa-check"></i> Tắt quảng cáo</li>
                        <li><i class="fa-solid fa-check"></i> Hủy ghép đôi vô hạn</li>
                        <li class="disabled"><i class="fa-solid fa-xmark"></i> Đặc quyền cao cấp</li>
                    </ul>
                </div>
                <a href="/login" class="pricing-btn">Đăng ký Premium</a>
            </div>

            <div class="pricing-card">
                <div class="pricing-header">
                    <h3>Gói Platinum</h3>
                    <div class="price-container">
                        <div class="price monthly-price">
                            <span class="price-amount">199K</span>
                            <span class="price-period">/ tháng</span>
                        </div>
                        <div class="price yearly-price hidden">
                            <span class="price-amount">119K</span>
                            <span class="price-period">/ tháng</span>
                        </div>
                    </div>
                </div>
                <div class="pricing-features">
                    <ul>
                        <li><i class="fa-solid fa-check"></i> Tất cả tính năng Premium</li>
                        <li><i class="fa-solid fa-check"></i> Ưu tiên hiển thị cao nhất</li>
                        <li><i class="fa-solid fa-check"></i> Thấy ai đã xem hồ sơ</li>
                        <li><i class="fa-solid fa-check"></i> 10 Super Likes mỗi tuần</li>
                        <li><i class="fa-solid fa-check"></i> 3 Boosts mỗi tháng</li>
                        <li><i class="fa-solid fa-check"></i> Tìm kiếm nâng cao</li>
                        <li><i class="fa-solid fa-check"></i> Nhắn tin ưu tiên</li>
                        <li><i class="fa-solid fa-check"></i> Hỗ trợ 24/7</li>
                    </ul>
                </div>
                <a href="/register" class="pricing-btn">Đăng ký Platinum</a>
            </div>
        </div>
    </section>

    <section class="features">
        <h2>Tính năng nổi bật</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-heart"></i>
                </div>
                <h3>Super Like</h3>
                <p>Tăng cơ hội kết nối lên 3 lần bằng cách gửi Super Like để thể hiện sự quan tâm đặc biệt.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-rocket"></i>
                </div>
                <h3>Boost</h3>
                <p>Hồ sơ của bạn sẽ được hiển thị hàng đầu trong khu vực của bạn trong 30 phút.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-location-dot"></i>
                </div>
                <h3>LoveConnect Passport</h3>
                <p>Kết nối với mọi người từ khắp nơi trên thế giới bằng cách thay đổi vị trí của bạn.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-eye"></i>
                </div>
                <h3>Xem ai thích bạn</h3>
                <p>Tiết kiệm thời gian bằng cách xem ngay những người đã thích bạn mà không cần phải vuốt.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-filter"></i>
                </div>
                <h3>Tìm kiếm nâng cao</h3>
                <p>Tìm kiếm đối tượng phù hợp với các bộ lọc nâng cao về sở thích, lối sống, giá trị sống.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-user-shield"></i>
                </div>
                <h3>Hồ sơ được xác minh</h3>
                <p>Xác minh hồ sơ qua ảnh selfie để tăng độ tin cậy và an toàn khi hẹn hò.</p>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <h2>Phản hồi từ người dùng</h2>
        <div class="testimonials-container">
            <div class="testimonial-card">
                <div class="testimonial-rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </div>
                <p class="testimonial-text">"Sau nhiều năm tìm kiếm, tôi đã tìm thấy người đặc biệt trên LoveConnect.
                    Chúng tôi sẽ kết hôn vào tháng sau!"</p>
                <div class="testimonial-author">
                    <img src="/images/users/user1.jpg" alt="Nguyễn Minh Tuấn" class="author-image">
                    <div class="author-info">
                        <h4>Nguyễn Minh Tuấn</h4>
                        <p>Thành viên Premium, 32 tuổi</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="testimonial-rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                </div>
                <p class="testimonial-text">"Tôi rất vui vì đã nâng cấp lên Platinum. Tính năng tìm kiếm nâng cao giúp
                    tôi tìm đúng người phù hợp trong thời gian ngắn."</p>
                <div class="testimonial-author">
                    <img src="/images/users/user2.png" alt="Trần Thị Mai" class="author-image">
                    <div class="author-info">
                        <h4>Trần Thị Mai</h4>
                        <p>Thành viên Platinum, 28 tuổi</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="testimonial-rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <p class="testimonial-text">"Tính năng Boost thực sự hiệu quả! Tôi nhận được nhiều lượt thích hơn hẳn và
                    đã có những cuộc hẹn rất thú vị."</p>
                <div class="testimonial-author">
                    <img src="/images/users/user3.jpg" alt="Lê Văn Đức" class="author-image">
                    <div class="author-info">
                        <h4>Lê Văn Đức</h4>
                        <p>Thành viên Premium, 35 tuổi</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="faq">
        <h2>Câu hỏi thường gặp</h2>
        <div class="faq-container">
            <div class="faq-item">
                <div class="faq-question">
                    <h3>Làm thế nào để nâng cấp tài khoản LoveConnect của tôi?</h3>
                    <span class="faq-icon"><i class="fa-solid fa-plus"></i></span>
                </div>
                <div class="faq-answer">
                    <p>Để nâng cấp tài khoản, hãy đăng nhập vào ứng dụng LoveConnect, nhấp vào biểu tượng hồ sơ ở góc
                        trên bên phải, chọn "Nâng cấp tài khoản" và làm theo hướng dẫn thanh toán.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <h3>Tôi có thể hủy đăng ký của mình bất cứ lúc nào không?</h3>
                    <span class="faq-icon"><i class="fa-solid fa-plus"></i></span>
                </div>
                <div class="faq-answer">
                    <p>Vâng, bạn có thể hủy đăng ký bất cứ lúc nào. Đơn giản chỉ cần vào phần Cài đặt > Quản lý Tài
                        khoản > Hủy Đăng ký. Bạn vẫn có thể sử dụng các tính năng đã thanh toán cho đến khi hết hạn đăng
                        ký hiện tại.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <h3>Super Like và Boost có thực sự hiệu quả không?</h3>
                    <span class="faq-icon"><i class="fa-solid fa-plus"></i></span>
                </div>
                <div class="faq-answer">
                    <p>Có! Super Like giúp tăng cơ hội kết nối lên 3 lần bằng cách thông báo cho người dùng khác rằng
                        bạn đặc biệt quan tâm đến họ. Boost giúp hồ sơ của bạn được hiển thị hàng đầu trong khu vực của
                        bạn trong 30 phút, tăng lượt xem hồ sơ lên đến 10 lần.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <h3>LoveConnect Passport là gì và cách sử dụng như thế nào?</h3>
                    <span class="faq-icon"><i class="fa-solid fa-plus"></i></span>
                </div>
                <div class="faq-answer">
                    <p>LoveConnect Passport là tính năng cho phép bạn thay đổi vị trí của mình để kết nối với mọi người
                        ở bất kỳ đâu trên thế giới. Để sử dụng, vào phần Cài đặt > Vị trí > Chọn địa điểm mới. Đây là
                        công cụ tuyệt vời nếu bạn sắp đi du lịch hoặc muốn mở rộng phạm vi tìm kiếm.</p>
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">
                    <h3>Làm thế nào để xác minh hồ sơ của tôi?</h3>
                    <span class="faq-icon"><i class="fa-solid fa-plus"></i></span>
                </div>
                <div class="faq-answer">
                    <p>Để xác minh hồ sơ, vào phần Chỉnh sửa hồ sơ > Xác minh hồ sơ. Hệ thống sẽ yêu cầu bạn chụp ảnh
                        selfie theo tư thế chỉ định. Sau khi xác minh thành công, hồ sơ của bạn sẽ được gắn huy hiệu xác
                        minh, giúp tăng độ tin cậy với người dùng khác.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="cta">
        <div class="cta-content">
            <h2>Sẵn sàng tìm kiếm tình yêu của bạn?</h2>
            <p>Đăng ký ngay hôm nay và bắt đầu hành trình tìm kiếm người đặc biệt</p>
            <div class="cta-buttons">
                <a href="/register" class="cta-btn">Tạo tài khoản</a>
                <a href="/client/download" class="cta-btn secondary">Tải ứng dụng</a>
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

    <script>
        // Pricing toggle functionality
        const pricingSwitch = document.getElementById('pricing-switch');
        const pricingPeriods = document.querySelectorAll('.pricing-period');
        const monthlyPrices = document.querySelectorAll('.monthly-price');
        const yearlyPrices = document.querySelectorAll('.yearly-price');

        pricingSwitch.addEventListener('change', function () {
            if (this.checked) {
                // Yearly pricing
                monthlyPrices.forEach(price => price.classList.add('hidden'));
                yearlyPrices.forEach(price => price.classList.remove('hidden'));
                pricingPeriods[0].classList.remove('active');
                pricingPeriods[1].classList.add('active');
            } else {
                // Monthly pricing
                monthlyPrices.forEach(price => price.classList.remove('hidden'));
                yearlyPrices.forEach(price => price.classList.add('hidden'));
                pricingPeriods[0].classList.add('active');
                pricingPeriods[1].classList.remove('active');
            }
        });

        // FAQ accordion functionality
        const faqItems = document.querySelectorAll('.faq-item');

        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            const answer = item.querySelector('.faq-answer');
            const icon = item.querySelector('.faq-icon i');

            question.addEventListener('click', () => {
                // Close all other items
                faqItems.forEach(otherItem => {
                    if (otherItem !== item) {
                        otherItem.querySelector('.faq-answer').style.maxHeight = null;
                        otherItem.querySelector('.faq-icon i').classList.remove('fa-minus');
                        otherItem.querySelector('.faq-icon i').classList.add('fa-plus');
                    }
                });

                // Toggle current item
                if (answer.style.maxHeight) {
                    answer.style.maxHeight = null;
                    icon.classList.remove('fa-minus');
                    icon.classList.add('fa-plus');
                } else {
                    answer.style.maxHeight = answer.scrollHeight + "px";
                    icon.classList.remove('fa-plus');
                    icon.classList.add('fa-minus');
                }
            });
        });
    </script>
</body>

</html>