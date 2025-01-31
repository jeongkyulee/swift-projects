//
//  WeatherView.swift
//  NewWeather
//
//  Created by 김형관 on 2023/04/25.
//
import SwiftUI

struct WeatherView: View {
    
    var openWeatherResponse: OpenWeatherResponse
    
    private let iconList = [
        "Clear": "☀️",
        "Clouds": "☁️",
        "Mist": "☁️",
        "": "?",
        "Drizzle": "🌧",
        "Thunderstorm": "⛈",
        "Rain": "🌧",
        "Snow": "🌨"
    ]
    
    var body: some View {
        VStack {
            Text(Weather(response: openWeatherResponse).location)
                .font(.largeTitle)
                .padding()
            Text(Weather(response: openWeatherResponse).temperature)
                .font(.system(size: 75))
                .bold()
            Text(iconList[Weather(response: openWeatherResponse).main] ?? "")
                .font(.largeTitle)
                .padding()
            Text(Weather(response: openWeatherResponse).description)
                .font(.largeTitle)
                .padding()
        }
    }
}
