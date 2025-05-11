<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Tin nhắn</title>
    <link rel="stylesheet" href="/css/message.css">
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
            <img src="${user.profilePictureUrl}" alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Messages container -->
    <div class="messages-container">
        <!-- Conversations list -->
        <div class="conversations-list">
            <div class="conversations-header">
                <div class="conversations-title">Tin nhắn</div>
                <div class="new-match-button">
                    <i class="fas fa-plus"></i>
                </div>
            </div>

            <!-- Conversation items - dynamically loaded -->
            <c:forEach items="${matches}" var="match">
                <div
                    class="conversation-item ${selectedMatch != null && selectedMatch.matchId == match.matchId ? 'active' : ''}">
                    <img src="/images/users/${match.user1.userId == currentUser.userId ? match.user2.profileImage : match.user1.profileImage}"
                        alt="User" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-name">
                            ${match.user1.userId == currentUser.userId ? match.user2.fullName : match.user1.fullName}
                        </div>
                        <div class="conversation-preview">
                            <c:if test="${not empty match.messages}">
                                <c:set var="lastMessage" value="${match.messages.toArray()[match.messages.size()-1]}" />
                                ${lastMessage.content.length() > 30 ?
                                lastMessage.content.substring(0, 30) + '...' : lastMessage.content}
                            </c:if>
                        </div>
                    </div>
                    <div>
                        <c:if test="${not empty match.messages}">
                            <div class="conversation-time">
                                <fmt:formatDate value="${lastMessage.sentAt}" pattern="HH:mm" var="messageTime" />
                                <c:choose>
                                    <c:when test="${fn:contains(messageTime, '00:00')}">
                                        <fmt:formatDate value="${lastMessage.sentAt}" pattern="dd/MM" />
                                    </c:when>
                                    <c:otherwise>
                                        ${messageTime}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if>
                        <c:if test="${match.hasUnreadMessages(currentUser.userId)}">
                            <div class="unread-indicator"></div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Chat area -->
        <div class="chat-area">
            <c:if test="${selectedMatch != null}">
                <div class="chat-header">
                    <i class="fas fa-chevron-left back-button" style="display: none;"></i>
                    <img src="/images/users/${selectedMatch.user1.userId == currentUser.userId ? 
                          selectedMatch.user2.profileImage : selectedMatch.user1.profileImage}" alt="User"
                        class="chat-avatar">
                    <div class="chat-user-info">
                        <div class="chat-username">
                            ${selectedMatch.user1.userId == currentUser.userId ?
                            selectedMatch.user2.fullName : selectedMatch.user1.fullName}
                        </div>
                        <div class="chat-status">
                            <c:choose>
                                <c:when test="${selectedMatch.user1.userId == currentUser.userId ? 
                                              selectedMatch.user2.isOnline : selectedMatch.user1.isOnline}">
                                    Đang hoạt động
                                </c:when>
                                <c:otherwise>
                                    Hoạt động
                                    <fmt:formatDate value="${selectedMatch.user1.userId == currentUser.userId ? 
                                                      selectedMatch.user2.lastActive : selectedMatch.user1.lastActive}"
                                        pattern="HH:mm" /> hôm nay
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="chat-actions">
                        <i class="fas fa-phone"></i>
                        <i class="fas fa-video"></i>
                        <i class="fas fa-info-circle"></i>
                    </div>
                </div>

                <div class="chat-messages">
                    <c:forEach items="${selectedMatch.messages}" var="message">
                        <c:if test="${message.sentAt != previousDate}">
                            <div class="message-date">
                                <fmt:formatDate value="${message.sentAt}" pattern="dd/MM/yyyy" />
                            </div>
                        </c:if>
                        <div class="message ${message.sender.userId == currentUser.userId ? 'sent' : 'received'}">
                            <div class="message-content">${message.content}</div>
                            <div class="message-time">
                                <fmt:formatDate value="${message.sentAt}" pattern="HH:mm" />
                                <c:if test="${message.sender.userId == currentUser.userId && message.read}">
                                    <i class="fas fa-check-double read-indicator"></i>
                                </c:if>
                            </div>
                        </div>
                        <c:set var="previousDate" value="${message.sentAt}" />
                    </c:forEach>
                </div>

                <form class="chat-input-container" method="post" action="/client/message/send">
                    <input type="hidden" name="matchId" value="${selectedMatch.matchId}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="text" name="content" class="chat-input" placeholder="Nhập tin nhắn..." required>
                    <div class="input-actions">
                        <i class="far fa-image"></i>
                        <i class="far fa-smile"></i>
                        <button type="submit" class="send-button">
                            <i class="fas fa-paper-plane"></i>
                        </button>
                    </div>
                </form>
            </c:if>
            <c:if test="${selectedMatch == null}">
                <div class="no-chat-selected">
                    <i class="far fa-comment-dots"></i>
                    <p>Chọn một cuộc trò chuyện để bắt đầu nhắn tin</p>
                </div>
            </c:if>
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
        <a href="/client/message" class="nav-item active">
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
        // Function to select a match and load messages
        function selectMatch(matchId, partnerId) {
            window.location.href = '/client/message?matchId=' + matchId;
        }

        // Toggle between conversations list and chat on mobile
        const backButton = document.querySelector('.back-button');
        const messagesContainer = document.querySelector('.messages-container');

        function toggleConversations() {
            document.body.classList.toggle('show-conversations');
        }

        backButton.addEventListener('click', toggleConversations);

        // Handle conversation item click on mobile
        const conversationItems = document.querySelectorAll('.conversation-item');
        conversationItems.forEach(item => {
            item.addEventListener('click', function () {
                if (window.innerWidth <= 768) {
                    toggleConversations();
                }

                // Remove active class from all items
                conversationItems.forEach(i => i.classList.remove('active'));
                // Add active class to clicked item
                this.classList.add('active');

                // Remove unread indicator
                const unreadIndicator = this.querySelector('.unread-indicator');
                if (unreadIndicator) {
                    unreadIndicator.remove();
                }
            });
        });

        // Initial scroll to bottom if chat is open
        const chatMessages = document.querySelector('.chat-messages');
        if (chatMessages) {
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        // Check screen size on load
        if (window.innerWidth <= 768) {
            document.body.classList.add('show-conversations');
        }

        // Handle window resize
        window.addEventListener('resize', function () {
            if (window.innerWidth > 768) {
                document.body.classList.remove('show-conversations');
            }
        });

        // WebSocket or polling for new messages (simplified example)
        function checkForNewMessages() {
            fetch('/api/messages/updates?lastUpdate=' + new Date().getTime())
                .then(response => response.json())
                .then(data => {
                    if (data.newMessages) {
                        // Refresh the page or update messages dynamically
                        window.location.reload();
                    }
                    setTimeout(checkForNewMessages, 5000); // Check every 5 seconds
                });
        }

        // Start checking for updates if chat is open
    </script>
</body>

</html>