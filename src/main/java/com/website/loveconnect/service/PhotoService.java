package com.website.loveconnect.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.website.loveconnect.model.Photo;
import com.website.loveconnect.model.User;
import com.website.loveconnect.repository.PhotoRepository;
import com.website.loveconnect.repository.UserRepository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Value;

@Service
public class PhotoService {
    private final PhotoRepository photoRepository;
    private final UserRepository userRepository;

    public PhotoService(PhotoRepository photoRepository, UserRepository userRepository) {
        this.photoRepository = photoRepository;
        this.userRepository = userRepository;
    }

    @Value("${app.upload.dir:src/main/webapp/resources/images/uploads}")
    private String uploadDir;

    @Transactional
    public void updateProfilePicture(User user, MultipartFile file) throws IOException {
        // Tạo thư mục nếu không tồn tại
        File directory = new File(uploadDir + "/users/" + user.getUserId());
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // Tạo tên file ngẫu nhiên để tránh trùng lặp
        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Path path = Paths.get(uploadDir + "/users/" + user.getUserId() + "/" + fileName);

        // Lưu file vào hệ thống
        Files.write(path, file.getBytes());

        // Cập nhật đường dẫn ảnh trong cơ sở dữ liệu
        String relativePath = "/uploads/users/" + user.getUserId() + "/" + fileName;
        user.setProfilePictureUrl(relativePath);

        // Kiểm tra nếu đã có ảnh primary
        boolean hasPrimary = false;
        for (Photo photo : user.getPhotos()) {
            if (photo.isPrimary()) {
                hasPrimary = true;
                break;
            }
        }

        // Tạo mới photo object và đặt làm primary nếu chưa có
        Photo profilePhoto = new Photo();
        profilePhoto.setUser(user);
        profilePhoto.setPhotoUrl(relativePath);
        profilePhoto.setPrimary(!hasPrimary);

        photoRepository.save(profilePhoto);
        userRepository.save(user);
    }

    /**
     * Thêm ảnh mới cho người dùng
     */
    @Transactional
    public Photo addPhoto(User user, MultipartFile file) throws IOException {
        // Tạo thư mục nếu không tồn tại
        File directory = new File(uploadDir + "/users/" + user.getUserId());
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // Tạo tên file ngẫu nhiên để tránh trùng lặp
        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        Path path = Paths.get(uploadDir + "/users/" + user.getUserId() + "/" + fileName);

        // Lưu file vào hệ thống
        Files.write(path, file.getBytes());

        // Cập nhật đường dẫn ảnh trong cơ sở dữ liệu
        String relativePath = "/uploads/users/" + user.getUserId() + "/" + fileName;

        // Kiểm tra số lượng ảnh hiện có
        if (user.getPhotos().size() >= 8) {
            throw new RuntimeException("Bạn chỉ có thể tải lên tối đa 8 ảnh.");
        }

        // Kiểm tra nếu đây là ảnh đầu tiên
        boolean isFirstPhoto = user.getPhotos().isEmpty();

        // Tạo mới photo object
        Photo photo = new Photo();
        photo.setUser(user);
        photo.setPhotoUrl(relativePath);
        photo.setPrimary(isFirstPhoto);

        // Nếu là ảnh đầu tiên, đặt làm ảnh đại diện
        if (isFirstPhoto) {
            user.setProfilePictureUrl(relativePath);
            userRepository.save(user);
        }

        return photoRepository.save(photo);
    }

    /**
     * Xóa một ảnh
     */
    @Transactional
    public boolean deletePhoto(Long photoId, Long userId) {
        Photo photo = photoRepository.findById(photoId).orElse(null);

        // Kiểm tra quyền xóa
        if (!photo.getUser().getUserId().equals(userId)) {
            throw new RuntimeException("Bạn không có quyền xóa ảnh này");
        }

        boolean isPrimary = photo.isPrimary();

        // Xóa file vật lý
        try {
            String filePath = photo.getPhotoUrl().replace("/uploads", uploadDir);
            Files.deleteIfExists(Paths.get(filePath));
        } catch (IOException e) {
            // Log lỗi nhưng vẫn tiếp tục xóa trong DB
            System.err.println("Không thể xóa file: " + e.getMessage());
        }

        // Xóa trong database
        photoRepository.delete(photo);

        // Nếu là ảnh chính, thiết lập ảnh khác làm ảnh chính
        if (isPrimary) {
            List<Photo> remainingPhotos = photoRepository.findByUser_UserIdOrderByUploadedAtDesc(userId);
            if (!remainingPhotos.isEmpty()) {
                Photo newPrimary = remainingPhotos.get(0);
                newPrimary.setPrimary(true);

                // Cập nhật ảnh đại diện
                User user = userRepository.findById(userId).orElse(null);
                if (user != null) {
                    user.setProfilePictureUrl(newPrimary.getPhotoUrl());
                    userRepository.save(user);
                }

                photoRepository.save(newPrimary);
            }
        }

        return true;
    }

    /**
     * Xóa nhiều ảnh
     */
    @Transactional
    public void deletePhotos(List<Long> photoIds, Long userId) {
        for (Long photoId : photoIds) {
            deletePhoto(photoId, userId);
        }
    }

    /**
     * Đặt ảnh chính
     */
    @Transactional
    public boolean setPrimaryPhoto(Long userId, Long photoId) {
        // Đầu tiên, đặt tất cả ảnh thành không phải primary
        List<Photo> userPhotos = photoRepository.findByUser_UserId(userId);
        for (Photo photo : userPhotos) {
            photo.setPrimary(false);
            photoRepository.save(photo);
        }

        // Thiết lập ảnh được chọn thành primary
        Photo selectedPhoto = photoRepository.findById(photoId).orElse(null);

        // Kiểm tra quyền sửa
        if (!selectedPhoto.getUser().getUserId().equals(userId)) {
            throw new RuntimeException("Bạn không có quyền thay đổi ảnh này");
        }

        selectedPhoto.setPrimary(true);
        photoRepository.save(selectedPhoto);

        // Cập nhật ảnh đại diện
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            user.setProfilePictureUrl(selectedPhoto.getPhotoUrl());
            userRepository.save(user);
        }

        return true;
    }
}
