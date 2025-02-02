package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Donation;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT SUM(d.quantity) from donations d")
    Long findTotalQuantity();

    @Query("SELECT COUNT(*) FROM donations")
    Long countAllDonation();

    List<Donation> findTopByOrderByIdDesc();
}
