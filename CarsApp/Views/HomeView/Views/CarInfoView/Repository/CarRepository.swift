//
//  CarRepository.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 15.07.22.
//

import Foundation

struct CarRepository {
    
    func fetchCar(complition: @escaping (Result<User, Error>) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api?seed=renderforest&results=20&page=1") else { return }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                complition(.failure(error!))
                return
            }

            do {
                let data = try JSONDecoder().decode(Result_.self, from: data)

                DispatchQueue.main.async {
                    guard let user = data.results.randomElement() else { return }

                    complition(.success(user))
                }
            } catch {
                complition(.failure(error))
            }
        }).resume()
    }
}
