//
//  CreateTrip.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import Foundation

struct CreateTrip: Codable {
    let id: String
    let cityName: String
    let tripStartDate: String
    let tripEndDate: String
    let tripName: String
    let tripStyle: String
    let tripDescription: String
}
