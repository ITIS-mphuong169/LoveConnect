<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Kết nối</title>
    <link rel="stylesheet" href="/css/matches.css">
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
        <div class="matches-container">
            <h1 class="page-title">
                <i class="fas fa-users"></i> Kết nối của bạn
            </h1>

            <!-- Matches filter -->
            <div class="matches-filter">
                <div class="filter-option active" data-filter="all">
                    <i class="fas fa-th-large"></i> Tất cả
                </div>
                <div class="filter-option" data-filter="new">
                    <i class="fas fa-star"></i> Mới
                </div>
                <div class="filter-option" data-filter="active">
                    <i class="fas fa-comment-dots"></i> Trò chuyện
                </div>
            </div>

            <!-- Matches list -->
            <div class="matches-list">
                <c:choose>
                    <c:when test="${empty matches}">
                        <div class="no-matches">
                            <i class="far fa-sad-tear"></i>
                            <h2>Chưa có kết nối nào</h2>
                            <p>Quay lại trang khám phá để tìm thêm người dùng!</p>
                            <a href="/client/discovery" class="discover-btn">
                                <i class="fas fa-fire"></i> Khám phá ngay
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="match" items="${matches}">
                            <div class="match-card ${hasMessagesMap[match.matchId] ? 'has-messages' : 'new-match'}">
                                <div class="match-photo">
                                    <c:choose>
                                        <c:when test="${match.user1.userId eq currentUser.userId}">
                                            <img src="${match.user2.profilePictureUrl}" alt="${match.user2.fullName}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${match.user1.profilePictureUrl}" alt="${match.user1.fullName}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="match-info">
                                    <div class="match-header">
                                        <h3 class="match-name">
                                            <c:choose>
                                                <c:when test="${match.user1.userId eq currentUser.userId}">
                                                    ${match.user2.fullName}
                                                </c:when>
                                                <c:otherwise>
                                                    ${match.user1.fullName}
                                                </c:otherwise>
                                            </c:choose>
                                        </h3>
                                        <div class="match-timestamp">
                                            <fmt:parseDate value="${match.matchedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                var="parsedDate" type="both" />
                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                                        </div>
                                    </div>
                                    <div class="match-status">
                                        <c:choose>
                                            <c:when test="${hasMessagesMap[match.matchId]}">
                                                <i class="fas fa-comment-dots"></i> Đang trò chuyện
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fas fa-star"></i> Kết nối mới
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="match-actions">
                                    <a href="/client/message/${match.matchId}" class="message-btn">
                                        <i class="far fa-comment"></i> Nhắn tin
                                    </a>
                                    <c:choose>
                                        <c:when test="${match.user1.userId eq currentUser.userId}">
                                            <a href="/client/view-profile/${match.user2.userId}"
                                                class="view-profile-btn">
                                                <i class="far fa-user"></i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/client/view-profile/${match.user1.userId}"
                                                class="view-profile-btn">
                                                <i class="far fa-user"></i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    <button class="unmatch-btn" data-match-id="${match.matchId}">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
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
        <a href="/client/matches" class="nav-item active">
            <i class="fas fa-users"></i>
            <span class="nav-label">Kết nối</span>
        </a>
        <a href="/client/profile" class="nav-item">
            <i class="far fa-user"></i>
            <span class="nav-label">Hồ sơ</span>
        </a>
    </div>

    <!-- Unmatch confirmation modal -->
    <div class="modal" id="unmatchModal">
        <div class="modal-content">
            <h3>Hủy kết nối</h3>
            <p>Bạn có chắc chắn muốn hủy kết nối này? Hành động này không thể hoàn tác.</p>
            <div class="modal-actions">
                <button class="cancel-btn">Hủy bỏ</button>
                <button class="confirm-btn">Xác nhận</button>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Filter matches
            const filterOptions = document.querySelectorAll('.filter-option');
            const matchCards = document.querySelectorAll('.match-card');

            filterOptions.forEach(option => {
                option.addEventListener('click', function () {
                    // Remove active class from all options
                    filterOptions.forEach(opt => opt.classList.remove('active'));
                    // Add active class to clicked option
                    this.classList.add('active');

                    const filter = this.getAttribute('data-filter');

                    matchCards.forEach(card => {
                        switch (filter) {
                            case 'all':
                                card.style.display = 'flex';
                                break;
                            case 'new':
                                if (card.classList.contains('new-match')) {
                                    card.style.display = 'flex';
                                } else {
                                    card.style.display = 'none';
                                }
                                break;
                            case 'active':
                                if (card.classList.contains('has-messages')) {
                                    card.style.display = 'flex';
                                } else {
                                    card.style.display = 'none';
                                }
                                break;
                        }
                    });
                });
            });

            // Unmatch modal functionality
            const modal = document.getElementById('unmatchModal');
            const unmatchBtns = document.querySelectorAll('.unmatch-btn');
            const cancelBtn = document.querySelector('.cancel-btn');
            const confirmBtn = document.querySelector('.confirm-btn');
            let currentMatchId = null;

            unmatchBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    currentMatchId = this.getAttribute('data-match-id');
                    modal.classList.add('show');
                });
            });

            cancelBtn.addEventListener('click', function () {
                modal.classList.remove('show');
                currentMatchId = null;
            });

            confirmBtn.addEventListener('click', function () {
                if (currentMatchId) {
                    // Send request to unmatch
                    fetch(`/client/matches/unmatch/${currentMatchId}`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector(
                                    'input[name="${_csrf.parameterName}"]').value
                            }
                        })
                        .then(response => {
                            if (response.ok) {
                                // Remove match card from DOM
                                const matchCard = document.querySelector(
                                    `.match-card [data-match-id="${currentMatchId}"]`).closest(
                                    '.match-card');
                                matchCard.remove();

                                // Check if there are no more matches
                                if (document.querySelectorAll('.match-card').length === 0) {
                                    const matchesList = document.querySelector('.matches-list');
                                    matchesList.innerHTML = `
                                    <div class="no-matches">
                                        <i class="far fa-sad-tear"></i>
                                        <h2>Chưa có kết nối nào</h2>
                                        <p>Quay lại trang khám phá để tìm thêm người dùng!</p>
                                        <a href="/client/discovery" class="discover-btn">
                                            <i class="fas fa-fire"></i> Khám phá ngay
                                        </a>
                                    </div>
                                `;
                                }
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                        });
                }
                modal.classList.remove('show');
            });

            // Close modal when clicking outside
            window.addEventListener('click', function (event) {
                if (event.target === modal) {
                    modal.classList.remove('show');
                    currentMatchId = null;
                }
            });
        });
    </script>
</body>

</html>