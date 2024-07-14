package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findByEmail(String email) {
        return userRepository.getByEmail(email);
    }

    public void save(User user) {
        if (user.getRole() == null) {
            user.setRole("USER");
        }
        userRepository.save(user);
    }
}
