<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Form</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/style.css'/>"/>
</head>
<body>
<jsp:include page="header.jsp"/>

<section class="form--steps" style="display: <c:out value="${not empty username ? 'block' : 'none'}"/>;">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form id="donationForm" action="/saveDonationWithoutSession" method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="form-step active">
                <h3>Zaznacz co chcesz oddać:</h3>

                <c:forEach var="category" items="${categories}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="checkbox" name="categories" value="${category.id}"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2" class="form-step">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input path="quantity" type="number" name="quantity" step="1" min="1"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 3 -->
            <div data-step="3" class="form-step">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <c:forEach var="institution" items="${institutions}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="institution" value="${institution.id}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                    <div class="title">${institution.name}</div>
                </span>
                        </label>
                    </div>
                </c:forEach>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 4 -->
            <div data-step="4" class="form-step">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <form:input path="street" type="text" name="street"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <form:input path="city" type="text" name="city"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <form:input path="zipCode" type="text" name="zipCode"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <form:input path="phone" type="phone" name="phone"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <form:input path="pickUpDate" type="date" name="pickUpDate"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <form:input path="pickUpTime" type="time" name="pickUpTime"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment" name="pickUpComment" rows="5"></form:textarea>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5: Podsumowanie -->
            <div data-step="5" class="form-step">
                <h3>Podsumowanie Twojej darowizny</h3>
                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li><span class="icon icon-bag"></span><span class="summary--text" id="summaryQuantity"></span></li>
                            <li><span class="icon icon-hand"></span><span class="summary--text">"<span id="summaryInstitution"></span>"</span></li>
                        </ul>
                    </div>
                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="summaryStreet"></li>
                                <li id="summaryCity"></li>
                                <li id="summaryZipCode"></li>
                                <li id="summaryPhone"></li>
                            </ul>
                        </div>
                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="summaryDate"></li>
                                <li id="summaryTime"></li>
                                <li id="summaryComment"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>

        </form:form>
    </div>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form>
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
            </div>

            <div class="form-group">
                <textarea name="message" placeholder="Wiadomość" rows="1"></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2024</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="/resources/static/images/icon-facebook.svg"/></a>
            <a href="#" class="btn btn--small"><img src="/resources/static/images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value='/resources/static/js/app.js'/>"></script>
</body>
</html>
