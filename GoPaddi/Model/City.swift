//
//  City.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 16/10/2024.
//

import Foundation
import SwiftUI

struct City: Identifiable {
    var id = UUID()
    var name: String
    var capital: String
    var country: String
    var countryCode: String
    var countryFlag: Image
}
