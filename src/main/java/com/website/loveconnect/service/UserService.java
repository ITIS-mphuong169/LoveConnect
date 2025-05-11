package com.website.loveconnect.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.loveconnect.dto.RegisterDTO;
import com.website.loveconnect.dto.UserDTO;
import com.website.loveconnect.model.Interest;
import com.website.loveconnect.model.Preference;
import com.website.loveconnect.model.Role;
import com.website.loveconnect.model.User;
import com.website.loveconnect.repository.InterestRepository;
import com.website.loveconnect.repository.RoleRepository;
import com.website.loveconnect.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final InterestRepository interestRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            InterestRepository interestRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.interestRepository = interestRepository;
    }

    public User findUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleSaveUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFullName());
        user.setEmail(registerDTO.getEmail());
        user.setBirthDate(registerDTO.getBirthDate());
        user.setLocation(registerDTO.getLocation());
        user.setBio(registerDTO.getDescription());
        user.setGender(registerDTO.getGender());
        user.setPhoneNumber(registerDTO.getPhoneNumber());
        user.setPasswordHash(registerDTO.getPassword());
        Set<Interest> userInterests = new HashSet<>();
        if (registerDTO.getInterests() != null) {
            for (String interestName : registerDTO.getInterests()) {
                Optional<Interest> existingInterest = this.interestRepository.findByName(interestName);

                if (existingInterest.isPresent()) {
                    // Nếu đã tồn tại thì thêm vào set
                    userInterests.add(existingInterest.get());
                } else {
                    // Nếu chưa tồn tại thì tạo mới và lưu
                    Interest newInterest = new Interest();
                    newInterest.setName(interestName);
                    Interest savedInterest = interestRepository.save(newInterest);
                    userInterests.add(savedInterest);
                }
            }
        }
        user.setInterests(userInterests);
        return user;
    }

    public UserDTO convertToDTO(User user) {
        UserDTO userDto = new UserDTO();
        userDto.setUserId(user.getUserId());
        userDto.setFullName(user.getFullName());
        userDto.setBirthDate(user.getBirthDate());
        userDto.setGender(user.getGender());
        userDto.setLocation(user.getLocation());
        userDto.setPhoneNumber(user.getPhoneNumber());
        userDto.setBio(user.getBio());

        // Thiết lập sở thích
        if (user.getInterests() != null) {
            List<Integer> listIdInterest = new ArrayList<>();
            Set<Interest> lInterests = user.getInterests();

            for (Interest i : lInterests) {
                listIdInterest.add(i.getInterestId());
            }

        }

        // Thiết lập tùy chọn
        if (user.getPreference() != null) {
            userDto.setPreference(user.getPreference());
        } else {
            userDto.setPreference(new Preference());
        }

        return userDto;
    }

    @Transactional
    public User updateUserProfile(UserDTO userDto) {
        User user = userRepository.findById(userDto.getUserId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng"));

        // Cập nhật thông tin cơ bản
        user.setFullName(userDto.getFullName());
        user.setBirthDate(userDto.getBirthDate());
        user.setGender(userDto.getGender());
        user.setLocation(userDto.getLocation());
        user.setPhoneNumber(userDto.getPhoneNumber());
        user.setBio(userDto.getBio());

        // Cập nhật sở thích
        if (userDto.getInterestIds() != null) {
            Set<Interest> interests = new HashSet<>();
            List<Integer> idList = userDto.getInterestIds();
            for (Integer id : idList) {
                interests.add(interestRepository.findById(id).orElseGet(null));
            }
            user.setInterests(interests);
        } else {
            user.setInterests(new HashSet<>());
        }

        // Cập nhật tùy chọn
        Preference preference = user.getPreference();
        if (preference == null) {
            preference = new Preference();
            preference.setUser(user);
        }

        preference.setGenderPreference(userDto.getPreference().getGenderPreference());
        preference.setMinAge(userDto.getPreference().getMinAge());
        preference.setMaxAge(userDto.getPreference().getMaxAge());
        preference.setMaxDistance(userDto.getPreference().getMaxDistance());

        // preferenceRepository.save(preference);
        user.setPreference(preference);

        return userRepository.save(user);
    }
}
