//
//  Category.swift
//  SkillBox_12
//
//  Created by Sergey Chudarin on 11.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import Foundation

class Category {
    let humidity: Int64
    let temp: Double
    let tempMax: Double
    let tempMin: Double
    
    init?(data: NSDictionary) {
        guard let humidity = data["humidity"] as? Int64,
            let temp = data["temp"] as? Double,
            let tempMax = data["temp_max"] as? Double,
            let tempMin = data["temp_min"] as? Double else {
                return nil
        }
        self.humidity = humidity
        self.temp = temp
        self.tempMax = tempMax
        self.tempMin = tempMin
    }
}
