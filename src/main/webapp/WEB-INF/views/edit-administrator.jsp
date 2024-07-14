<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Edit Administrator</title>
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
            <li><a href="/admin/dashboard" class="btn btn--without-border">Dashboard</a></li>
            <li><a href="/admin/administrators" class="btn btn--without-border">Administratorzy</a></li>
        </ul>
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>Edit Administrator</h1>
        </div>
    </div>
</header>

<main class="container">
    <section class="dashboard">
        <h1>Edit Administrator</h1>
        <form:form action="/admin/administrators/edit" method="post" modelAttribute="administrator">
            <div>
                <label for="username">Username:</label>
                <form:input path="username" id="username" />
            </div>
            <div>
                <label for="password">Password:</label>
                <form:password path="password" id="password" />
            </div>
            <div>
                <label for="email">Email:</label>
                <form:input path="email" id="email" />
            </div>
            <div>
                <button type="submit">Update Administrator</button>
            </div>
        </form:form>
    </section>
</main>

<jsp:include page="footer.jsp"/>
</body>
</html>
