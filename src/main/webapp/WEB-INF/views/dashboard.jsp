<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/style.css'/>"/>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <c:choose>
                <c:when test="${not empty username}">
                    <li>Witaj, <c:out value="${username}"/>!
                        <ul class="dropdown">
                            <li><a href="#">Profil</a></li>
                            <li><a href="#">Moje zbiórki</a></li>
                            <li><a href="/logout">Wyloguj</a></li>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
                    <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <ul>
            <li><a href="/admin/home" class="btn btn--without-border">Home</a></li>
            <li><a href="/admin/dashboard" class="btn btn--without-border active">Dashboard</a></li>
            <li><a href="/admin/administrators" class="btn btn--without-border">Administratorzy</a></li>
            <li><a href="/admin/users" class="btn btn--without-border">Użytkownicy</a></li>
        </ul>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>Panel Administracyjny</h1>
        </div>
    </div>
</header>

<main class="container">
    <section class="dashboard">
        <h2>Dashboard Admina</h2>
        <div class="statistics">
            <h3>Statystyki</h3>
            <p>Liczba fundacji: ${institutions.size()}</p>
        </div>
        <div class="institution-list">
            <h3>Lista Fundacji</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nazwa</th>
                    <th>Opis</th>
                    <th>Akcje</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="institution" items="${institutions}">
                    <tr>
                        <td><c:out value="${institution.id}"/></td>
                        <td><c:out value="${institution.name}"/></td>
                        <td><c:out value="${institution.description}"/></td>
                        <td>
                            <a href="<c:url value='/admin/institutions/edit/${institution.id}'/>">Edytuj</a>
                            <form action="<c:url value='/admin/institutions/delete/${institution.id}'/>" method="post" style="display:inline;">
                                <button type="submit" class="btn btn-danger">Usuń</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="<c:url value='/admin/institutions/add'/>" class="btn">Dodaj nową fundację</a>
        </div>

        <!-- Odniesienie do listy użytkowników -->
        <div class="user-list">
            <h3>Lista Użytkowników</h3>
            <a href="<c:url value='/admin/users'/>" class="btn">Zobacz listę użytkowników</a>
        </div>
    </section>
</main>

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
