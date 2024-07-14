package pl.coderslab.charity.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Administrator;
import pl.coderslab.charity.service.AdministratorService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdministratorController {

    private final InstitutionService institutionService;
    private final AdministratorService administratorService;

    public AdministratorController(InstitutionService institutionService, AdministratorService administratorService) {
        this.institutionService = institutionService;
        this.administratorService = administratorService;
    }

    @GetMapping("/dashboard")
    public String showAdminHomePage(Model model) {
        model.addAttribute("institutions", institutionService.findAll());
        return "dashboard";
    }

    @GetMapping("/administrators")
    public String administratorList(Model model) {
        List<Administrator> administrators = administratorService.findAll();
        model.addAttribute("administrators", administrators);
        return "administrators-list";
    }

    @GetMapping("/administrators/add")
    public String addAdministratorForm(Model model) {
        model.addAttribute("administrator", new Administrator());
        return "new-administrator";
    }

    @PostMapping("/administrators/add")
    public String addAdministrator(@ModelAttribute Administrator administrator) {
        administratorService.save(administrator);
        return "redirect:/admin/administrators";
    }

    @GetMapping("/administrators/edit/{id}")
    public String editAdministrator(@PathVariable Long id, Model model) {
        model.addAttribute("administrator", administratorService.findById(id));
        return "edit-administrator"; // dodac form dla edytowania admin
    }

    @PostMapping("/administrators/edit")
    public String editAdministrator(@ModelAttribute Administrator administrator) {
        administratorService.save(administrator);
        return "redirect:/admin/administrators";
    }

    @DeleteMapping("/administrators/delete/{id}")
    public ResponseEntity<Object> deleteAdministrator(@PathVariable Long id) {
            administratorService.delete(id);
            return ResponseEntity.noContent().build();
    }

}
