//
//  ForecastViewController.swift
//  SkillBox_12
//
//  Created by Sergey Chudarin on 13.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var forecastDays: [ForecastWeatherClass] = []
    
    func convertToCelsius(kelvin: Double) -> Int {
        return Int(kelvin - 273.15)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.tableView.rowHeight = 100
        if let data = Persistance.shared.getWeatherArray() {
            forecastDays = data
        }
        WeatherLoader().loadWeather(completion: { forecastDays in
            self.forecastDays = forecastDays
            self.tableView.reloadData()
        })
    }

}

extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WeatherTableViewCell
        
        let model = forecastDays[indexPath.row]
        cell.feelsLike.text = String(" По ощущениям\(convertToCelsius(kelvin: Double(model.feels_like)))")
        cell.temperatureMid.text = String(convertToCelsius(kelvin: model.temp))
        cell.temperatureMax.text = String("Макс. \(convertToCelsius(kelvin: model.temp_max))")
        cell.temperatureMin.text = String("Мин. \(convertToCelsius(kelvin: model.temp_min))")
        cell.windSpeed.text = String("Ветер \(model.speed)м/c")
        cell.humidity.text = String("Влажность \(model.humidity)%")
        cell.forecastDay.text = String(model.dt_txt)
        cell.weatherDesc.text = String(model.desc)
        return cell
    }
    
    
}
