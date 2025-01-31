//
//  Weatherdatamodel.swift
//  TaxCalc
//
//  Created by 이정규 on 6/7/24.
//

struct OpenWeatherResponse: Decodable {
    let name: String
    let main: OpenWeatherMain
    let weather: [OpenWeatherWeather]
    
    init(name: String, main: OpenWeatherMain, weather: [OpenWeatherWeather]) {
        self.name = name
        self.main = main
        self.weather = weather
    }
}

struct OpenWeatherMain: Decodable {
    let temp: Double
    
    init(temp: Double) {
        self.temp = temp
    }
}

struct OpenWeatherWeather: Decodable {
    let description: String
    let main: String
    
    init(description: String, main: String) {
        self.description = description
        self.main = main
    }
}

public struct Weather {
    let location: String
    let temperature: String
    let description: String
    let main: String
    
    init(response: OpenWeatherResponse) {
        location = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        main = response.weather.first?.main ?? ""
    }
}
