//
//  File.swift
//  Test_task
//
//  Created by Shamil Mazitov on 16.06.2022.
//

import Foundation


struct PrimaryData: Codable {
    let id: Int
    let startAddress, endAddress: Address
    let price: Price
    let orderTime: Date
    let vehicle: Vehicle
    
}

struct Address: Codable {
    let city, address: String
}

struct Price: Codable {
    let amount: Int
    let currency: String
}

struct Vehicle: Codable {
    let regNumber, modelName, photo, driverName: String
}

typealias Primary = [PrimaryData]





