<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Edytuj Użytkownika</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/style.css'/>"/>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <!-- Navigation code -->
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>Edytuj Użytkownika</h1>
        </div>
    </div>
</header>
<main class="container">
    <section class="dashboard">
        <h2>Formularz Edycji Użytkownika</h2>
        <form action="<c:url value='/admin/users/edit'/>" method="post">
            <input type="hidden" name="id" value="${user.id}"/>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="${user.username}" required/>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user.email}" required/>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${user.password}" required/>
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="${user.role}" required/>
            </div>
            <div class="form-group">
                <label for="blocked">Status:</label>
                <select id="blocked" name="blocked">
                    <option value="false" ${not user.blocked ? 'selected' : ''}>Active</option>
                    <option value="true" ${user.blocked ? 'selected' : ''}>Blocked</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Zapisz zmiany</button>
        </form>
    </section>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>
