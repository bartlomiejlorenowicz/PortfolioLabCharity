package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Administrator;
import pl.coderslab.charity.repository.AdministratorRepository;

import java.util.List;

@Service
public class AdministratorService {

    private AdministratorRepository administratorRepository;

    public AdministratorService(AdministratorRepository administratorRepository) {
        this.administratorRepository = administratorRepository;
    }

    public List<Administrator> findAll() {
        return administratorRepository.findAll();
    }

    public Administrator findById(Long id) {
        return administratorRepository.findById(id).orElse(null);
    }

    public void save(Administrator administrator) {
        administratorRepository.save(administrator);
    }

    public void delete(Long id) {
        administratorRepository.deleteById(id);
    }
}
