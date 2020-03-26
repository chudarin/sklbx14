//
//  ViewController.swift
//  SkillBox_12
//
//  Created by Sergey Chudarin on 11.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var tCategories: [Category] = []
    
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    
    func convertToCelsius(kelvin: Double) -> Int {
        return Int(kelvin - 273.15)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.humidity.text = Persistance.shared.humidity
        self.temp.text = Persistance.shared.temp
        self.tempMax.text = Persistance.shared.tempMax
        self.tempMin.text = Persistance.shared.tempMin 
        
        WeatherLoader().loadWeatherAlamifire(city: "Moscow") { (tCategories) in
            self.tCategories = tCategories
            self.humidity.text = "\(String(self.tCategories[0].humidity))%"
            self.temp.text = "\(String(self.convertToCelsius(kelvin: self.tCategories[0].temp)))°C"
            self.tempMax.text = "\(String(self.convertToCelsius(kelvin: self.tCategories[0].tempMax)))°C"
            self.tempMin.text = "\(String(self.convertToCelsius(kelvin: self.tCategories[0].tempMin)))°C"
            
            Persistance.shared.humidity = self.humidity.text
            Persistance.shared.temp = self.temp.text
            Persistance.shared.tempMax = self.tempMax.text
            Persistance.shared.tempMin = self.tempMin.text
        }
    }
}
