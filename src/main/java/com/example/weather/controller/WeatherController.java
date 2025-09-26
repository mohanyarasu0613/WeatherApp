package com.example.weather.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.weather.model.WeatherResponse;
import com.example.weather.service.WeatherService;

@Controller
public class WeatherController {
	
	@Autowired
    private WeatherService weatherService;
    
    @GetMapping("/")
    public String index() {
    	System.out.println("index called()");
    	return "index";
    }

    @GetMapping("/current")
    public String getCurrentWeather(@RequestParam String city, Model model) {
    	WeatherResponse response = weatherService.getCurrentWeather(city);
        model.addAttribute("weather", response);
        if (response != null && response.getSys() != null) {
        	long sunriseSeconds = response.getSys().getSunrise();
        	long sunsetSeconds = response.getSys().getSunset();
        	model.addAttribute("sunriseDate", new Date(sunriseSeconds * 1000));
        	model.addAttribute("sunsetDate", new Date(sunsetSeconds * 1000));
        }
        return "current";
    }

    @GetMapping("/forecast")
    public String getWeatherForecast(@RequestParam String city) {
        return weatherService.getForecast(city);
    }

}
