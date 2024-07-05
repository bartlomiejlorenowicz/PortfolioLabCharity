<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="header.jsp" %>

<style>
    .form-section {
        padding: 40px 20px;
        margin-left: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        font-size: 1.6em; /* Zwiększenie rozmiaru czcionki */
    }
    .form-section h3 {
        font-size: 2em; /* Zwiększenie rozmiaru czcionki dla nagłówka */
        margin-bottom: 20px;
    }
</style>

<section class="form--steps">
    <div class="form--steps-container">
        <div data-step="7" class="form-section active">
            <h3>Potwierdzenie</h3>
            <p>Dziękujemy za przesłanie formularza. Na maila prześlemy informacje o odbiorze.</p>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
