//
//  CarsResult.swift
//  CarsApp
//
//  Created by Aksel Avetisyan on 11.07.22.
//

import Foundation

struct CarsResult: Decodable {
    var data: Listing
}

struct Listing: Decodable {
    var listings: [CarModel]
}
