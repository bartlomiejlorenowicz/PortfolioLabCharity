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
    <script>
        function deleteAdministrator(adminId) {
            if (confirm('Czy na pewno chcesz usunąć tego administratora?')) {
                $.ajax({
                    url: '/admin/administrators/delete/' + adminId,
                    type: 'DELETE',
                    success: function(result) {
                        alert('Administrator został usunięty');
                        location.reload();
                    },
                    error: function(err) {
                        alert('Wystąpił błąd podczas usuwania administratora');
                    }
                });
            }
        }
    </script>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <!-- Your nav actions here -->
        </ul>
        <ul>
            <!-- Your nav links here -->
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
        <h2>Lista Administratorów</h2>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="administrator" items="${administrators}">
                <tr>
                    <td><c:out value="${administrator.id}"/></td>
                    <td><c:out value="${administrator.username}"/></td>
                    <td><c:out value="${administrator.email}"/></td>
                    <td>
                        <a href="<c:url value='/admin/administrators/edit/${administrator.id}'/>">Edytuj</a>
                        <button onclick="deleteAdministrator(${administrator.id})" class="btn btn-danger">Usuń</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <a href="<c:url value='/admin/administrators/add'/>" class="btn">Dodaj nowego administratora</a>
    </section>
</main>

<jsp:include page="footer.jsp"/>
</body>
</html>
