//
//  WeatherViewController.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 30/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UICollectionViewDelegate, UICollectionViewDataSource{
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tempcLabel: UILabel!
    @IBOutlet weak var maxtenpcLabel: UILabel!
    @IBOutlet weak var mintempCLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    var weatherday: [WeatherDay] = []
    var weatherhourly: [WeatherHourlyDay] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionview.backgroundColor = UIColor.clear
        tableview.backgroundColor = UIColor.clear
        DataService.shared.getDataFromApiClosure { [unowned self] (forecastDay) in
            self.nameLabel.text = forecastDay.name
            self.countryLabel.text = forecastDay.country
            self.tempcLabel.text = String(Int(forecastDay.temp_c)) + "º"
            self.todayLabel.text = String(forecastDay.localtime_epoch.getDaysOfWeek())
            self.weatherday = forecastDay.weatherDay
            self.maxtenpcLabel.text = String(Int(self.weatherday[0].maxtemp_c)) + "º"
            self.mintempCLabel.text = String(Int(self.weatherday[0].mintemp_c)) + "º"
            self.tableview.reloadData()
        }
        DataService.shared.getDataFromApiHourlyDay { [unowned self] (hourlyDay) in
            self.weatherhourly = hourlyDay.weatherhourly
            self.collectionview.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherday.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.dateLabel.text = weatherday[indexPath.row + 1].date_epoch.getDaysOfWeek()
        cell.maxtemcLabel.text = String(Int(weatherday[indexPath.row + 1].maxtemp_c)) + "º"
        cell.mintempcLabel.text = String(Int(weatherday[indexPath.row + 1].mintemp_c)) + "º"
        cell.photoImage.imageUrlString(urlString: weatherday[indexPath.row + 1].icon, indexpath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherhourly.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WeatherCollectionViewCell
        cell.maxtemcLabel.text = weatherhourly[indexPath.row].tempC + "º"
        cell.timeLabel.text = weatherhourly[indexPath.row].time.gethourOfWeek(time: weatherhourly[indexPath.row].time)
        cell.photoImage.imageUrlString(urlString: weatherhourly[indexPath.row].value, indexpath: indexPath)
        return cell
    }
    
    
}

