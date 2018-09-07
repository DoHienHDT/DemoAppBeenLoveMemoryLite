//
//  Forecastday.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 30/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//
import UIKit
class Forecastday {
    var name: String
    var country: String
    var temp_c: Double
    var localtime_epoch: TimeInterval
    var weatherDay: [WeatherDay] = []
    init(dictionary: DICT) {
        let location = dictionary["location"] as? DICT ?? [:]
        name = location["name"] as? String ?? "-1"
        country = location["country"] as? String ?? "-1"
        localtime_epoch = location["localtime_epoch"] as? TimeInterval ?? -1
        let current = dictionary["current"] as? DICT ?? [:]
        temp_c = current["temp_c"] as? Double ?? -1
        let forecast = dictionary["forecast"] as? DICT ?? [:]
        let forecastday = forecast["forecastday"] as? [DICT] ?? []
        for dataWeather in forecastday {
            weatherDay.append(WeatherDay(dictionary: dataWeather))
        }
    }
}
struct WeatherDay {
    var date_epoch: TimeInterval
    var maxtemp_c: Double
    var mintemp_c: Double
    var icon: String
    init(dictionary: DICT) {
        date_epoch = dictionary["date_epoch"] as? TimeInterval ?? -1
        let day = dictionary["day"] as? DICT ?? [:]
        maxtemp_c = day["maxtemp_c"] as? Double ?? -1
        mintemp_c = day["mintemp_c"] as? Double ?? -1
        let condition = day["condition"] as? DICT ?? [:]
        icon = "http:" + (condition["icon"] as? String ?? "-1")
    }
}
