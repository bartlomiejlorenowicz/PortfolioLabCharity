package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.DonationRepository;

import java.util.List;

@Service
public class DonationService {

    private final DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public Long getTotalQuantity() {
        return donationRepository.findTotalQuantity();
    }

    public Long countAllDonations() {
        return donationRepository.countAllDonation();
    }

    public void save(Donation donation) {
        donationRepository.save(donation);
    }

    public Donation findLastDonationByUser(User user) {
        List<Donation> donations = donationRepository.findTopByOrderByIdDesc();
        return donations.isEmpty() ? null : donations.get(0);
    }
}
