package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Service
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public Institution findById(Long id) {
        return institutionRepository.findById(id).orElse(null);
    }

    public Institution save(Institution institution) {
        return institutionRepository.save(institution);
    }

    public void delete(Long id) {
        institutionRepository.deleteById(id);
    }
}
