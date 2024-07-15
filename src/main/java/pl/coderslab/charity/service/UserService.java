package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Administrator;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;

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

    public List<User> findAll() {
        List<User> users = userRepository.findAll();
        return users;
    }

    public User findById(Long id) {
        return userRepository.getById(id);
    }

    public void delete(Long id) {
        userRepository.deleteById(id);
    }

    public List<User> findAdministrators() {
        List<User> admins = userRepository.findByRole("ADMIN");
        System.out.println("Fetched administrators: " + admins);
        return admins;
    }

    public void blockUser(Long id) {
        User user = findById(id);
        if (user != null) {
            user.setBlocked(true);
            userRepository.save(user);
        }
    }

    public void unblockUser(Long id) {
        User user = findById(id);
        if (user != null) {
            user.setBlocked(false);
            userRepository.save(user);
        }
    }
}
