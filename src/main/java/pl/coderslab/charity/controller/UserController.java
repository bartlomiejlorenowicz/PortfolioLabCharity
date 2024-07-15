package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(User user) {
        userService.save(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(String email, String password, HttpSession session, Model model) {
        User user = userService.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("loggedUser", user);
            session.setAttribute("username", user.getUsername());

            if ("ADMIN".equals(user.getRole())) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/form";
            }
        }
        return "redirect:/login?error";
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/admin/users")
    public String listUsers(Model model) {
        List<User> users = userService.findAll();
        List<User> administrators = userService.findAdministrators();
        model.addAttribute("users", users);
        model.addAttribute("administrators", administrators);
        return "user-list";
    }


    @GetMapping("/admin/users/add")
    public String showAddUserForm(Model model) {
        model.addAttribute("user", new User());
        return "admin-user-add";
    }

    @PostMapping("/admin/users/add")
    public String adUser(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "user-form-edit";
    }

    @PostMapping("/admin/users/edit")
    public String editUser(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    @DeleteMapping("/admin/users/delete/{id}")
    @ResponseBody
    public void deleteUser(@PathVariable Long id) {
        userService.delete(id);
    }

    @PostMapping("/admin/users/block/{id}")
    public String blockUser(@PathVariable Long id) {
        userService.blockUser(id);
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/users/unblock/{id}")
    public String unblockUser(@PathVariable Long id) {
        userService.unblockUser(id);
        return "redirect:/admin/users";
    }
}
