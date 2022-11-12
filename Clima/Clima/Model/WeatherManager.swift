//
//  WeatherManager.swift
//  Clima
//
//  Created by Eric Cabestany Mena on 3/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

//els protocols s'han de crear al mateix lloc on la classe el farà servir
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ac6dfcbe5d16a96c1729bc31fdb404f4&units=metric"
    
    var delegate : WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    //podem duplicar un mètode amb el mateix nom, sempre que els paràmetres que cridem siguin diferents
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
     //1. Crear la URL
        
        if let url = URL(string: urlString) {
            //2. Crear la URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. Crear la tasca amb la sessió de la URL
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    //dins els clousures sempre que cridem un mètode s'ha de fer amb el self, perquè sàpiga que
                    //estem executant un mètode de la pròpia estructura actual, si no ho fem, podria confondre's i agafar el propi de la estructura
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
            }
            
            //4. Executar la tasca (per defecte les tasques estan suspeses)
            task.resume()
            
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
