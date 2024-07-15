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
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>
        <ul>
            <li><a href="/" class="btn btn--without-border active scroll-to">Start</a></li>
            <li><a href="#about" class="btn btn--without-border scroll-to">O co chodzi?</a></li>
            <li><a href="#about-us" class="btn btn--without-border scroll-to">O nas</a></li>
            <li><a href="#foundations" class="btn btn--without-border scroll-to">Fundacje i organizacje</a></li>
            <li><a href="/donation" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="#contact" class="btn btn--without-border scroll-to-footer">Kontakt</a></li>
        </ul>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>Zacznij pomagać!<br/>Oddaj niechciane rzeczy w zaufane ręce</h1>
        </div>
    </div>
</header>
<script src="<c:url value='/resources/static/js/app.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>