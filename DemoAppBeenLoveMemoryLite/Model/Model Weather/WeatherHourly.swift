//
//  WeatherHourly.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 30/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//


import UIKit
class WeatherHourly {
    var weatherhourly: [WeatherHourlyDay] = []
    init(dictionary: DICT) {
        let data = dictionary["data"] as? DICT ?? [:]
        let weather = data["weather"] as? [DICT] ?? []
        let zero = weather[0]
        let hourly = zero["hourly"] as? [DICT] ?? []
        for hourlyWeather in hourly {
            weatherhourly.append(WeatherHourlyDay(dictionary: hourlyWeather))
        }
    }
}
struct WeatherHourlyDay {
    var tempC: String
    var time: String
    var value: String
    init(dictionary: DICT) {
        time = dictionary["time"] as? String ?? "-1"
        tempC = dictionary["tempC"] as? String ?? "-1"
        let weatherIconUrl = dictionary["weatherIconUrl"] as? [DICT] ?? []
        let zero = weatherIconUrl[0]
        value = zero["value"] as? String ?? "-1"
    }
}
