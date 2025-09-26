<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Current Weather - <c:out value="${weather.name}" /></title>
</head>
<body>
    <h1>Weather in <c:out value="${weather.name}" />, <c:out value="${weather.sys.country}" /></h1>

    <c:if test="${not empty weather}">
        <h3>${weather.weather[0].main} - ${weather.weather[0].description}</h3>

        <p><strong>Temperature:</strong> <c:out value="${weather.main.temp}" /> °C
           (feels like <c:out value="${weather.main.feels_like}" /> °C)</p>

        <p><strong>Min / Max:</strong> <c:out value="${weather.main.temp_min}" /> °C /
            <c:out value="${weather.main.temp_max}" /> °C</p>

        <p><strong>Humidity:</strong> <c:out value="${weather.main.humidity}" /> %</p>
        <p><strong>Pressure:</strong> <c:out value="${weather.main.pressure}" /> hPa</p>

        <p><strong>Wind:</strong> <c:out value="${weather.wind.speed}" /> m/s
            (direction: <c:out value="${weather.wind.deg}" />°)</p>

        <p><strong>Clouds:</strong> <c:out value="${weather.clouds.all}" /> %</p>

        <p>
            <img src="https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png"
                 alt="weather icon" />
        </p>

        <!-- Convert UNIX seconds -> milliseconds and format -->
        <p><strong>Sunrise:</strong>
            <fmt:formatDate value="${sunriseDate}" pattern="hh:mm a" />
        </p>
        <p><strong>Sunset:</strong>
            <fmt:formatDate value="${sunsetDate}" pattern="hh:mm a" />
        </p>

        <p><small>Last update timestamp: <c:out value="${weather.dt}" /></small></p>
    </c:if>

    <c:if test="${empty weather}">
        <p>No weather data available.</p>
    </c:if>

    <p><a href="/weather?city=Guntur">Reload Guntur</a></p>
</body>
</html>
