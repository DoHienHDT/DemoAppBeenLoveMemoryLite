//
//  DataService.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 30/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
typealias DICT = Dictionary<AnyHashable, Any>
class DataService {
    static let shared: DataService = DataService()
    
    func getDataFromApiClosure(completion: @escaping (Forecastday) -> Void) {
        guard let url = URL(string: "https://api.apixu.com/v1/forecast.json?key=a9a98a4dc3f047d3a9265355180108&q=Paris&days=7") else {return}
        URLSession.shared.dataTask(with: url) { (data,_ ,error) in
            if error != nil {
                print(error!)
            } else {
                if let urlContent = data {
                    print(urlContent)
                    do {
                        guard let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .mutableContainers) as? DICT else {return}
                        let forecastDay = Forecastday(dictionary: jsonResult)
                        DispatchQueue.main.async {
                            completion(forecastDay)
                        }
                    } catch {
                        print("Error")
                    }
                }
            }
            }
        .resume()
    }
    func getDataFromApiHourlyDay(completion: @escaping (WeatherHourly) -> Void) {
        guard let url = URL(string: "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=885d24eb17e149d0b9720610180608&q=48.85,2.35&num_of_days=1&tp=1&format=json") else {return}
        URLSession.shared.dataTask(with: url) { (data,_ ,error) in
            if error != nil {
                print(error!)
            } else {
                if let urlContent = data {
                    print(urlContent)
                    do {
                        guard let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: .mutableContainers) as? DICT else {return}
                        let forecastDay = WeatherHourly(dictionary: jsonResult)
                        DispatchQueue.main.async {
                            completion(forecastDay)
                        }
                    } catch {
                        print("Error")
                    }
                }
            }
            }
            .resume()
    }
    
}
