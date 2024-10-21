//
//  DropdownMenuOption.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 11/10/2024.
//

import Foundation

// We are going to use this type with ForEach, so we need to conform it to
// Hashable protocol.
struct DropdownMenuOption:Codable, Identifiable, Hashable {
  var id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let testSingleMonth: DropdownMenuOption = DropdownMenuOption(option: "March")
    static let testAllMonths: [DropdownMenuOption] = [
        DropdownMenuOption(option: "January"),
        DropdownMenuOption(option: "February"),
        DropdownMenuOption(option: "March"),
        DropdownMenuOption(option: "April"),
        DropdownMenuOption(option: "May"),
        DropdownMenuOption(option: "June"),
        DropdownMenuOption(option: "July"),
        DropdownMenuOption(option: "August"),
        DropdownMenuOption(option: "September"),
        DropdownMenuOption(option: "October"),
        DropdownMenuOption(option: "November"),
        DropdownMenuOption(option: "December")
    ]
    
    static let tripOptions: [DropdownMenuOption] = [
        //DropdownMenuOption(option: "Planned Trips")
    ]
    
    static let tripTypes: [DropdownMenuOption] = [
        DropdownMenuOption(option: "Solo"),
        DropdownMenuOption(option: "Couple"),
        DropdownMenuOption(option: "Family"),
        DropdownMenuOption(option: "Group")
    ]
}
