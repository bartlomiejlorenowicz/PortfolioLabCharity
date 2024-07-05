<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy wiedzieć komu najlepiej je przekazać.</p>
            <p data-step="2">Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy wiedzieć komu najlepiej je przekazać.</p>
            <p data-step="3">Wybierz jedną, do której trafi Twoja przesyłka.</p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>
    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>4</span>/4</div>
        <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>
        <div class="form-section form-section--columns">
            <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline">
                    <label>Ulica <input type="text" name="address"/></label>
                </div>
                <div class="form-group form-group--inline">
                    <label>Miasto <input type="text" name="city"/></label>
                </div>
                <div class="form-group form-group--inline">
                    <label>Kod pocztowy <input type="text" name="postcode"/></label>
                </div>
                <div class="form-group form-group--inline">
                    <label>Numer telefonu <input type="phone" name="phone"/></label>
                </div>
            </div>
            <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline">
                    <label>Data <input type="date" name="data"/></label>
                </div>
                <div class="form-group form-group--inline">
                    <label>Godzina <input type="time" name="time"/></label>
                </div>
                <div class="form-group form-group--inline">
                    <label>Uwagi dla kuriera<textarea name="more_info" rows="5"></textarea></label>
                </div>
            </div>
        </div>
        <div class="form-group form-group--buttons">
            <button type="button" class="btn prev-step">Wstecz</button>
            <button type="button" class="btn next-step">Dalej</button>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>
