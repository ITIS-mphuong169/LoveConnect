<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Gửi lời mời kết nối</title>
    <link rel="stylesheet" href="/css/discovery.css">
    <link rel="stylesheet" href="/css/sent-requests.css">
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
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng xuất</button>
            </form>
            <img src="/images/users/user1.jpg" alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Main content -->
    <div class="container">
        <h1 class="page-title">Danh sách lời mời kết nối đã gửi</h1>

        <!-- Status messages -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                ${successMessage}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                ${errorMessage}
            </div>
        </c:if>

        <!-- Sent requests list -->
        <div class="requests-container">
            <c:if test="${empty sentRequests}">
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="far fa-paper-plane"></i>
                    </div>
                    <p>Bạn chưa gửi lời mời kết nối nào</p>
                    <a href="/client/homepage/discovery" class="btn-primary">Khám phá ngay</a>
                </div>
            </c:if>

            <c:forEach items="${sentRequests}" var="request">
                <div class="request-card">
                    <div class="request-user-info">
                        <img src="${request.receiver.profilePictureUrl != null ? request.receiver.profilePictureUrl : '/images/users/default.jpg'}"
                            alt="${request.receiver.fullName}" class="user-avatar">
                        <div class="user-details">
                            <h3>${request.receiver.fullName}, ${request.receiver.age}</h3>
                            <p class="request-date">Gửi lúc: ${request.createdAt}</p>
                            <p class="request-status">
                                <c:choose>
                                    <c:when test="${request.status == 'PENDING'}">
                                        <span class="status-pending">Đang chờ phản hồi</span>
                                    </c:when>
                                    <c:when test="${request.status == 'ACCEPTED'}">
                                        <span class="status-accepted">Đã được chấp nhận</span>
                                    </c:when>
                                    <c:when test="${request.status == 'DECLINED'}">
                                        <span class="status-declined">Đã bị từ chối</span>
                                    </c:when>
                                </c:choose>
                            </p>
                        </div>
                    </div>

                    <div class="request-actions">
                        <c:if test="${request.status == 'PENDING'}">
                            <form action="/client/cancel-request" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="hidden" name="requestId" value="${request.requestId}" />
                                <button type="submit" class="btn-cancel">
                                    <i class="fas fa-times"></i> Hủy lời mời
                                </button>
                            </form>
                        </c:if>

                        <c:if test="${request.status == 'ACCEPTED'}">
                            <a href="/client/messages/${request.match.matchId}" class="btn-message">
                                <i class="fas fa-comment"></i> Nhắn tin
                            </a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
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

    <script>
        // Hiển thị thông báo và ẩn sau 3 giây
        document.addEventListener('DOMContentLoaded', function () {
            const alerts = document.querySelectorAll('.alert');

            alerts.forEach(alert => {
                setTimeout(() => {
                    alert.style.opacity = '0';
                    setTimeout(() => {
                        alert.style.display = 'none';
                    }, 500);
                }, 3000);
            });
        });
    </script>
</body>

</html>