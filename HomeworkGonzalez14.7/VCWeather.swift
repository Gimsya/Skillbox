//
//  VCWeather.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit

class VCWeather: UIViewController {

    var requestModel: RequestModel?

  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    

     
    override func viewDidLoad() {
        super.viewDidLoad()
        VCWeatherLoader.shared.loadWeather{ [weak self] (model) in
            guard let self = self else {return}
            DispatchQueue.main.async {
            self.requestModel = model
            self.tableView.reloadData()
                let weather = Weather()
                Persistance.shared.realm.beginWrite()
                Persistance.shared.realm.add(weather)
                try! Persistance.shared.realm.commitWrite()
                print(Persistance.shared.realm.objects(Weather.self))
                           
            
        }
            self.cityLabel.text = model?.city.name
        }
        self.tableView.dataSource = self
        
    }
}

extension VCWeather: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let requestModel = requestModel else {return 0}
        return requestModel.list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VCWeatherCell", for: indexPath) as! VCWeatherCell
       
        guard let requestModel = requestModel else {return VCWeatherCell()}
        
        let datetime = requestModel.list[indexPath.row].dt_txt.components(separatedBy: " ")
        cell.dateLabel.text = "Date: \(datetime[0])"
        cell.timeLabel.text = "Time: \(datetime[1])"
        cell.tempLabel.text = String(requestModel.list[indexPath.row].main.temp) + "°С"
        cell.windLabel.text = "Wind speed:" + String(requestModel.list[indexPath.row].wind.speed)
        cell.humidityLabel.text = "Humidity:" + String(requestModel.list[indexPath.row].main.humidity)
        

        return cell
    }
}
