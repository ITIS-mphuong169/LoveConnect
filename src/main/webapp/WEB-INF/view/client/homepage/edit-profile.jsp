<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LoveConnect | Chỉnh sửa hồ sơ</title>
    <link rel="stylesheet" href="/css/profile.css">
    <link rel="stylesheet" href="/css/edit-profile.css">
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
            <img src="${user.profilePictureUrl != null ? user.profilePictureUrl : '/images/users/default-avatar.jpg'}"
                alt="Profile" class="profile-icon">
        </div>
    </header>

    <!-- Main content -->
    <div class="main-content">
        <!-- Edit profile container -->
        <div class="profile-container edit-profile-container">
            <div class="edit-header">
                <h1><i class="fas fa-user-edit"></i> Chỉnh sửa hồ sơ</h1>
                <a href="/client/profile" class="back-btn"><i class="fas fa-arrow-left"></i> Quay lại</a>
            </div>

            <form:form method="POST" action="/client/profile/update" modelAttribute="userDto"
                enctype="multipart/form-data" id="editProfileForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <form:hidden path="userId" />

                <!-- Photo gallery section -->
                <div class="edit-section">
                    <h2 class="section-title"><i class="fas fa-images"></i> Ảnh của bạn</h2>

                    <div class="photo-gallery-container">
                        <div class="photo-preview-area">
                            <!-- Profile photo preview -->
                            <div class="profile-photo-preview">
                                <div class="preview-header">
                                    <h3>Ảnh đại diện</h3>
                                    <span class="photo-tip">Ảnh này sẽ được hiển thị đầu tiên</span>
                                </div>
                                <div class="profile-photo-container">
                                    <img id="profilePhotoPreview"
                                        src="${user.profilePictureUrl != null ? user.profilePictureUrl : '/images/users/default-avatar.jpg'}"
                                        alt="Ảnh đại diện">
                                    <div class="photo-actions">
                                        <label for="profilePhotoInput" class="upload-btn">
                                            <i class="fas fa-upload"></i> Tải lên
                                        </label>
                                        <input type="file" id="profilePhotoInput" name="profilePhoto" accept="image/*"
                                            style="display: none;">
                                    </div>
                                </div>
                            </div>

                            <!-- Additional photos -->
                            <div class="additional-photos">
                                <div class="preview-header">
                                    <h3>Ảnh khác</h3>
                                    <span class="photo-tip">Tối đa 8 ảnh</span>
                                </div>
                                <div class="photos-grid" id="photosGrid">
                                    <!-- Existing photos -->
                                    <c:forEach var="photo" items="${user.photos}" varStatus="status">
                                        <div class="photo-item" data-photo-id="${photo.photoId}">
                                            <img src="${photo.photoUrl}" alt="Ảnh ${status.index + 1}">
                                            <div class="photo-actions">
                                                <button type="button" class="delete-photo-btn"
                                                    data-photo-id="${photo.photoId}">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                                <c:if test="${!photo.primary}">
                                                    <button type="button" class="set-primary-btn"
                                                        data-photo-id="${photo.photoId}">
                                                        <i class="fas fa-star"></i>
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <!-- Add new photo placeholder -->
                                    <div class="photo-item add-photo">
                                        <div class="add-photo-placeholder">
                                            <i class="fas fa-plus"></i>
                                            <span>Thêm ảnh</span>
                                        </div>
                                        <input type="file" id="addPhotoInput" name="additionalPhotos" accept="image/*"
                                            multiple style="display: none;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Basic info section -->
                <div class="edit-section">
                    <h2 class="section-title"><i class="fas fa-info-circle"></i> Thông tin cơ bản</h2>

                    <div class="form-group">
                        <label for="fullName">Họ và tên</label>
                        <form:input path="fullName" id="fullName" class="form-control" required="true" />
                        <form:errors path="fullName" cssClass="error-message" />
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="birthDate">Ngày sinh</label>
                            <form:input path="birthDate" type="date" id="birthDate" class="form-control"
                                required="true" />
                            <form:errors path="birthDate" cssClass="error-message" />
                        </div>

                        <div class="form-group">
                            <label for="gender">Giới tính</label>
                            <form:select path="gender" id="gender" class="form-control" required="true">
                                <form:option value="MALE">Nam</form:option>
                                <form:option value="FEMALE">Nữ</form:option>
                                <form:option value="OTHER">Khác</form:option>
                            </form:select>
                            <form:errors path="gender" cssClass="error-message" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="location">Vị trí</label>
                        <form:input path="location" id="location" class="form-control"
                            placeholder="Ví dụ: Quận 1, TP. Hồ Chí Minh" />
                        <form:errors path="location" cssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại</label>
                        <form:input path="phoneNumber" id="phoneNumber" class="form-control"
                            placeholder="Số điện thoại của bạn" />
                        <form:errors path="phoneNumber" cssClass="error-message" />
                    </div>

                    <div class="form-group">
                        <label for="bio">Giới thiệu về bạn</label>
                        <form:textarea path="bio" id="bio" class="form-control" rows="4"
                            placeholder="Hãy chia sẻ đôi điều về bản thân..." />
                        <span class="char-count" id="bioCharCount">0/500</span>
                        <form:errors path="bio" cssClass="error-message" />
                    </div>
                </div>

                <!-- Interests section -->
                <div class="edit-section">
                    <h2 class="section-title"><i class="fas fa-heart"></i> Sở thích</h2>

                    <div class="interests-container">
                        <div class="interests-selection">
                            <c:forEach var="interest" items="${allInterests}">
                                <div class="interest-checkbox">
                                    <input type="checkbox" id="interest_${interest.interestId}" name="interestIds"
                                        value="${interest.interestId}" ${user.interests.contains(interest) ? 'checked'
                                        : '' }>
                                    <label for="interest_${interest.interestId}">
                                        <i
                                            class="fa ${interest.iconClass != null ? interest.iconClass : 'fa fa-star'}"></i>
                                        ${interest.name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Preferences section -->
                <div class="edit-section">
                    <h2 class="section-title"><i class="fas fa-sliders-h"></i> Tùy chọn kết đôi</h2>

                    <div class="form-group">
                        <label for="genderPreference">Bạn quan tâm đến</label>
                        <form:select path="preference.genderPreference" id="genderPreference" class="form-control">
                            <form:option value="MALE">Nam</form:option>
                            <form:option value="FEMALE">Nữ</form:option>
                            <form:option value="OTHER">Khác</form:option>
                            <form:option value="ANY">Tất cả</form:option>
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label>Độ tuổi</label>
                        <div class="range-slider-container">
                            <div class="range-values">
                                <span id="minAgeValue">${user.preference.minAge != null ? user.preference.minAge :
                                    18}</span> -
                                <span id="maxAgeValue">${user.preference.maxAge != null ? user.preference.maxAge :
                                    99}</span> tuổi
                            </div>
                            <div class="range-sliders">
                                <form:input path="preference.minAge" type="range" id="minAgeSlider" min="18" max="99"
                                    value="${user.preference.minAge != null ? user.preference.minAge : 18}"
                                    class="range-slider" />
                                <form:input path="preference.maxAge" type="range" id="maxAgeSlider" min="18" max="99"
                                    value="${user.preference.maxAge != null ? user.preference.maxAge : 99}"
                                    class="range-slider" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="maxDistanceSlider">Khoảng cách tối đa</label>
                        <div class="range-slider-container single-slider">
                            <div class="range-values">
                                <span id="maxDistanceValue">${user.preference.maxDistance != null ?
                                    user.preference.maxDistance : 100}</span> km
                            </div>
                            <form:input path="preference.maxDistance" type="range" id="maxDistanceSlider" min="1"
                                max="500"
                                value="${user.preference.maxDistance != null ? user.preference.maxDistance : 100}"
                                class="range-slider" />
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="cancel-btn"
                        onclick="window.location.href='/client/profile'">Hủy</button>
                    <button type="submit" class="save-btn">Lưu thay đổi</button>
                </div>
            </form:form>
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
            // Profile Photo Preview
            const profilePhotoInput = document.getElementById('profilePhotoInput');
            const profilePhotoPreview = document.getElementById('profilePhotoPreview');

            profilePhotoInput.addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        profilePhotoPreview.src = e.target.result;
                    }

                    reader.readAsDataURL(this.files[0]);
                }
            });

            // Add Photo Functionality
            const addPhotoPlaceholder = document.querySelector('.add-photo-placeholder');
            const addPhotoInput = document.getElementById('addPhotoInput');
            const photosGrid = document.getElementById('photosGrid');

            addPhotoPlaceholder.addEventListener('click', function () {
                addPhotoInput.click();
            });

            addPhotoInput.addEventListener('change', function () {
                if (this.files) {
                    for (let i = 0; i < this.files.length; i++) {
                        if (document.querySelectorAll('.photo-item:not(.add-photo)').length >= 8) {
                            alert('Bạn chỉ có thể tải lên tối đa 8 ảnh.');
                            break;
                        }

                        const file = this.files[i];
                        previewNewPhoto(file);
                    }
                }
            });

            function previewNewPhoto(file) {
                const reader = new FileReader();

                reader.onload = function (e) {
                    const photoItem = document.createElement('div');
                    photoItem.className = 'photo-item new-photo';

                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.alt = 'Ảnh mới';

                    const photoActions = document.createElement('div');
                    photoActions.className = 'photo-actions';

                    const deleteBtn = document.createElement('button');
                    deleteBtn.type = 'button';
                    deleteBtn.className = 'delete-photo-btn';
                    deleteBtn.innerHTML = '<i class="fas fa-trash"></i>';
                    deleteBtn.addEventListener('click', function () {
                        photoItem.remove();
                    });

                    photoActions.appendChild(deleteBtn);
                    photoItem.appendChild(img);
                    photoItem.appendChild(photoActions);

                    // Insert before the "add photo" button
                    const addPhotoItem = document.querySelector('.photo-item.add-photo');
                    photosGrid.insertBefore(photoItem, addPhotoItem);
                }

                reader.readAsDataURL(file);
            }

            // Delete Existing Photo
            document.querySelectorAll('.delete-photo-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const photoId = this.getAttribute('data-photo-id');
                    const photoItem = this.closest('.photo-item');

                    if (confirm('Bạn có chắc chắn muốn xóa ảnh này?')) {
                        // Add hidden input to form to mark photo for deletion
                        const hiddenInput = document.createElement('input');
                        hiddenInput.type = 'hidden';
                        hiddenInput.name = 'deletePhotoIds';
                        hiddenInput.value = photoId;
                        document.getElementById('editProfileForm').appendChild(hiddenInput);

                        // Hide the photo item
                        photoItem.style.display = 'none';
                    }
                });
            });

            // Set Primary Photo
            document.querySelectorAll('.set-primary-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const photoId = this.getAttribute('data-photo-id');

                    // Add hidden input to form to mark this photo as primary
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'primaryPhotoId';
                    hiddenInput.value = photoId;
                    document.getElementById('editProfileForm').appendChild(hiddenInput);

                    // Visual feedback
                    document.querySelectorAll('.set-primary-btn').forEach(btn => {
                        btn.innerHTML = '<i class="fas fa-star"></i>';
                    });
                    this.innerHTML = '<i class="fas fa-star" style="color: gold;"></i>';

                    alert('Ảnh này sẽ được đặt làm ảnh đại diện sau khi lưu.');
                });
            });

            // Bio character count
            const bioTextarea = document.getElementById('bio');
            const bioCharCount = document.getElementById('bioCharCount');

            bioTextarea.addEventListener('input', function () {
                const charCount = this.value.length;
                bioCharCount.textContent = `${charCount}/500`;

                if (charCount > 500) {
                    bioCharCount.classList.add('exceed');
                } else {
                    bioCharCount.classList.remove('exceed');
                }
            });

            // Trigger initially to show correct count
            bioTextarea.dispatchEvent(new Event('input'));

            // Range sliders for preferences
            const minAgeSlider = document.getElementById('minAgeSlider');
            const maxAgeSlider = document.getElementById('maxAgeSlider');
            const minAgeValue = document.getElementById('minAgeValue');
            const maxAgeValue = document.getElementById('maxAgeValue');
            const maxDistanceSlider = document.getElementById('maxDistanceSlider');
            const maxDistanceValue = document.getElementById('maxDistanceValue');

            // Min age slider
            minAgeSlider.addEventListener('input', function () {
                const minVal = parseInt(this.value);
                const maxVal = parseInt(maxAgeSlider.value);

                if (minVal > maxVal) {
                    maxAgeSlider.value = minVal;
                    maxAgeValue.textContent = minVal;
                }

                minAgeValue.textContent = minVal;
            });

            // Max age slider
            maxAgeSlider.addEventListener('input', function () {
                const maxVal = parseInt(this.value);
                const minVal = parseInt(minAgeSlider.value);

                if (maxVal < minVal) {
                    minAgeSlider.value = maxVal;
                    minAgeValue.textContent = maxVal;
                }

                maxAgeValue.textContent = maxVal;
            });

            // Max distance slider
            maxDistanceSlider.addEventListener('input', function () {
                maxDistanceValue.textContent = this.value;
            });
        });
    </script>
</body>

</html>