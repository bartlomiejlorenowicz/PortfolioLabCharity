package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;

@Controller
public class HomeController {

    private final DonationService donationService;
    private final InstitutionService institutionService;

    public HomeController(DonationService donationService, InstitutionService institutionService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
    }

    @GetMapping("/")
    public String home(Model model) {
        Long countAllDonations = donationService.countAllDonations();
        model.addAttribute("countAllDonations", countAllDonations);

        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);

        Long totalQuantity = donationService.getTotalQuantity();
        model.addAttribute("totalQuantity", totalQuantity);

        return "index";
    }
}
