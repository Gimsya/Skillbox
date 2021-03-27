//
//  VCWeatherLoader.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/27/21.
//

import Foundation
import Alamofire


class VCWeatherLoader {
    
    static let shared: VCWeatherLoader = VCWeatherLoader()
    
    func loadWeather (result: @escaping ((RequestModel?)->())){

        let city = "Miami"
        let API_KEY = "fb673def53e2023a81428b34420e4fc0"

        
        AF.request("http://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&lang=ru&appid=\(API_KEY)").responseDecodable(of: RequestModel.self) { response in
            result(response.value)
            
        }
    }
}
