package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import javax.servlet.http.HttpSession;

@Controller
public class DonationController {

    private final DonationService donationService;
    private final InstitutionService institutionService;
    private final CategoryService categoryService;

    public DonationController(DonationService donationService, InstitutionService institutionService, CategoryService categoryService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
        this.categoryService = categoryService;
    }

    @GetMapping("/form")
    public String showForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("institutions", institutionService.findAll());
        return "form";
    }

    @PostMapping("/saveDonation")
    public String saveDonation(@ModelAttribute Donation donation, HttpSession session, Model model) {
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (loggedUser == null) {
            return "redirect:/login";
        }
        donationService.save(donation);
        session.setAttribute("donation", donation);
        return "form-confirmation";
    }

    @GetMapping("/donation")
    public String giveDonation(Model model) {
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("institutions", institutionService.findAll());
        return "donation";
    }

    @PostMapping("/saveDonationWithoutSession")
    public String saveDonation(@ModelAttribute Donation donation, Model model) {
        donationService.save(donation);
        System.out.println("Donation: " + donation);
        System.out.println("Institution: " + donation.getInstitution());
        model.addAttribute("donation", donation);
        return "form-confirmation-unlogged";
    }
}
