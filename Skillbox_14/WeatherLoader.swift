import Foundation
//import SVProgressHUD
import Alamofire

class WeatherLoader {
    func loadWeather(completion: @escaping ([ForecastWeatherClass]) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=ef944e7afecb9a0f510d2e5743aaf123&lang=ru")!
        let request = URLRequest(url: url)
//        SVProgressHUD.show()
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let forecast = try! JSONDecoder().decode(ForecastLocalWeather.self, from: data)
            var forecastDays: [ForecastWeatherClass] = []
            for el in forecast.list {
                forecastDays.append(ForecastWeatherClass(temp: el.main.temp, temp_max: el.main.tempMax, temp_min: el.main.tempMin, speed: el.wind.speed, humidity: el.main.humidity, dt_txt: el.dt_txt, desc: el.weather[0].description, feels_like: Int64(el.main.feels_like)))
            }
            DispatchQueue.main.async {
                print(forecastDays.count)
                completion(forecastDays)
                Persistance.shared.saveWeatherArray(array: forecastDays)
                print(forecastDays.count)
//                SVProgressHUD.dismiss()
            }
        }
        task.resume()
    }
}
