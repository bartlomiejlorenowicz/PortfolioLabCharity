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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <li><a href="/admin/users" class="btn btn--without-border active">Użytkownicy</a></li>
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
        <h2>Lista Użytkowników</h2>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.username}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.role}"/></td>
                    <td><c:out value="${user.blocked ? 'Blocked' : 'Active'}"/></td>
                    <td>
                        <a href="<c:url value='/admin/users/edit/${user.id}'/>">Edytuj</a>
                        <button onclick="deleteUser(${user.id})" class="btn btn-danger">Usuń</button>
                        <form action="<c:url value='${user.blocked ? "/admin/users/unblock/" : "/admin/users/block/"}${user.id}' />" method="post" style="display:inline;">
                            <button type="submit" class="btn" style="background-color: ${user.blocked ? '#28a745' : '#dc3545'}; color: white;">
                                <c:out value="${user.blocked ? 'Odblokuj' : 'Zablokuj'}"/>
                            </button>
                        </form>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value='/admin/users/add'/>" class="btn">Dodaj nowego użytkownika</a>
    </section>
</main>

<jsp:include page="footer.jsp"></jsp:include>
<script>
    function deleteUser(userId) {
        if (confirm('Czy na pewno chcesz usunąć tego użytkownika?')) {
            $.ajax({
                url: '/admin/users/delete/' + userId,
                type: 'DELETE',
                success: function(result) {
                    alert('Użytkownik został usunięty');
                    location.reload();
                },
                error: function(err) {
                    alert('Wystąpił błąd podczas usuwania użytkownika');
                }
            });
        }
    }
</script>
</body>
</html>
