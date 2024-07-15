<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="header-login.jsp"/>

<section class="login-page">
    <h2>Dodaj nowego użytkownika</h2>
    <form action="<c:url value='/admin/users/add'/>" method="post">
        <input type="hidden" name="id" value="${user.id}">
        <div class="form-group">
            <input type="text" name="username" placeholder="Nazwa użytkownika" value="${user.username}" required />
        </div>
        <div class="form-group">
            <input type="email" name="email" placeholder="Email" value="${user.email}" required />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" value="${user.password}" required />
        </div>
        <div class="form-group">
            <label for="role">Wybierz rolę:</label>
            <select name="role" id="role" required>
                <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>Użytkownik</option>
                <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Administrator</option>
            </select>
        </div>

        <div class="form-group form-group--buttons">
            <a href="<c:url value='/admin/users'/>" class="btn btn--without-border">Anuluj</a>
            <button class="btn" type="submit">Zapisz</button>
        </div>
    </form>
</section>

<jsp:include page="footer.jsp"/>
</body>
</html>
