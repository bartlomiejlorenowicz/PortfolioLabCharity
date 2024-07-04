package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.repository.DonationRepository;

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
}
