<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %>

<section class="form--steps">
    <div class="form--steps-container">
        <div class="form-section active">
            <h3>Podsumowanie Twojej darowizny</h3>
            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li><span class="icon icon-bag"></span><span class="summary--text">${donation.quantity}</span></li>
                        <li><span class="icon icon-hand"></span><span class="summary--text">"${donation.institution.name}"</span></li>
                    </ul>
                </div>
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>
                            <li>${donation.street}</li>
                            <li>${donation.city}</li>
                            <li>${donation.zipCode}</li>
                            <li>${donation.phone}</li>
                        </ul>
                    </div>
                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li>${donation.pickUpDate}</li>
                            <li>${donation.pickUpTime}</li>
                            <li>${donation.pickUpComment}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="submit" class="btn">Potwierdzam</button>
            </div>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>
