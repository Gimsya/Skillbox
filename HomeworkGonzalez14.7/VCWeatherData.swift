//
//  VCWeatherData.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import Foundation
import RealmSwift

//class Weather: Object {
//    @objc dynamic var temp: Float = 0.0
//    @objc dynamic var speed: Float = 0.0
//    @objc dynamic var humidity: Int = 0
//    @objc dynamic var dt_txt: String = ""
//
//}

struct RequestModel: Codable {

    var cod: String
    var message: Float
    var cnt: Float
    var list: [ListModel]
    var city: CityModel
}
struct ListModel: Codable {

    var dt: Float
    var main: MainModel
    var weather: [WeatherModel]
//    var clouds: CloudsModel?
    var wind: WindModel
//    var visibility: Int?
//    var pop: Float?
//    var sys:SysModel?
//    var snow: SnowModel?
    var dt_txt: String
}
struct CityModel: Codable {

    var id: Float
    var name: String
//    var coord: CoordModel?
    var country: String
    var population: Float
//    var timezone: Int?
//    var sunrise: Int?
//    var sunset: Int?
}
struct MainModel: Codable {

    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
    var pressure: Int
//    var sea_level: Int?
//    var grnd_level: Int?
    var humidity: Int
//    var temp_kf: Int?
}
struct WeatherModel: Codable {

    var id: Int
    var main: String
    var description : String
    var icon: String
}
struct WindModel: Codable {

    var speed: Float
    var deg: Int
}
