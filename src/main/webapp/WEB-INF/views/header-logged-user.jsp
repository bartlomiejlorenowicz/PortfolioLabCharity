<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/style.css'/>"/>
    <style>
        body {
            background-color: #f9f9f9; /* Dopasowanie tła strony głównej */
        }
        .form-section {
            margin-left: 20px; /* Wyrównanie do lewego marginesu */
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group--checkbox {
            margin-bottom: 20px;
        }
        .form-group--checkbox .description {
            font-size: 1.2em;
            line-height: 1.5em;
        }
        .form-group--checkbox .title {
            font-weight: bold;
            font-size: 1.4em;
        }
        .form-group--checkbox .subtitle {
            font-size: 1.2em;
            color: #666;
        }
        .form-group--buttons {
            margin-top: 40px;
            display: flex;
            justify-content: flex-start;
        }
        .form-group--buttons .btn {
            margin-right: 20px;
        }
        .header--main-page .nav--actions, .header--main-page ul {
            display: flex;
            justify-content: flex-start;
        }
        .header--main-page .nav--actions li, .header--main-page ul li {
            margin-right: 20px;
        }
        .form-section--columns {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .form-section--column {
            flex: 1;
            min-width: 250px;
            margin-right: 20px;
        }
        .form-group--inline {
            margin-bottom: 20px;
        }
        .summary {
            font-size: 1.4em; /* Zwiększenie rozmiaru czcionki */
        }
        .summary ul {
            padding-left: 20px;
        }
        .form-group--buttons .btn {
            font-size: 1.2em; /* Zwiększenie rozmiaru czcionki przycisków */
        }
    </style>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <c:choose>
                <c:when test="${not empty username}">
                    <li>Witaj, <c:out value="${username}"/>!</li>
                    <li><a href="/logout" class="btn btn--small btn--without-border">Wyloguj</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
                    <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
        <ul>
            <li><a href="#" class="btn btn--without-border active">Start</a></li>
            <li><a href="#" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#" class="btn btn--without-border">O nas</a></li>
            <li><a href="#" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>Zacznij pomagać!<br/>Oddaj niechciane rzeczy w zaufane ręce</h1>
        </div>
    </div>
</header>

<section class="login-page">
    <h2>Zaloguj się</h2>
    <form action="/login" method="post">
        <div class="form-group">
            <input type="email" name="email" placeholder="Email" />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" />
            <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/register" class="btn btn--without-border">Załóż konto</a>
            <button class="btn" type="submit">Zaloguj się</button>
        </div>
    </form>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form>
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię" />
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko" />
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
            <a href="#" class="btn btn--small"><img src="images/icon-facebook.svg"/></a>
            <a href="#" class="btn btn--small"><img src="images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>
</body>
</html>
