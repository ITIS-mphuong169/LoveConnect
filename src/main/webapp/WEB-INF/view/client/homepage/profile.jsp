<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Hồ sơ</title>
    <link rel="stylesheet" href="/css/profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
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
            <img src="${user.profilePictureUrl}" alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Main content -->
    <div class="main-content">
        <!-- Profile container -->
        <div class="profile-container">
            <!-- Photo carousel -->
            <div class="photo-carousel">
                <div class="carousel-slides">
                    <c:if test="${empty user.photos}">
                        <div class="carousel-slide active">
                            <img src="${user.profilePictureUrl}" alt="Ảnh hồ sơ">
                        </div>
                    </c:if>
                    <c:forEach var="photo" items="${user.photos}" varStatus="status">
                        <div class="carousel-slide${status.index == 0 ? ' active' : ''}">
                            <img src="${photo.photoUrl}" alt="Ảnh hồ sơ ${status.index + 1}">
                        </div>
                    </c:forEach>
                </div>
                <div class="carousel-indicators">
                    <c:if test="${empty user.photos}">
                        <div class="indicator active" data-index="0"></div>
                    </c:if>
                    <c:forEach var="photo" items="${user.photos}" varStatus="status">
                        <div class="indicator${status.index == 0 ? ' active' : ''}" data-index="${status.index}"></div>
                    </c:forEach>
                </div>
                <c:if test="${not empty user.photos && user.photos.size() > 1}">
                    <div class="carousel-arrow left">
                        <i class="fas fa-chevron-left"></i>
                    </div>
                    <div class="carousel-arrow right">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </c:if>
            </div>

            <!-- Profile info section -->
            <div class="profile-info">
                <div class="profile-header">
                    <div class="profile-name-age">
                        <h1 class="profile-name">${user.fullName}</h1>
                        <span class="profile-age">${user.age}</span>
                    </div>
                    <a href="/client/profile/edit" class="edit-profile-btn">
                        <i class="fas fa-pencil-alt"></i> Chỉnh sửa
                    </a>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-map-marker-alt"></i> Vị trí
                    </div>
                    <div class="profile-detail-content">
                        ${user.location != null ? user.location : 'Chưa cập nhật vị trí'}
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-venus-mars"></i> Giới tính
                    </div>
                    <div class="profile-detail-content">
                        ${user.gender}
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-envelope"></i> Email
                    </div>
                    <div class="profile-detail-content">
                        ${user.email}
                    </div>
                </div>

                <c:if test="${user.phoneNumber != null}">
                    <div class="profile-detail">
                        <div class="profile-detail-title">
                            <i class="fas fa-phone"></i> Số điện thoại
                        </div>
                        <div class="profile-detail-content">
                            ${user.phoneNumber}
                        </div>
                    </div>
                </c:if>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-info-circle"></i> Giới thiệu
                    </div>
                    <div class="profile-detail-content bio">
                        ${user.bio != null ? user.bio : 'Chưa có thông tin giới thiệu.'}
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-heart"></i> Sở thích
                    </div>
                    <div class="interests">
                        <c:choose>
                            <c:when test="${not empty user.interests}">
                                <c:forEach var="interest" items="${user.interests}">
                                    <div class="interest-tag">
                                        <i
                                            class="fa ${interest.iconClass != null ? interest.iconClass : 'fas fa-star'}"></i>
                                        ${interest.name}
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="profile-detail-content">Chưa cập nhật sở thích</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Preferences section -->
            <div class="compatibility-section">
                <h2 class="section-title">
                    <i class="fas fa-sliders-h"></i> Tùy chọn kết đôi
                </h2>
                <c:if test="${user.preference != null}">
                    <div class="compatibility-items">
                        <div class="compatibility-item">
                            <div class="compatibility-icon">
                                <i class="fas fa-heart"></i>
                            </div>
                            <div class="compatibility-text">
                                Quan tâm đến:
                                <c:choose>
                                    <c:when test="${user.preference.genderPreference == 'MALE'}">Nam</c:when>
                                    <c:when test="${user.preference.genderPreference == 'FEMALE'}">Nữ</c:when>
                                    <c:when test="${user.preference.genderPreference == 'OTHER'}">Khác</c:when>
                                    <c:when test="${user.preference.genderPreference == 'ANY'}">Tất cả</c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="compatibility-item">
                            <div class="compatibility-icon">
                                <i class="fas fa-birthday-cake"></i>
                            </div>
                            <div class="compatibility-text">
                                Độ tuổi: Từ ${user.preference.minAge} đến ${user.preference.maxAge}
                            </div>
                        </div>
                        <div class="compatibility-item">
                            <div class="compatibility-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="compatibility-text">
                                Khoảng cách tối đa: ${user.preference.maxDistance} km
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${user.preference == null}">
                    <div class="profile-detail-content">Chưa thiết lập tùy chọn kết đôi</div>
                </c:if>
            </div>

            <!-- Settings section -->
            <div class="settings-section">
                <h2 class="section-title">
                    <i class="fas fa-cog"></i> Cài đặt hồ sơ
                </h2>

                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Trạng thái tài khoản</div>
                        <div class="setting-description">Tài khoản của bạn hiện đang ${user.active ? 'hoạt động' : 'bị
                            vô hiệu hóa'}</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="activeToggle" ${user.active ? 'checked' : '' }>
                        <span class="toggle-slider"></span>
                    </label>
                </div>

                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Ngày tham gia</div>
                        <div class="setting-description">
                            <fmt:parseDate value="${user.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDate"
                                type="both" />
                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                        </div>
                    </div>
                </div>

                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Đăng nhập gần đây</div>
                        <div class="setting-description">
                            <c:choose>
                                <c:when test="${user.lastLogin != null}">
                                    <fmt:parseDate value="${user.lastLogin}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                        var="parsedLoginDate" type="both" />
                                    <fmt:formatDate value="${parsedLoginDate}" pattern="dd/MM/yyyy HH:mm" />
                                </c:when>
                                <c:otherwise>
                                    Chưa có thông tin
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
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
        <a href="/client/profile" class="nav-item active">
            <i class="far fa-user"></i>
            <span class="nav-label">Hồ sơ</span>
        </a>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Khởi tạo carousel
            const slides = document.querySelectorAll('.carousel-slide');
            const indicators = document.querySelectorAll('.indicator');
            const prevBtn = document.querySelector('.carousel-arrow.left');
            const nextBtn = document.querySelector('.carousel-arrow.right');
            let currentSlide = 0;
            const slideCount = slides.length;

            // Hàm hiển thị slide với index
            function showSlide(index) {
                // Ẩn tất cả slide và bỏ active
                slides.forEach(slide => {
                    slide.classList.remove('active');
                });

                indicators.forEach(indicator => {
                    indicator.classList.remove('active');
                });

                // Hiển thị slide hiện tại
                slides[index].classList.add('active');
                indicators[index].classList.add('active');

                currentSlide = index;
            }

            // Xử lý khi nhấn nút next
            if (nextBtn) {
                nextBtn.addEventListener('click', function () {
                    let nextIndex = currentSlide + 1;
                    if (nextIndex >= slideCount) {
                        nextIndex = 0;
                    }
                    showSlide(nextIndex);
                });
            }

            // Xử lý khi nhấn nút prev
            if (prevBtn) {
                prevBtn.addEventListener('click', function () {
                    let prevIndex = currentSlide - 1;
                    if (prevIndex < 0) {
                        prevIndex = slideCount - 1;
                    }
                    showSlide(prevIndex);
                });
            }

            // Xử lý khi nhấn vào indicator
            indicators.forEach((indicator, index) => {
                indicator.addEventListener('click', function () {
                    showSlide(index);
                });
            });

            // Tự động chuyển slide mỗi 5 giây nếu có nhiều hơn 1 slide
            if (slideCount > 1) {
                setInterval(function () {
                    let nextIndex = currentSlide + 1;
                    if (nextIndex >= slideCount) {
                        nextIndex = 0;
                    }
                    showSlide(nextIndex);
                }, 5000);
            }

        });
    </script>
</body>

</html>