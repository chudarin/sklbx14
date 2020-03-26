//
//  WeatherLoader.swift
//  SkillBox_12
//
//  Created by Sergey Chudarin on 11.03.2020.
//  Copyright © 2020 Sergey Chudarin. All rights reserved.
//

import Foundation
//import SVProgressHUD
import Alamofire

class WeatherLoader {
    func loadWeatherAlamifire (city: String, completion: @escaping ([Category]) -> Void) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?q=\(String(city))&appid=ef944e7afecb9a0f510d2e5743aaf123").responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? NSDictionary {
                    var tCategories: [Category] = []
                    for (_, data) in JSON where data is NSDictionary {
                        if let category = Category(data: data as! NSDictionary) {
                            tCategories.append(category)
                        }
                    }
                    DispatchQueue.main.async {
                        completion(tCategories)
                    }
                }
            case .failure(_): break
            }
        }
    }
}
