//
//  WeeklyWeatherView.swift
//  TaxCalc
//
//  Created by 이정규 on 6/7/24.
//

import SwiftUI

// WeeklyWeatherView는 5일치 날씨 데이터를 표시하는 뷰입니다.
struct WeeklyWeatherView: View {
    var fiveDayWeatherResponse: FiveDayWeatherResponse
    
    // 날씨 상태에 따른 아이콘을 정의합니다.
    private let iconList = [
        "Clear": "☀️",
        "Clouds": "☁️",
        "Mist": "🌫",
        "": "?",
        "Drizzle": "🌧",
        "Thunderstorm": "⛈",
        "Rain": "🌧",
        "Snow": "🌨"
    ]
    
    var body: some View {
        VStack {
            // 각 날씨 항목을 표시합니다.
            ForEach(fiveDayWeatherResponse.list.prefix(40), id: \.dt) { weatherEntry in
                HStack {
                    Text(formattedDate(timeInterval: TimeInterval(weatherEntry.dt)))  // 날짜와 시간을 표시합니다.
                        .font(.title3)
                    Spacer()
                    Text("\(Int(weatherEntry.main.temp))°C")  // 온도를 표시합니다.
                        .bold()
                    Text(iconList[weatherEntry.weather.first?.main ?? ""] ?? "")  // 날씨 아이콘을 표시합니다.
                        .font(.title)
                }
                .padding()
            }
        }
    }
    
    // 시간 간격을 받아서 포맷된 날짜 문자열로 반환하는 메서드입니다.
    private func formattedDate(timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, h:mm a"  // 요일, 월 일, 시:분 오전/오후 형식으로 포맷합니다.
        return dateFormatter.string(from: date)
    }
}

