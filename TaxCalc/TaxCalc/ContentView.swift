import SwiftUI

// ContentView는 메인 뷰를 정의합니다.
struct ContentView: View {
    
    @EnvironmentObject var locationManager: LocationManager  // LocationManager 인스턴스를 환경 객체로 가져옵니다.
    var weatherDataDownload = WeatherDataDownload()  // WeatherDataDownload 인스턴스를 생성합니다.
    @State var fiveDayWeatherResponse: FiveDayWeatherResponse?  // 5일치 날씨 데이터를 저장하는 상태 변수입니다.
    
    var body: some View {
        ScrollView {  // 콘텐츠를 스크롤 가능하게 합니다.
            VStack {
                // 지명 정보가 있으면 표시합니다.
                if let placemark = locationManager.placemark {
                    Text("Location: \(placemark.locality ?? "Unknown")")
                        .font(.headline)
                        .padding(.top)
                }
                
                // 로딩 중이면 ProgressView를 표시합니다.
                if locationManager.isLoading {
                    ProgressView()
                } else {
                    // 위치 정보가 있으면 날씨 데이터를 가져와 표시합니다.
                     let location = locationManager.location
                        if let fiveDayWeatherResponse = fiveDayWeatherResponse {
                            WeeklyWeatherView(fiveDayWeatherResponse: fiveDayWeatherResponse)
                        } else {
                            ProgressView()
                                .task {
                                    do {
                                        fiveDayWeatherResponse = try await weatherDataDownload.get5DayWeather(location: location)
                                    } catch {
                                        print("Error downloading weather data: \(error)")
                                    }
                                }
                        }
                    }
                }
            }
        }
    }


