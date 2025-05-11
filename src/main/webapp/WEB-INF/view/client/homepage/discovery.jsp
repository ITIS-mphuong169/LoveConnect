<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Khám phá</title>
    <link rel="stylesheet" href="/css/discovery.css">
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
            <img src="${user.profilePictureUrl != null ? user.profilePictureUrl : '/images/users/default-avatar.jpg'}"
                alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Thêm input hidden cho CSRF token để sử dụng trong AJAX requests -->
    <input type="hidden" id="csrf-token" name="${_csrf.parameterName}" value="${_csrf.token}" />

    <!-- Main discovery area -->
    <div class="discovery-container">
        <!-- Filter bar -->
        <div class="filter-bar">
            <div class="filter-label">Lọc kết quả</div>
            <div class="filter-options">
                <div class="filter-option active" data-filter="all">Tất cả</div>
                <div class="filter-option" data-filter="nearby">Gần đây</div>
                <div class="filter-option" data-filter="new">Mới nhất</div>
                <div class="filter-option" data-filter="match">Phù hợp nhất</div>
            </div>
            <select class="filter-dropdown">
                <option value="all">Tất cả</option>
                <option value="nearby">Gần đây</option>
                <option value="new">Mới nhất</option>
                <option value="match">Phù hợp nhất</option>
            </select>
        </div>

        <!-- User Grid/List -->
        <div class="user-grid">
            <c:choose>
                <c:when test="${empty users}">
                    <!-- Hiển thị trạng thái trống nếu không có người dùng -->
                    <div class="empty-state">
                        <i class="far fa-frown"></i>
                        <h3>Không tìm thấy người dùng phù hợp</h3>
                        <p>Hãy thử thay đổi bộ lọc hoặc tìm kiếm của bạn để xem thêm kết quả.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Lặp qua danh sách người dùng từ database -->
                    <c:forEach items="${users}" var="user">
                        <c:if test="${user.userId ne myid}">
                            <div class="user-item" data-user-id="${user.userId}">
                                <img src="${user.profilePictureUrl}" alt="User profile" class="user-image">
                                <div class="user-info">
                                    <div class="user-name-age">
                                        <span class="user-name">${user.fullName}</span>
                                        <span class="user-age">${user.age}</span>
                                    </div>
                                    <div class="user-bio">
                                        ${not empty user.bio ? user.bio : 'Không có thông tin giới thiệu.'}
                                    </div>
                                    <div class="user-distance">
                                        Cách đây: ${user.preference.maxDistance} km
                                    </div>
                                </div>
                                <div class="action-row">
                                    <button class="action-btn dislike-btn" title="Bỏ qua">
                                        <i class="fas fa-times"></i> Bỏ qua
                                    </button>
                                    <a href="/client/discovery/matches/${user.userId}" class="superlike-btn">
                                        <button class="action-btn superlike-btn" title="Match">
                                            <i class="fas fa-star"></i> Match
                                        </button>
                                    </a>
                                    <button class="action-btn like-btn" title="Match">
                                        <i class="fas fa-heart"></i> Thích
                                    </button>
                                </div>
                            </div>
                        </c:if>

                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Status message container -->
    <div id="status-message" class="status-message" style="display: none;"></div>

    <!-- Bottom navigation -->
    <div class="bottom-nav">
        <a href="/client/discovery" class="nav-item active">
            <i class="fas fa-fire"></i>
            <span class="nav-label">Khám phá</span>
        </a>
        <a href="/client/toppick" class="nav-item">
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
        document.addEventListener('DOMContentLoaded', function () {
            // Lấy tất cả các nút Match (superlike-btn) trong danh sách người dùng
            const matchButtons = document.querySelectorAll('.superlike-btn');
            const csrfToken = document.getElementById('csrf-token').value;
            const statusMessage = document.getElementById('status-message');

            // Thêm sự kiện click cho mỗi nút Match
            matchButtons.forEach(button => {
                button.addEventListener('click', function () {
                    // Lấy thông tin người dùng từ thẻ cha
                    const userItem = this.closest('.user-item');
                    const userId = userItem.dataset.userId;

                    // Vô hiệu hóa nút và thay đổi giao diện
                    this.disabled = true;
                    this.innerHTML = '<i class="fas fa-check"></i> Đã gửi';
                    this.classList.add('matched');
                    this.style.backgroundColor = '#E8F5E9';
                    this.style.color = '#24b978';
                    this.style.pointerEvents = 'none'; // Ngăn không cho click nữa
                });
            });

            // Hàm hiển thị thông báo status
            function showStatusMessage(message, type) {
                statusMessage.textContent = message;
                statusMessage.className = 'status-message ' + type;
                statusMessage.style.display = 'block';

                // Tự động ẩn thông báo sau 3 giây
                setTimeout(() => {
                    statusMessage.style.opacity = '0';
                    setTimeout(() => {
                        statusMessage.style.display = 'none';
                        statusMessage.style.opacity = '1';
                    }, 300);
                }, 3000);
            }

            // Thêm CSS cho nút đã match
            const style = document.createElement('style');
            style.textContent = `
                .action-btn.matched {
                    cursor: default;
                    font-weight: 600;
                }
                .status-message {
                    opacity: 1;
                    transition: opacity 0.3s ease;
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>

</html>