<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"/>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${totalQuantity}</em>
            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum tempora!</p>
        </div>
        <div class="stats--item">
            <em>${countAllDonations}</em>
            <h3>Przekazanych darów</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas quam.</p>
        </div>
    </div>
</section>

<section class="steps" id="about">
    <h2>Wystarczą 4 proste kroki</h2>
    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>
    <a href="/donation" class="btn btn--large">Przekaż dary</a>
</section>

<section class="about-us" id="about-us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/static/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image">
        <img src="<c:url value="resources/static/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="foundations">
    <h2>Komu pomagamy?</h2>
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy. Możesz sprawdzić czym się zajmują.</p>
        <ul class="help--slides-items">
            <c:forEach var="institution" items="${institutions}" varStatus="status">
                <c:if test="${status.index % 2 == 0}">
                    <li>
                    <div class="col">
                        <div class="title">Fundacja "${institution.name}"</div>
                        <div class="subtitle">Cel i misja: ${institution.description}</div>
                    </div>
                </c:if>
                <c:if test="${status.index % 2 == 1}">
                    <div class="col">
                        <div class="title">Fundacja "${institution.name}"</div>
                        <div class="subtitle">Cel i misja: ${institution.description}</div>
                    </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="Imię"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="Nazwisko"/></div>
            <div class="form-group"><textarea name="message" placeholder="Wiadomość" rows="1"></textarea></div>
            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="images/icon-facebook.svg"/></a>
            <a href="#" class="btn btn--small"><img src="images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>

<script src="<c:url value="resources/static/js/app.js"/>"></script>
<script>
    $(document).ready(function () {
        // Przewijanie do sekcji
        $('.scroll-to').on('click', function (event) {
            event.preventDefault();
            var target = $(this).attr('href');
            $('html, body').animate({
                scrollTop: $(target).offset().top
            }, 1000);
        });

        // Przewijanie do sekcji footer
        $('.scroll-to-footer').on('click', function (event) {
            event.preventDefault();
            $('html, body').animate({
                scrollTop: $('footer').offset().top
            }, 1000);
        });
    });
</script>
</body>
</html>
