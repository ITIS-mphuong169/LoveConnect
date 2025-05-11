<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Xem hồ sơ</title>
    <link rel="stylesheet" href="/css/view-profile.css">
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
            <!-- Back button -->
            <div class="back-button">
                <a href="javascript:history.back()">
                    <i class="fas fa-arrow-left"></i> Quay lại
                </a>
            </div>

            <!-- Photo carousel -->
            <div class="photo-carousel">
                <div class="carousel-slides">
                    <c:if test="${empty sender.photos}">
                        <div class="carousel-slide active">
                            <img src="${sender.profilePictureUrl}" alt="Ảnh hồ sơ">
                        </div>
                    </c:if>
                    <c:forEach var="photo" items="${sender.photos}" varStatus="status">
                        <div class="carousel-slide${status.index == 0 ? ' active' : ''}">
                            <img src="${photo.photoUrl}" alt="Ảnh hồ sơ ${status.index + 1}">
                        </div>
                    </c:forEach>
                </div>
                <div class="carousel-indicators">
                    <c:if test="${empty sender.photos}">
                        <div class="indicator active" data-index="0"></div>
                    </c:if>
                    <c:forEach var="photo" items="${sender.photos}" varStatus="status">
                        <div class="indicator${status.index == 0 ? ' active' : ''}" data-index="${status.index}"></div>
                    </c:forEach>
                </div>
                <c:if test="${not empty sender.photos && sender.photos.size() > 1}">
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
                        <h1 class="profile-name">${sender.fullName}</h1>
                        <span class="profile-age">${sender.age}</span>
                    </div>
                    <div class="profile-actions">
                        <c:choose>
                            <c:when test="${isMatched}">
                                <a href="/client/message/${matchId}" class="message-btn">
                                    <i class="far fa-comment"></i> Nhắn tin
                                </a>
                            </c:when>
                            <c:otherwise>
                                <button class="like-btn" data-user-id="${sender.userId}">
                                    <i class="fas fa-heart"></i> Thích
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-map-marker-alt"></i> Vị trí
                    </div>
                    <div class="profile-detail-content">
                        ${sender.location != null ? sender.location : 'Chưa cập nhật vị trí'}
                        <c:if test="${sender.preference.maxDistance != null}">
                            <span class="distance">(Cách bạn ${sender.preference.maxDistance} km)</span>
                        </c:if>
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-venus-mars"></i> Giới tính
                    </div>
                    <div class="profile-detail-content">
                        ${sender.gender}
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-info-circle"></i> Giới thiệu
                    </div>
                    <div class="profile-detail-content bio">
                        ${sender.bio != null ? sender.bio : 'Chưa có thông tin giới thiệu.'}
                    </div>
                </div>

                <div class="profile-detail">
                    <div class="profile-detail-title">
                        <i class="fas fa-heart"></i> Sở thích
                    </div>
                    <div class="interests">
                        <c:choose>
                            <c:when test="${not empty sender.interests}">
                                <c:forEach var="interest" items="${sender.interests}">
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



            <!-- Report section -->
            <div class="report-section">
                <button class="report-btn" data-toggle="modal" data-target="#reportModal">
                    <i class="fas fa-flag"></i> Báo cáo người dùng này
                </button>
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
        <a href="/client/profile" class="nav-item">
            <i class="far fa-user"></i>
            <span class="nav-label">Hồ sơ</span>
        </a>
    </div>

    <!-- Report Modal -->
    <div class="modal" id="reportModal">
        <div class="modal-content">
            <h3>Báo cáo người dùng</h3>
            <p>Vui lòng chọn lý do báo cáo người dùng này:</p>

            <form id="reportForm">
                <input type="hidden" name="reportedUserId" value="${viewUser.userId}">

                <div class="report-options">
                    <div class="report-option">
                        <input type="radio" id="reason1" name="reason" value="INAPPROPRIATE_CONTENT">
                        <label for="reason1">Nội dung không phù hợp</label>
                    </div>
                    <div class="report-option">
                        <input type="radio" id="reason2" name="reason" value="FAKE_PROFILE">
                        <label for="reason2">Hồ sơ giả mạo</label>
                    </div>
                    <div class="report-option">
                        <input type="radio" id="reason3" name="reason" value="HARASSMENT">
                        <label for="reason3">Quấy rối</label>
                    </div>
                    <div class="report-option">
                        <input type="radio" id="reason4" name="reason" value="SPAM">
                        <label for="reason4">Spam</label>
                    </div>
                    <div class="report-option">
                        <input type="radio" id="reason5" name="reason" value="OTHER">
                        <label for="reason5">Khác</label>
                    </div>
                </div>

                <div class="report-details">
                    <label for="reportDetails">Chi tiết báo cáo:</label>
                    <textarea id="reportDetails" name="details" rows="4"
                        placeholder="Mô tả chi tiết về vấn đề bạn gặp phải..."></textarea>
                </div>

                <div class="modal-actions">
                    <button type="button" class="cancel-btn" id="closeReportModal">Hủy bỏ</button>
                    <button type="submit" class="confirm-btn">Gửi báo cáo</button>
                </div>
            </form>
        </div>
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

            // Xử lý nút thích
            const likeBtn = document.querySelector('.like-btn');
            if (likeBtn) {
                likeBtn.addEventListener('click', function () {
                    const userId = this.getAttribute('data-user-id');

                    // Gửi request like user
                    fetch(`/client/like/${userId}`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector(
                                    'input[name="${_csrf.parameterName}"]').value
                            }
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.matched) {
                                // Nếu có match, hiển thị thông báo và chuyển đến trang tin nhắn
                                showMatchNotification(data.matchId);
                            } else {
                                // Nếu chỉ like thành công, cập nhật UI
                                this.innerHTML = '<i class="fas fa-check"></i> Đã thích';
                                this.disabled = true;
                                this.classList.add('liked');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                });
            }

            // Xử lý modal báo cáo
            const reportBtn = document.querySelector('.report-btn');
            const reportModal = document.getElementById('reportModal');
            const closeReportBtn = document.getElementById('closeReportModal');
            const reportForm = document.getElementById('reportForm');

            if (reportBtn) {
                reportBtn.addEventListener('click', function () {
                    reportModal.classList.add('show');
                });
            }

            if (closeReportBtn) {
                closeReportBtn.addEventListener('click', function () {
                    reportModal.classList.remove('show');
                });
            }

            // Đóng modal khi click bên ngoài
            window.addEventListener('click', function (event) {
                if (event.target === reportModal) {
                    reportModal.classList.remove('show');
                }
            });

            // Xử lý submit form báo cáo
            if (reportForm) {
                reportForm.addEventListener('submit', function (e) {
                    e.preventDefault();

                    const formData = new FormData(this);
                    const reportData = {
                        reportedUserId: formData.get('reportedUserId'),
                        reason: formData.get('reason'),
                        details: formData.get('details')
                    };

                    // Gửi request báo cáo
                    fetch('/client/report', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector(
                                    'input[name="${_csrf.parameterName}"]').value
                            },
                            body: JSON.stringify(reportData)
                        })
                        .then(response => {
                            if (response.ok) {
                                // Hiển thị thông báo thành công
                                alert(
                                    'Cảm ơn bạn đã báo cáo. Chúng tôi sẽ xem xét và xử lý sớm nhất có thể.'
                                );
                                reportModal.classList.remove('show');
                                reportForm.reset();
                            } else {
                                alert('Có lỗi xảy ra khi gửi báo cáo. Vui lòng thử lại sau.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Có lỗi xảy ra khi gửi báo cáo. Vui lòng thử lại sau.');
                        });
                });
            }

            // Hàm hiển thị thông báo match
            function showMatchNotification(matchId) {
                // Tạo và hiển thị thông báo match
                const matchNotification = document.createElement('div');
                matchNotification.classList.add('match-notification');
                matchNotification.innerHTML = `
                    <div class="match-notification-content">
                        <div class="match-icon">
                            <i class="fas fa-heart"></i>
                        </div>
                        <h3>Kết nối mới!</h3>
                        <p>Bạn và ${viewUser.fullName} đã kết nối thành công.</p>
                        <div class="match-actions">
                            <a href="/client/message/${matchId}" class="message-match-btn">
                                <i class="far fa-comment"></i> Nhắn tin ngay
                            </a>
                            <button class="continue-btn">
                                <i class="fas fa-undo"></i> Tiếp tục
                            </button>
                        </div>
                    </div>
                `;

                document.body.appendChild(matchNotification);

                // Hiển thị notification với animation
                setTimeout(() => {
                    matchNotification.classList.add('show');
                }, 100);

                // Xử lý nút tiếp tục
                const continueBtn = matchNotification.querySelector('.continue-btn');
                if (continueBtn) {
                    continueBtn.addEventListener('click', function () {
                        matchNotification.classList.remove('show');
                        setTimeout(() => {
                            matchNotification.remove();
                            // Cập nhật UI sau khi match
                            const profileActions = document.querySelector('.profile-actions');
                            if (profileActions) {
                                profileActions.innerHTML = `
                                    <a href="/client/message/${matchId}" class="message-btn">
                                        <i class="far fa-comment"></i> Nhắn tin
                                    </a>
                                `;
                            }
                        }, 300);
                    });
                }
            }
        });
    </script>
</body>

</html>