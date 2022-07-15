//
//  CarInfoViewModel.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 12.07.22.
//

import Foundation

final class CarInfoViewModel: ObservableObject {
    
    @Published private var car: CarModel?
    
    private let repository = CarRepository()
    
    func fetchData() {
        repository.fetchCar(complition: { car in
            switch result {
            case .success(let user):
                self.car = car
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        })
    }
    
    func getImage() -> String? {
        return car?.image
    }
    
    func getTitle() -> String? {
        return car?.title
    }
    
    func getModel() -> String? {
        return car?.model
    }
}
