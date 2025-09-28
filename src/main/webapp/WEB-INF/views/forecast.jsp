<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Weather Forecast</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background: linear-gradient(135deg, #0f172a 0%, #0b3a5b 100%);
	color: #fff;
}

h2 {
	text-align: center;
	margin-top: 30px;
	font-size: 28px;
	color: #61dafb;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
}

.forecast-card {
	max-width: 900px;
	margin: 30px auto;
	background: rgba(255, 255, 255, 0.05);
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 8px 28px rgba(2, 6, 23, 0.6);
	backdrop-filter: blur(8px);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 12px 16px;
	text-align: center;
	font-size: 15px;
}

th {
	background: rgba(97, 218, 251, 0.2);
	color: #fff;
	letter-spacing: 0.5px;
}

tr:nth-child(even) td {
	background: rgba(255, 255, 255, 0.05);
}

tr:hover td {
	background: rgba(97, 218, 251, 0.1);
	transition: background 0.3s;
}

/* Temperature coloring */
.cold {
	color: #4fc3f7;
	font-weight: bold;
}

.warm {
	color: #ffd54f;
	font-weight: bold;
}

.hot {
	color: #ff7043;
	font-weight: bold;
}

@media ( max-width : 600px) {
	th, td {
		padding: 8px 10px;
		font-size: 14px;
	}
	h2 {
		font-size: 22px;
	}
}

.footer {
	text-align: center;
	margin-top: 20px;
	font-size: 13px;
	color: rgba(255, 255, 255, 0.6);
}

.back-form {
	text-align: center;
	margin: 20px 0;
}

.back-btn {
	background: linear-gradient(135deg, #61dafb, #0ea5e9);
	border: none;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	padding: 10px 20px;
	border-radius: 25px;
	cursor: pointer;
	box-shadow: 0 4px 15px rgba(14, 165, 233, 0.4);
	transition: all 0.3s ease;
}

.back-btn:hover {
	background: linear-gradient(135deg, #0ea5e9, #61dafb);
	transform: scale(1.05);
	box-shadow: 0 6px 18px rgba(14, 165, 233, 0.6);
}
</style>
</head>
<body>
	<h2>5-Day / 3-Hour Weather Forecast</h2>
	<div class="forecast-card">
		<table>
			<tr>
				<th>Date & Time</th>
				<th>Min Temp (°C)</th>
				<th>Max Temp (°C)</th>
				<th>Weather</th>
			</tr>
			<c:forEach var="item" items="${forecast}">
				<tr>
					<td>${item.dateTime}</td>
					<!-- Min Temp coloring -->
					<td><c:choose>
							<c:when test="${item.main.tempMin lt 15}">
								<span class="cold">${item.main.tempMin}</span>
							</c:when>
							<c:when test="${item.main.tempMin lt 25}">
								<span class="warm">${item.main.tempMin}</span>
							</c:when>
							<c:otherwise>
								<span class="hot">${item.main.tempMin}</span>
							</c:otherwise>
						</c:choose></td>
					<!-- Max Temp coloring -->
					<td><c:choose>
							<c:when test="${item.main.tempMax lt 15}">
								<span class="cold">${item.main.tempMax}</span>
							</c:when>
							<c:when test="${item.main.tempMax lt 25}">
								<span class="warm">${item.main.tempMax}</span>
							</c:when>
							<c:otherwise>
								<span class="hot">${item.main.tempMax}</span>
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${item.weather[0].main == 'Clear'}">☀️ ${item.weather[0].description}</c:when>
							<c:when test="${item.weather[0].main == 'Clouds'}">☁️ ${item.weather[0].description}</c:when>
							<c:when test="${item.weather[0].main == 'Rain'}">🌧️ ${item.weather[0].description}</c:when>
							<c:when test="${item.weather[0].main == 'Drizzle'}">🌦️ ${item.weather[0].description}</c:when>
							<c:when test="${item.weather[0].main == 'Thunderstorm'}">⛈️ ${item.weather[0].description}</c:when>
							<c:when test="${item.weather[0].main == 'Snow'}">❄️ ${item.weather[0].description}</c:when>
							<c:otherwise>🌫️ ${item.weather[0].description}</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		<form action="/" class="back-form">
			<button type="submit" class="back-btn">⬅ Back to Home</button>
		</form>
	</div>
	<div class="footer">Weather Forecast Data powered by
		OpenWeatherMap</div>
</body>
</html>
