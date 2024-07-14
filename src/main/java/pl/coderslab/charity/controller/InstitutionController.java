package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.service.InstitutionService;


@Controller
@RequestMapping("/admin/institutions")
public class InstitutionController {

    private final InstitutionService institutionService;

    public InstitutionController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @GetMapping
    public String listInstitutions(Model model) {
        model.addAttribute("institutions", institutionService.findAll());
        System.out.println(institutionService.findAll());
        return "admin/institutions/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("institution", new Institution());
        return "new-institution";
    }

    @PostMapping("/add")
    public String addInstitutions(@ModelAttribute Institution institution) {
        institutionService.save(institution);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Institution institution = institutionService.findById(id);
        if (institution == null) {
            return "redirect:/admin/institutions";
        }
        model.addAttribute("institution", institution);
        return "edit-institution";
    }

    @PostMapping("/edit")
    public String editInstitution(@ModelAttribute Institution institution) {
        institutionService.save(institution);
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/delete/{id}")
    public String deleteInstitution(@PathVariable Long id) {
        institutionService.delete(id);
        return "redirect:/admin/dashboard";
    }

}
