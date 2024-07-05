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
            <li><a href="" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="#" class="btn btn--small btn--highlighted">Załóż konto</a></li>
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
