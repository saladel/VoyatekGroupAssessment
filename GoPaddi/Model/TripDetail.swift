//
//  TripDetail.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 10/10/2024.
//

import Foundation

struct TripDetail: Identifiable, Codable {
    let id: Int
    let image: String?
    let tripName: String
    let tripDestination: String
    let tripStartDate: String
    let tripEndDate: String
    let tripLocation: String
    let tripType: String
    let flightInformation: FlightInformation?
    let hotelInformation: HotelInformation?
    let activityInformation: ActivityInformation?
    
    func totalDays() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        
        let trimmedStartDate = tripStartDate.replacingOccurrences(of: "(st|nd|rd|th)", with: "", options: .regularExpression)
        let trimmedEndDate = tripEndDate.replacingOccurrences(of: "(st|nd|rd|th)", with: "", options: .regularExpression)
        
        guard let startDate = dateFormatter.date(from: trimmedStartDate),
              let endDate = dateFormatter.date(from: trimmedEndDate) else {
            return "Wrong date format"
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        
        return components.day.map { "\($0) days" }
    }
}

struct FlightInformation: Codable {
    let flightName: String?
    let flightNumber: String?
    let flightTakeOffTime: String?
    let flightTakeOffDate: String?
    let flightArrivalTime: String?
    let flightArrivalDate: String?
    let flightType: String?
    let takeOffCityCode: String?
    let arrivalCityCode: String?
    let flightCost: String?
    
    func flightDuration() -> String? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            guard let takeOffTime = flightTakeOffTime,
                  let arrivalTime = flightArrivalTime,
                  let startDate = dateFormatter.date(from: takeOffTime),
                  let endDate = dateFormatter.date(from: arrivalTime) else {
                return "Invalid time format"
            }
            
            // Calculate time difference
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: startDate, to: endDate)
            
            // Handle negative differences (overnight flights)
            var hour = components.hour ?? 0
            var minute = components.minute ?? 0
            
            // If the arrival time is earlier than the take-off time, add 24 hours (for overnight flights)
            if hour < 0 || (hour == 0 && minute < 0) {
                let adjustedComponents = calendar.dateComponents([.hour, .minute], from: startDate, to: endDate.addingTimeInterval(24 * 60 * 60))
                hour = adjustedComponents.hour ?? 0
                minute = adjustedComponents.minute ?? 0
            }
            
            // Return flight duration 
            return "\(hour)h \(minute)m"
        }
}

struct HotelInformation: Codable {
    let hotelImage: String?
    let hotelName: String?
    let hotelRating: String?
    let hotelTotalReviews: String?
    let hotelAddress: String?
    let roomType: String?
    let checkInDate: String?
    let checkOutDate: String?
    let hotelPrice: String?
}

struct ActivityInformation: Codable {
    let activityImage: String?
    let activityName: String?
    let activityDescription: String?
    let activityLocation: String?
    let activityDuration: String?
    let checkOutDate: String?
    let activityRating: String?
    let activityTotalReviews: String?
    let activityPrice: String?
}


