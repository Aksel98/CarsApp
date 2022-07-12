//
//  CarInfoViewModel.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import Foundation

final class CarInfoViewModel: ObservableObject {
    
    @Published var car: CarModel?
    
    func getCars() {
        let headers = [
            "X-RapidAPI-Key": "19e4baebfbmsh8c8d6d6a55ff028p13f81cjsn40223d21aaa8",
            "X-RapidAPI-Host": "cars20.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://cars20.p.rapidapi.com/extract/?zip_code=23831")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil, let data = data, let jsonData = try? JSONDecoder().decode(CarsResult.self, from: data) else {
                print(error?.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                self.car = jsonData.data.listings.filter({ !$0.image.isEmpty }).randomElement()
            }
        }).resume()
    }
}
