<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Current Weather - <c:out value="${weather.name}" /></title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0f172a 0%, #0b3a5b 100%);
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            margin-top: 30px;
            font-size: 32px;
            color: #61dafb;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
            text-align: center;
        }

        .weather-card {
            background: rgba(255,255,255,0.05);
            border-radius: 12px;
            padding: 25px 30px;
            margin: 30px 0;
            width: 350px;
            text-align: center;
            box-shadow: 0 8px 28px rgba(2,6,23,0.6);
            backdrop-filter: blur(8px);
        }

        .weather-card img {
            width: 100px;
            height: 100px;
        }

        .weather-detail {
            margin: 10px 0;
            font-size: 16px;
        }

        .weather-detail strong {
            color: #61dafb;
        }

        /* Weather emoji */
        .emoji {
            font-size: 24px;
            margin-right: 6px;
        }

        /* Button styling */
        button {
            background-color: #61dafb;
            color: #0f172a;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
        }

        button:hover {
            background-color: #52c7ea;
        }

        @media (max-width: 400px){
            .weather-card {
                width: 90%;
                padding: 20px;
            }
            h1 {
                font-size: 26px;
            }
            .weather-detail {
                font-size: 14px;
            }
            .weather-card img {
                width: 80px;
                height: 80px;
            }
        }
    </style>
</head>
<body>
    <h1>Weather in <c:out value="${weather.name}" />, <c:out value="${weather.sys.country}" /></h1>

    <c:if test="${not empty weather}">
        <div class="weather-card">
            <!-- Weather Emoji -->
            <div class="weather-detail">
                <c:choose>
                    <c:when test="${weather.weather[0].main == 'Clear'}">☀️</c:when>
                    <c:when test="${weather.weather[0].main == 'Clouds'}">☁️</c:when>
                    <c:when test="${weather.weather[0].main == 'Rain'}">🌧️</c:when>
                    <c:when test="${weather.weather[0].main == 'Drizzle'}">🌦️</c:when>
                    <c:when test="${weather.weather[0].main == 'Thunderstorm'}">⛈️</c:when>
                    <c:when test="${weather.weather[0].main == 'Snow'}">❄️</c:when>
                    <c:otherwise>🌫️</c:otherwise>
                </c:choose>
                ${weather.weather[0].main} - ${weather.weather[0].description}
            </div>

            <div class="weather-detail"><strong>Temperature:</strong> <c:out value="${weather.main.temp}" /> °C (feels like <c:out value="${weather.main.feels_like}" /> °C)</div>
            <div class="weather-detail"><strong>Min / Max:</strong> <c:out value="${weather.main.temp_min}" /> °C / <c:out value="${weather.main.temp_max}" /> °C</div>
            <div class="weather-detail"><strong>Humidity:</strong> <c:out value="${weather.main.humidity}" /> %</div>
            <div class="weather-detail"><strong>Pressure:</strong> <c:out value="${weather.main.pressure}" /> hPa</div>
            <div class="weather-detail"><strong>Wind:</strong> <c:out value="${weather.wind.speed}" /> m/s (direction: <c:out value="${weather.wind.deg}" />°)</div>
            <div class="weather-detail"><strong>Clouds:</strong> <c:out value="${weather.clouds.all}" /> %</div>

            <div class="weather-detail">
                <img src="https://openweathermap.org/img/wn/${weather.weather[0].icon}@2x.png" alt="weather icon" />
            </div>

            <div class="weather-detail"><strong>Sunrise:</strong> <fmt:formatDate value="${sunriseDate}" pattern="hh:mm a" /></div>
            <div class="weather-detail"><strong>Sunset:</strong> <fmt:formatDate value="${sunsetDate}" pattern="hh:mm a" /></div>
            <div class="weather-detail"><small>Last update timestamp: <c:out value="${weather.dt}" /></small></div>

            <form action="/forecast" method="get">
                <input type="hidden" name="city" value="${weather.name}">
                <button type="submit">Get Forecast</button>
            </form>
        </div>
    </c:if>

    <c:if test="${empty weather}">
        <p>No weather data available.</p>
    </c:if>
</body>
</html>
