<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<jsp:include page="header-login.jsp"/>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form action="/register" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="Nazwa użytkownika" required />
        </div>
        <div class="form-group">
            <input type="email" name="email" placeholder="Email" required />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Hasło" required />
        </div>
        <div class="form-group">
            <input type="password" name="password2" placeholder="Powtórz hasło" required />
        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form>
</section>


<jsp:include page="footer.jsp"/>
</body>
</html>
