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

class ForecastWeatherClass {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
    let speed: Double
    let humidity: Int
    let dt_txt: String
    let desc: String
    let feels_like: Int64
    
    init(temp: Double, temp_max: Double, temp_min: Double, speed: Double, humidity: Int, dt_txt: String, desc: String, feels_like: Int64) {
        self.temp = temp
        self.temp_max = temp_max
        self.temp_min = temp_min
        self.speed = speed
        self.humidity = humidity
        self.dt_txt = dt_txt
        self.desc = desc
        self.feels_like = feels_like
    }
}

struct ForecastLocalWeather: Decodable {
    let city: City
    let cnt: Int
    let cod: String
    let list: [List]
    let message: Int
    private enum CodingKeys: String, CodingKey {
        case city, cnt, cod, list, message
    }
}
struct List: Decodable {
    let clouds: Clouds
    let dt: Int
    let dt_txt: String
    let main: Main
//    let snow: Snow
    let sys: Sys
    let weather: [Weather]
    let wind: Wind
    private enum CodingKeys: String, CodingKey {
        case clouds, dt, dt_txt = "dt_txt", main, sys, weather, wind
    }
}
struct Clouds: Decodable {
    let all: Int
}
struct City: Decodable {
    let coord: Coord
    let country: String
    let id: Double
    let name: String
    let population: Int64
    let sunrise: Int64
    let sunset: Int64
    let timezone: Int64
    
}
struct Coord: Decodable {
    let lat: Double
    let lon: Double
}
struct Main: Decodable {
    let feels_like: Double
    let grnd_level: Int64
    let humidity: Int
    let pressure: Int
    let sea_level: Int
    let temp_kf: Double
    let temp: Double
    let tempMax: Double
    let tempMin: Double
    private enum CodingKeys: String, CodingKey {
        case feels_like = "feels_like", grnd_level = "grnd_level", humidity, pressure, sea_level = "sea_level", temp_kf = "temp_kf", temp, tempMax = "temp_max", tempMin = "temp_min"
    }
}
struct Sys: Decodable {
    let pod: String
}
struct Weather: Decodable {
    let description: String
    let icon: String
    let id: Int
    let main: String
}
struct Wind: Decodable {
    let deg: Int
    let speed: Double
}
struct Snow: Decodable {
    let threeH: Double
}
