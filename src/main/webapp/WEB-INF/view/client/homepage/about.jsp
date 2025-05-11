<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Tìm hiểu</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/about.css">
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
                <li><a href="/client/about" class="active">Tìm hiểu</a></li>
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

    <section class="learn-hero">
        <div class="learn-hero-content">
            <h1>Tìm hiểu về hẹn hò trực tuyến</h1>
        </div>
    </section>

    <section class="learn-categories">
        <h2>Khám phá theo chủ đề</h2>
        <div class="categories-grid">
            <a href="#profile-tips" class="category-card">
                <div class="category-icon">
                    <i class="fa-solid fa-user-pen"></i>
                </div>
                <h3>Mẹo hồ sơ</h3>
                <p>Tạo hồ sơ nổi bật để thu hút sự chú ý</p>
            </a>
            <a href="#messaging" class="category-card">
                <div class="category-icon">
                    <i class="fa-solid fa-comment-dots"></i>
                </div>
                <h3>Nhắn tin</h3>
                <p>Cách bắt đầu và duy trì cuộc trò chuyện thú vị</p>
            </a>
            <a href="#first-dates" class="category-card">
                <div class="category-icon">
                    <i class="fa-solid fa-mug-hot"></i>
                </div>
                <h3>Hẹn hò đầu tiên</h3>
                <p>Làm thế nào để lần hẹn đầu tiên thành công</p>
            </a>
            <a href="#relationship" class="category-card">
                <div class="category-icon">
                    <i class="fa-solid fa-heart"></i>
                </div>
                <h3>Mối quan hệ</h3>
                <p>Xây dựng mối quan hệ bền vững từ trực tuyến đến ngoại tuyến</p>
            </a>
        </div>
    </section>

    <section id="profile-tips" class="learn-section">
        <div class="learn-content">
            <h2>Mẹo tạo hồ sơ nổi bật</h2>
            <p class="section-description">Hồ sơ của bạn là ấn tượng đầu tiên. Hãy làm cho nó đáng nhớ với những lời
                khuyên từ chuyên gia.</p>

            <div class="article-grid">
                <div class="article-card">
                    <div class="article-content">
                        <h3>5 bí quyết để có ảnh hồ sơ hoàn hảo</h3>
                        <p>Tìm hiểu cách chụp ảnh hấp dẫn để tăng tỷ lệ match của bạn.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Viết tiểu sử hấp dẫn và chân thực</h3>
                        <p>Những gì nên đề cập và những gì nên tránh trong tiểu sử của bạn.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Chia sẻ sở thích để tìm điểm chung</h3>
                        <p>Cách hiển thị sở thích và đam mê để thu hút người có cùng quan điểm.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="messaging" class="learn-section alt-bg">
        <div class="learn-content">
            <h2>Nghệ thuật nhắn tin</h2>
            <p class="section-description">Trò chuyện trôi chảy là bước đầu tiên để xây dựng kết nối. Nắm vững nghệ
                thuật nhắn tin.</p>

            <div class="article-grid">
                <div class="article-card">
                    <div class="article-content">
                        <h3>Tin nhắn đầu tiên gây ấn tượng</h3>
                        <p>Những ý tưởng sáng tạo để bắt đầu cuộc trò chuyện và tránh những câu mở đầu nhàm chán.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Duy trì cuộc trò chuyện thú vị</h3>
                        <p>Các câu hỏi và chủ đề để giữ cho cuộc trò chuyện luôn hấp dẫn và thú vị.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Hướng dẫn sử dụng emoji trong nhắn tin</h3>
                        <p>Cách sử dụng emoji một cách hiệu quả để thể hiện cảm xúc mà không quá mức.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="first-dates" class="learn-section">
        <div class="learn-content">
            <h2>Chuẩn bị cho buổi hẹn đầu tiên</h2>
            <p class="section-description">Từ trực tuyến đến ngoại tuyến: mọi thứ bạn cần biết để có buổi hẹn hò đầu
                tiên thành công.</p>

            <div class="article-grid">
                <div class="article-card">
                    <div class="article-content">
                        <h3>10 ý tưởng hẹn hò đầu tiên sáng tạo</h3>
                        <p>Vượt qua buổi hẹn café truyền thống với những ý tưởng độc đáo và đáng nhớ.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Những câu hỏi để tránh sự im lặng khó xử</h3>
                        <p>Danh sách các câu hỏi thú vị để giữ cho cuộc trò chuyện luôn trôi chảy.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Ăn mặc phù hợp cho buổi hẹn đầu tiên</h3>
                        <p>Hướng dẫn về trang phục cho mọi loại hình buổi hẹn để tạo ấn tượng tốt.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="relationship" class="learn-section alt-bg">
        <div class="learn-content">
            <h2>Xây dựng mối quan hệ bền vững</h2>
            <p class="section-description">Từ những buổi hẹn hò đến mối quan hệ lâu dài: làm thế nào để nuôi dưỡng tình
                yêu bền vững.</p>

            <div class="article-grid">
                <div class="article-card">
                    <div class="article-content">
                        <h3>Khi nào nên có cuộc trò chuyện về độc quyền</h3>
                        <p>Cách và thời điểm để thảo luận về việc cam kết trong một mối quan hệ độc quyền.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Giao tiếp hiệu quả trong mối quan hệ</h3>
                        <p>Kỹ năng giao tiếp cần thiết để xây dựng sự tin tưởng và hiểu biết.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
                <div class="article-card">
                    <div class="article-content">
                        <h3>Duy trì mối quan hệ từ xa</h3>
                        <p>Mẹo để giữ tình yêu rực cháy ngay cả khi khoảng cách địa lý xa.</p>
                        <a href="#" class="read-more">Đọc thêm <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="learn-experts">
        <h2>Lời khuyên từ chuyên gia</h2>
        <div class="experts-container">
            <div class="expert-card">
                <img src="/images/users/user14.jpg" alt="Tiến sĩ Nguyễn Thị Mai" class="expert-image">
                <h3>Tiến sĩ Nguyễn Thị Mai</h3>
                <p class="expert-title">Chuyên gia tâm lý mối quan hệ</p>
                <p class="expert-quote">"Sự chân thành là nền tảng của mọi mối quan hệ lành mạnh. Hãy luôn thật với
                    chính mình và đối phương."</p>
                <a href="#" class="expert-articles">Xem các bài viết <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="expert-card">
                <img src="/images/users/user15.jpg" alt="ThS. Trần Văn Hùng" class="expert-image">
                <h3>ThS. Trần Văn Hùng</h3>
                <p class="expert-title">Nhà tư vấn hôn nhân</p>
                <p class="expert-quote">"Giao tiếp hiệu quả không chỉ là nói, mà còn là lắng nghe và thấu hiểu. Đó là
                    chìa khóa cho mối quan hệ bền vững."</p>
                <a href="#" class="expert-articles">Xem các bài viết <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="expert-card">
                <img src="/images/users/user16.jpg" alt="Cao Minh Tuấn" class="expert-image">
                <h3>Cao Minh Tuấn</h3>
                <p class="expert-title">Huấn luyện viên hẹn hò</p>
                <p class="expert-quote">"Hẹn hò nên vui vẻ và không gây áp lực. Hãy tận hưởng hành trình và đừng quá vội
                    vàng tìm kiếm kết quả."</p>
                <a href="#" class="expert-articles">Xem các bài viết <i class="fa-solid fa-arrow-right"></i></a>
            </div>
        </div>
    </section>

    <section class="learn-podcast">
        <div class="podcast-content">
            <div class="podcast-info">
                <h2>Podcast LoveConnect</h2>
                <p>Lắng nghe các cuộc thảo luận về tình yêu, mối quan hệ và hẹn hò hiện đại với các chuyên gia và khách
                    mời đặc biệt.</p>
                <ul class="podcast-platforms">
                    <li><a href="#"><i class="fab fa-spotify"></i> Spotify</a></li>
                    <li><a href="#"><i class="fab fa-apple"></i> Apple Podcasts</a></li>
                    <li><a href="#"><i class="fab fa-google"></i> Google Podcasts</a></li>
                </ul>
                <a href="#" class="podcast-btn">Khám phá tất cả các tập</a>
            </div>
            <div class="podcast-episodes">
                <div class="episode-card">
                    <div class="episode-number">TẬP 42</div>
                    <h3>Đối phó với nỗi sợ bị từ chối</h3>
                    <p>Làm thế nào để vượt qua nỗi sợ bị từ chối và tiếp cận hẹn hò với sự tự tin.</p>
                    <a href="#" class="listen-btn"><i class="fa-solid fa-play"></i> Nghe ngay</a>
                </div>
                <div class="episode-card">
                    <div class="episode-number">TẬP 41</div>
                    <h3>Hẹn hò sau khi chia tay</h3>
                    <p>Những thách thức khi quay lại với việc hẹn hò sau một mối quan hệ lâu dài.</p>
                    <a href="#" class="listen-btn"><i class="fa-solid fa-play"></i> Nghe ngay</a>
                </div>
            </div>
        </div>
    </section>

    <section class="learn-newsletter">
        <div class="newsletter-content">
            <h2>Đăng ký nhận bản tin</h2>
            <p>Nhận các bài viết mới nhất, lời khuyên hẹn hò và mẹo mối quan hệ trực tiếp vào hộp thư đến của bạn.</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Địa chỉ email của bạn" required>
                <button type="submit">Đăng ký</button>
            </form>
            <p class="privacy-note">Bằng cách đăng ký, bạn đồng ý với <a href="#">Chính sách quyền riêng tư</a> của
                chúng tôi.</p>
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