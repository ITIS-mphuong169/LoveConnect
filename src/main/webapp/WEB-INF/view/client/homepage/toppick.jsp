<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Top Picks</title>
    <link rel="stylesheet" href="/css/toppick.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>

    <!-- Header -->
    <header>
        <div class="logo">
            <img src="/images/logos/logo.svg" alt="LoveConnect Logo" class="logo-icon">
            <a href="/client/discovery" class="logo-text">LoveConnect</a>
        </div>
        <div class="header-icons">
            <i class="fas fa-sliders-h"></i>
            <form method="post" action="/logout">
                <!-- chống tấn công csrf -->
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</button>
            </form>
            <img src="/images/users/user1.jpg" alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Top Picks container -->
    <div class="toppicks-container">
        <!-- Top Picks header -->
        <div class="toppicks-header">
            <div class="toppicks-title">Top Picks Hôm Nay</div>
            <div class="toppicks-subtitle">Những người phù hợp nhất với bạn dựa trên sở thích và hoạt động</div>
            <div class="toppicks-refresh">
                <i class="fas fa-sync-alt"></i> Làm mới sau 24 giờ
            </div>
        </div>

        <!-- Premium banner -->
        <div class="premium-banner">
            <div class="premium-info">
                <div class="premium-title">Nâng cấp lên Premium</div>
                <div class="premium-description">Xem tất cả Top Picks và có nhiều cơ hội kết nối hơn</div>
                <button class="premium-button">Nâng cấp ngay</button>
            </div>
            <div class="premium-icon">
                <i class="fas fa-crown"></i>
            </div>
        </div>

        <!-- Countdown timer -->
        <div class="countdown-container">
            <div class="countdown-text">Top Picks mới trong:</div>
            <div class="countdown-timer">
                <div class="countdown-box">
                    <div class="countdown-value" id="hours">13</div>
                    <div class="countdown-label">Giờ</div>
                </div>
                <div class="countdown-box">
                    <div class="countdown-value" id="minutes">45</div>
                    <div class="countdown-label">Phút</div>
                </div>
                <div class="countdown-box">
                    <div class="countdown-value" id="seconds">22</div>
                    <div class="countdown-label">Giây</div>
                </div>
            </div>
        </div>

        <!-- Top Picks grid -->
        <div class="toppicks-grid">
            <!-- Free pick -->
            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image">
                <div class="pick-badge">
                    <i class="fas fa-bolt"></i> Top Pick
                </div>
                <div class="pick-info">
                    <div class="pick-name-age">
                        <span class="pick-name">Hương</span>
                        <span class="pick-age">26</span>
                    </div>
                    <div class="pick-distance">
                        <i class="fas fa-map-marker-alt"></i> Cách 5 km
                    </div>
                    <div class="pick-interests">
                        <div class="interest-tag">Du lịch</div>
                        <div class="interest-tag">Âm nhạc</div>
                        <div class="interest-tag">Cafe</div>
                    </div>
                </div>
            </div>

            <!-- Locked picks -->
            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image blurred">
                <div class="lock-overlay">
                    <div class="lock-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="lock-text">Mở khóa Top Picks</div>
                    <button class="unlock-button">Nâng cấp</button>
                </div>
            </div>

            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image blurred">
                <div class="lock-overlay">
                    <div class="lock-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="lock-text">Mở khóa Top Picks</div>
                    <button class="unlock-button">Nâng cấp</button>
                </div>
            </div>

            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image blurred">
                <div class="lock-overlay">
                    <div class="lock-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="lock-text">Mở khóa Top Picks</div>
                    <button class="unlock-button">Nâng cấp</button>
                </div>
            </div>

            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image blurred">
                <div class="lock-overlay">
                    <div class="lock-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="lock-text">Mở khóa Top Picks</div>
                    <button class="unlock-button">Nâng cấp</button>
                </div>
            </div>

            <div class="pick-card">
                <img src="/images/users/user1.jpg" alt="User" class="pick-image blurred">
                <div class="lock-overlay">
                    <div class="lock-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="lock-text">Mở khóa Top Picks</div>
                    <button class="unlock-button">Nâng cấp</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom navigation -->
    <div class="bottom-nav">
        <a href="/client/discovery" class="nav-item">
            <i class="fas fa-fire"></i>
            <span class="nav-label">Khám phá</span>
        </a>
        <a href="/client/toppick" class="nav-item active">
            <i class="far fa-star"></i>
            <span class="nav-label">Top Picks</span>
        </a>
        <a href="/client/message" class="nav-item">
            <i class="far fa-comment"></i>
            <span class="nav-label">Tin nhắn</span>
        </a>
        <a href="/client/matches" class="nav-item">
            <i class="fas fa-users"></i>
            <span class="nav-label">Kết nối</span>
        </a>
        <a href="/client/profile" class="nav-item">
            <i class="far fa-user"></i>
            <span class="nav-label">Hồ sơ</span>
        </a>
    </div>

    <script>
        // Countdown timer functionality
        function updateCountdown() {
            const hours = document.getElementById('hours');
            const minutes = document.getElementById('minutes');
            const seconds = document.getElementById('seconds');

            let h = parseInt(hours.textContent);
            let m = parseInt(minutes.textContent);
            let s = parseInt(seconds.textContent);

            s = s - 1;

            if (s < 0) {
                s = 59;
                m = m - 1;

                if (m < 0) {
                    m = 59;
                    h = h - 1;

                    if (h < 0) {
                        // Reset to 24 hours when timer reaches zero
                        h = 23;
                        m = 59;
                        s = 59;
                    }
                }
            }

            hours.textContent = h.toString().padStart(2, '0');
            minutes.textContent = m.toString().padStart(2, '0');
            seconds.textContent = s.toString().padStart(2, '0');
        }

        // Update countdown every second
        setInterval(updateCountdown, 1000);

        // Unlock premium functionality
        const unlockButtons = document.querySelectorAll('.unlock-button, .premium-button');
        unlockButtons.forEach(button => {
            button.addEventListener('click', function () {
                alert('Mở trang đăng ký Premium');
            });
        });

        // Handle pick card interactions
        const pickCard = document.querySelector('.pick-card:first-child');
        pickCard.addEventListener('click', function (e) {
            // Only trigger if not clicking action buttons
            if (!e.target.closest('.pick-action')) {
                alert('Xem chi tiết hồ sơ');
            }
        });

        // Add action buttons to free pick on hover
        pickCard.addEventListener('mouseenter', function () {
            // Check if actions already exist
            if (!this.querySelector('.pick-action-buttons')) {
                const actionButtons = document.createElement('div');
                actionButtons.className = 'pick-action-buttons';
                actionButtons.innerHTML = `
                    <div class="pick-action dislike" title="Bỏ qua">
                        <i class="fas fa-times"></i>
                    </div>
                    <div class="pick-action like" title="Thích">
                        <i class="fas fa-heart"></i>
                    </div>
                `;
                this.appendChild(actionButtons);

                // Add event listeners to new buttons
                this.querySelector('.pick-action.like').addEventListener('click', function (e) {
                    e.stopPropagation();
                    alert('Đã thích người dùng này');
                });

                this.querySelector('.pick-action.dislike').addEventListener('click', function (e) {
                    e.stopPropagation();
                    alert('Đã bỏ qua người dùng này');
                });
            }
        });

        pickCard.addEventListener('mouseleave', function () {
            const actionButtons = this.querySelector('.pick-action-buttons');
            if (actionButtons) {
                actionButtons.remove();
            }
        });
    </script>
</body>

</html>