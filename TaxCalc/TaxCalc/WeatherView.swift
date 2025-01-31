//
//  WeatherView.swift
//  TaxCalc
//
//  Created by 이정규 on 6/7/24.
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
    
    private func formattedDate(timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, h:mm a"
        return dateFormatter.string(from: date)
    }
}
