package com.example.weather.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ForecastResponse {
    private List<ForecastItem> list;

    public List<ForecastItem> getList() {
        return list;
    }

    public void setList(List<ForecastItem> list) {
        this.list = list;
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ForecastItem {
        private long dt;

        @JsonProperty("dt_txt")
        private String dateTime;

        private Main main;
        private List<Weather> weather;

        public long getDt() { return dt; }
        public void setDt(long dt) { this.dt = dt; }

        public String getDateTime() { return dateTime; }
        public void setDateTime(String dateTime) { this.dateTime = dateTime; }

        public Main getMain() { return main; }
        public void setMain(Main main) { this.main = main; }

        public List<Weather> getWeather() { return weather; }
        public void setWeather(List<Weather> weather) { this.weather = weather; }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Main {
        @JsonProperty("temp_min")
        private double tempMin;

        @JsonProperty("temp_max")
        private double tempMax;

        public double getTempMin() { return tempMin; }
        public void setTempMin(double tempMin) { this.tempMin = tempMin; }

        public double getTempMax() { return tempMax; }
        public void setTempMax(double tempMax) { this.tempMax = tempMax; }
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Weather {
        private String main;
        private String description;

        public String getMain() { return main; }
        public void setMain(String main) { this.main = main; }

        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
    }

}
